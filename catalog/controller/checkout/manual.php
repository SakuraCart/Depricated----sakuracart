<?php
class ControllerCheckoutManual extends Controller {
	public function index() {
		$json = array();

		$this->load->library('user');
		$this->user = new User($this->registry);
		if ($this->user->isLogged()) {
			// Reset everything
			$this->cart->clear();
			$this->customer->logout();
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);

			// Settings
			$this->load->model('setting/setting');
			$settings = $this->model_setting_setting->getSetting('config', $this->request->post['store_id']);
			foreach ($settings as $key => $value) {
				$this->config->set($key, $value);
			}
			// Login Customer
			if ($this->request->post['customer_id']) {
				$this->load->model('account/customer');

				$customer_info = $this->model_account_customer->getCustomer($this->request->post['customer_id']);

				if ($customer_info) {
					$this->customer->login($customer_info['email'], '', true);
				}
			}

			// Tax
			$this->tax = new Tax($this->registry);

			// Products
			if (isset($this->request->post['order_product'])) {
				foreach ($this->request->post['order_product'] as $order_product) {
					if (isset($order_product['order_option'])) {
						$order_option = $order_product['order_option'];
					} else {
						$order_option = array();
					}

					$this->cart->add($order_product['product_id'], $order_product['quantity'], $order_option);
				}
			}
			if (isset($this->request->post['product_id'])) {
				$this->load->model('catalog/product');

				$product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);

				if ($product_info) {
					if (isset($this->request->post['quantity'])) {
						$quantity = $this->request->post['quantity'];
					} else {
						$quantity = 1;
					}

					if (isset($this->request->post['option'])) {
						$option = array_filter($this->request->post['option']);
					} else {
						$option = array();
					}

					$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

					foreach ($product_options as $product_option) {
						if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
							$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
						}
					}

					if (!$json) {
						$this->cart->add($this->request->post['product_id'], $quantity, $option);
					}
				}

				// Products
				$json['order_product'] = array();

				foreach ($this->cart->getProducts() as $product) {
					$option_data = array();
					foreach ($product['option'] as $option) {
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => (strlen($option['option_value']) > 20 ? utf8_substr($option['option_value'], 0, 20) . '..' : $option['option_value'])
						);
					}

					$json['order_product'][] = array(
						'product_id' => $product['product_id'],
						'name'       => $product['name'],
						'model'      => $product['model'],
						'option'     => $option_data,
						'quantity'   => $product['quantity'],
						'price'      => $product['price'],
						'total'      => $product['total'],
						'tax'        => $this->tax->getTax($product['total'], $product['tax_class_id']));
				}

				$this->load->model('setting/extension');

				$this->load->model('localisation/country');
				$this->load->model('localisation/zone');

				// Shipping
				$json['shipping_method'] = array();

				if ($this->cart->hasShipping()) {
					$country_info = $this->model_localisation_country->getCountry($this->request->post['shipping_country_id']);

					if ($country_info) {
						$country = $country_info['name'];
						$iso_code_2 = $country_info['iso_code_2'];
						$iso_code_3 = $country_info['iso_code_3'];
						$address_format = $country_info['address_format'];
					} else {
						$country = '';
						$iso_code_2 = '';
						$iso_code_3 = '';
						$address_format = '';
					}

					$zone_info = $this->model_localisation_zone->getZone($this->request->post['shipping_zone_id']);

					if ($zone_info) {
						$zone = $zone_info['name'];
						$code = $zone_info['code'];
					} else {
						$zone = '';
						$code = '';
					}

					$address_data = array(
						'firstname'      => $this->request->post['shipping_firstname'],
						'lastname'       => $this->request->post['shipping_lastname'],
						'company'        => $this->request->post['shipping_company'],
						'address_1'      => $this->request->post['shipping_address_1'],
						'address_2'      => $this->request->post['shipping_address_2'],
						'postcode'       => $this->request->post['shipping_postcode'],
						'city'           => $this->request->post['shipping_city'],
						'zone_id'        => $this->request->post['shipping_zone_id'],
						'zone'           => $zone,
						'zone_code'      => $code,
						'country_id'     => $this->request->post['shipping_country_id'],
						'country'        => $country,
						'iso_code_2'     => $iso_code_2,
						'iso_code_3'     => $iso_code_3,
						'address_format' => $address_format
					);

					$results = $this->model_setting_extension->getExtensions('shipping');

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('shipping/' . $result['code']);

							$quote = $this->{'model_shipping_' . $result['code']}->getQuote($address_data);

							if ($quote) {
								$json['shipping_method'][$result['code']] = array(
									'title'      => $quote['title'],
									'quote'      => $quote['quote'],
									'sort_order' => $quote['sort_order'],
									'error'      => $quote['error']
								);
							}
						}
					}
					$sort_order = array();

					foreach ($json['shipping_method'] as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}
					array_multisort($sort_order, SORT_ASC, $json['shipping_method']);
				}

				if (!empty($this->request->post['shipping_code'])) {
					$shipping = explode('.', $this->request->post['shipping_code']);

					if (isset($shipping[0]) && isset($shipping[1]) && isset($json['shipping_method'][$shipping[0]]['quote'][$shipping[1]])) {
						$this->session->data['shipping_method'] = $json['shipping_method'][$shipping[0]]['quote'][$shipping[1]];
					} else {
						unset($this->session->data['shipping_method']);
					}
				} else {
					unset($this->session->data['shipping_method']);
				}

				// Coupon
				if (!empty($this->request->post['coupon'])) {
					$this->load->model('checkout/coupon');

					$coupon_info = $this->model_checkout_coupon->getCoupon($this->request->post['coupon']);
					if ($coupon_info) {
						$this->session->data['coupon'] = $this->request->post['coupon'];
					} else {
						$json['error']['coupon'] = $this->language->get('error_coupon');
					}
				}

				// Voucher
				if (!empty($this->request->post['voucher'])) {
					$this->load->model('checkout/voucher');

					$voucher_info = $this->model_checkout_voucher->getVoucher($this->request->post['voucher']);
					if ($voucher_info) {
						$this->session->data['voucher'] = $this->request->post['voucher'];
					} else {
						$json['error']['voucher'] = $this->language->get('error_voucher');
					}
				}

				// Reward Points
				if (!empty($this->request->post['reward'])) {
					$points = $this->customer->getRewardPoints();

					if ($this->request->post['reward'] > $points) {
						$json['error']['reward'] = sprintf($this->language->get('error_points'), $this->request->post['reward']);
					}

					if (!isset($json['error']['reward'])) {
						$points_total = 0;

						foreach ($this->cart->getProducts() as $product) {
							if ($product['points']) {
								$points_total += $product['points'];
							}
						}

						if ($this->request->post['reward'] > $points_total) {
							$json['error']['reward'] = sprintf($this->language->get('error_maximum'), $points_total);
						}

						$this->session->data['reward'] = $this->request->post['reward'];
					}
				}

				// Totals
				$json['order_total'] = array();
				$total = 0;
				$taxes = $this->cart->getTaxes();

				$sort_order = array();

				$results = $this->model_setting_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);
						$this->{'model_total_' . $result['code']}->getTotal($json['order_total'], $total, $taxes);
					}
				}

				// Payment
				$json['payment_methods'] = array();

				$country_info = $this->model_localisation_country->getCountry($this->request->post['payment_country_id']);

				if ($country_info) {
					$country = $country_info['name'];
					$iso_code_2 = $country_info['iso_code_2'];
					$iso_code_3 = $country_info['iso_code_3'];
					$address_format = $country_info['address_format'];
				} else {
					$country = '';
					$iso_code_2 = '';
					$iso_code_3 = '';
					$address_format = '';
				}

				$zone_info = $this->model_localisation_zone->getZone($this->request->post['payment_zone_id']);

				if ($zone_info) {
					$zone = $zone_info['name'];
					$code = $zone_info['code'];
				} else {
					$zone = '';
					$code = '';
				}

				$address_data = array(
					'firstname'      => $this->request->post['payment_firstname'],
					'lastname'       => $this->request->post['payment_lastname'],
					'company'        => $this->request->post['payment_company'],
					'address_1'      => $this->request->post['payment_address_1'],
					'address_2'      => $this->request->post['payment_address_2'],
					'postcode'       => $this->request->post['payment_postcode'],
					'city'           => $this->request->post['payment_city'],
					'zone_id'        => $this->request->post['payment_zone_id'],
					'zone'           => $zone,
					'zone_code'      => $code,
					'country_id'     => $this->request->post['payment_country_id'],
					'country'        => $country,
					'iso_code_2'     => $iso_code_2,
					'iso_code_3'     => $iso_code_3,
					'address_format' => $address_format
				);

				$results = $this->model_setting_extension->getExtensions('payment');
				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('payment/' . $result['code']);

						$method = $this->{'model_payment_' . $result['code']}->getMethod($address_data, $total);

						if ($method) {
							$json['payment_method'][$result['code']] = $method;
						}
					}
				}

				$sort_order = array();

				foreach ($json['payment_method'] as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $json['payment_method']);
				// Reset everything
				$this->cart->clear();
				$this->customer->logout();

				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['coupon']);
				unset($this->session->data['reward']);
				unset($this->session->data['voucher']);
				unset($this->session->data['vouchers']);
			}

		}
		$this->response->setOutput(json_encode($json));
	}
}
