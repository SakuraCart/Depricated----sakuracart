<?php
class ControllerCheckoutCart extends Controller {
	public function index() {
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('checkout/cart'));

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (isset($this->request->post['quantity'])) {
				foreach ($this->request->post['quantity'] as $key => $value) {
					$this->cart->update($key, $value);
				}
			}

			if (isset($this->request->post['remove'])) {
				foreach ($this->request->post['remove'] as $key) {
		 			$this->cart->remove($key);
				}
			}
			if (isset($this->request->post['voucher']) && $this->request->post['voucher']) {
				foreach ($this->request->post['voucher'] as $key) {
		 			if (isset($this->session->data['vouchers'][$key])) {
						unset($this->session->data['vouchers'][$key]);
					}
				}
			}
			if (isset($this->request->post['quantity']) || isset($this->request->post['remove']) || isset($this->request->post['voucher'])) {
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['shipping_method']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['reward']);

				$this->redirect($this->url->link('checkout/cart'));
			}
		}

		$this->document->setTitle($this->language->get('heading_title'));
/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home'),
			'text'      => $this->language->get('text_home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/cart'),
			'text'      => $this->language->get('heading_title'),
			'separator' => $this->language->get('text_separator')
		);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('common/home'),
			$this->language->get('text_home'),
			false
		);

		$this->document->addBreadcrumbs(
			$this->url->link('checkout/cart'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		if ($this->cart->hasProducts() || (isset($this->session->data['vouchers']) && $this->session->data['vouchers'])) {
			$points = $this->customer->getRewardPoints();
			$points_total = 0;
			foreach ($this->cart->getProducts() as $product) {
				if ($product['points']) {
					$points_total += $product['points'];
				}
			}

			$this->data['entry_reward'] = sprintf($this->language->get('entry_reward'), $points_total);

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$this->data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$this->data['attention'] = '';
			}

			if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
				$this->data['error_warning'] = $this->language->get('error_stock');
			} elseif (isset($this->session->data['error'])) {
				$this->data['error_warning'] = $this->session->data['error'];

				unset($this->session->data['error']);
			} else {
				$this->data['error_warning'] = '';
			}

			if (isset($this->session->data['success'])) {
				$this->data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$this->data['success'] = '';
			}

			if ($this->config->get('config_cart_weight')) {
				$this->data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$this->data['weight'] = false;
			}

			$this->load->model('tool/image');
			$this->data['products'] = array();
			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}
				if ($product['minimum'] > $product_total) {
					$this->data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				foreach ($product['option'] as $option) {
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (strlen($option['option_value']) > 20 ? utf8_substr($option['option_value'], 0, 20) . '..' : $option['option_value'])
					);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($product['total'], $product['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$total = false;
				}

				$this->data['products'][] = array(
		 			'key'      => $product['key'],
		 			'thumb'    => $image,
					'name'     => $product['name'],
		 			'model'    => $product['model'],
		 			'option'   => $option_data,
		 			'quantity' => $product['quantity'],
		 			'stock'    => $product['stock'],
					'reward'   => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'    => $price,
					'total'    => $total,
					'href'     => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
			}
			// Gift Voucher
			$this->data['vouchers'] = array();

			if (isset($this->session->data['vouchers']) && $this->session->data['vouchers']) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$this->data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'])
					);
				}
			}

			if (isset($this->session->data['coupon'])) {
				$this->data['coupon'] = $this->session->data['coupon'];
			} else {
				$this->data['coupon'] = '';
			}
			if (isset($this->session->data['voucher'])) {
				$this->data['voucher'] = $this->session->data['voucher'];
			} else {
				$this->data['voucher'] = '';
			}
			if (isset($this->session->data['reward'])) {
				$this->data['reward'] = $this->session->data['reward'];
			} else {
				$this->data['reward'] = '';
			}

			if (isset($this->session->data['guest']['shipping']['country_id'])) {
				$this->data['country_id'] = $this->session->data['guest']['shipping']['country_id'];
			} else {
				$this->data['country_id'] = $this->config->get('config_country_id');
			}

			$this->load->model('localisation/country');
			$this->data['countries'] = $this->model_localisation_country->getCountries();

			if (isset($this->session->data['guest']['shipping']['zone_id'])) {
				$this->data['zone_id'] = $this->session->data['guest']['shipping']['zone_id'];
			} else {
				$this->data['zone_id'] = '';
			}
			if (isset($this->session->data['guest']['shipping']['postcode'])) {
				$this->data['postcode'] = $this->session->data['guest']['shipping']['postcode'];
			} else {
				$this->data['postcode'] = '';
			}
			if (isset($this->session->data['shipping_methods'])) {
				$this->data['shipping_methods'] = $this->session->data['shipping_methods'];
			} else {
				$this->data['shipping_methods'] = array();
			}
			if (isset($this->session->data['shipping_method']['code'])) {
				$this->data['code'] = $this->session->data['shipping_method']['code'];
			} else {
				$this->data['code'] = '';
			}
			$this->data['shipping_status'] = $this->cart->hasShipping();
			// Totals
			$this->load->model('setting/extension');
			$total_data = array();
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
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}

				$sort_order = array();

				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $total_data);
			}

			$this->data['totals'] = $total_data;

			$this->data['continue'] = $this->url->link('common/home');

			$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		$this->document->addScript(URL_JS . 'mylibs/cart.js');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/table.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_style.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_page.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/jquery/smoothness/jquery-ui-1.8.4.custom.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_jui.css');


//			$this->data['box_position'] = $setting['position'] ?: '';
			$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/cart.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/cart.tpl';
			} else {
				$this->template = 'default/template/checkout/cart.tpl';
			}

			$this->children = array(
			'common/content_center',
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_footer',
			'common/footer',
			'common/header'
			);

			$this->response->setOutput($this->render());
		} else {
			$this->data = array_merge($this->data, $this->load->language('error/not_found'));
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
			'common/content_center',
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_footer',
			'common/footer',
			'common/header'
			);

			$this->response->setOutput($this->render());
		}
	}

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('checkout/cart'));

		$json = array();

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

					$json['success'] = sprintf($this->language->get('text_cart_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));

					unset($this->session->data['shipping_methods']);
					unset($this->session->data['shipping_method']);
					unset($this->session->data['payment_methods']);
					unset($this->session->data['payment_method']);

					// Products
				//	$json['product'] = $this->getProducts();
					// Totals
					$this->load->model('setting/extension');

					$total_data = array();
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

							$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
						}

						$sort_order = array();

						foreach ($total_data as $key => $value) {
							$sort_order[$key] = $value['sort_order'];
						}
						array_multisort($sort_order, SORT_ASC, $total_data);
					}

					$json['total'] = $total_data;
				} else {
					$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function remove() {
		$this->language->load('checkout/cart');
		$json = array();
		if (isset($this->request->post['key'])) {
			$this->cart->remove($this->request->post['key']);
			$json['success'] = $this->language->get('text_success');
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['payment_method']);
			$this->load->model('setting/extension');
			$total_data = array();
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

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}

				$sort_order = array();

				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
				array_multisort($sort_order, SORT_ASC, $total_data);
			}
			$json['total'] = $total_data;

			if ($this->cart->hasProducts()) {

			} else {
				$json['redirect'] = $this->url->link('checkout/cart');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function coupon() {
		$this->language->load('checkout/cart');
		$json = array();
		if (!$this->cart->hasProducts()) {
			$json['error'] = $this->language->get('error_product');
		} if (empty($this->request->post['coupon'])) {
			$json['error'] = $this->language->get('error_empty');
		} if (!$json) {
			$this->load->model('checkout/coupon');
			$coupon_info = $this->model_checkout_coupon->getCoupon($this->request->post['coupon']);
			if ($coupon_info) {
				$this->session->data['coupon'] = $this->request->post['coupon'];

				$this->session->data['success'] = $this->language->get('text_coupon_success');

				$json['redirect'] = $this->url->link('checkout/cart');
			} else {
				$json['error'] = $this->language->get('error_coupon');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function voucher() {
		$this->language->load('checkout/cart');
		$json = array();
		if (!$this->cart->hasProducts()) {
			$json['error'] = $this->language->get('error_product');
		} if (empty($this->request->post['voucher'])) {
			$json['error'] = $this->language->get('error_empty');
		} if (!$json) {
			$this->load->model('checkout/voucher');
			$voucher_info = $this->model_checkout_voucher->getVoucher($this->request->post['voucher']);
			if ($voucher_info) {
				$this->session->data['voucher'] = $this->request->post['voucher'];

				$this->session->data['success'] = $this->language->get('text_voucher_success');

				$json['redirect'] = $this->url->link('checkout/cart');
			} else {
				$json['error'] = $this->language->get('error_voucher');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function reward() {
		$this->language->load('checkout/cart');
		$json = array();
		if (!$this->cart->hasProducts()) {
			$json['error'] = $this->language->get('error_product');
		}
		if (empty($this->request->post['reward'])) {
			$json['error'] = $this->language->get('error_empty');
		}
		$points = $this->customer->getRewardPoints();
		if ($this->request->post['reward'] > $points) {
			$json['error'] = sprintf($this->language->get('error_points'), $this->request->post['reward']);
		}
		$points_total = 0;
		foreach ($this->cart->getProducts() as $product) {
			if ($product['points']) {
				$points_total += $product['points'];
			}
		}
		if ($this->request->post['reward'] > $points_total) {
			$json['error'] = sprintf($this->language->get('error_maximum'), $points_total);
		}
		if (!$json) {
			$this->session->data['reward'] = $this->request->post['reward'];
			$this->session->data['success'] = $this->language->get('text_reward_success');
			$json['redirect'] = $this->url->link('checkout/cart');
		}
		$this->response->setOutput(json_encode($json));
	}

	public function quote() {
		$this->language->load('checkout/cart');
		$json = array();
		if (!$this->cart->hasProducts()) {
			$json['error']['warning'] = $this->language->get('error_product');
		}

		if (!$this->cart->hasShipping()) {
			$json['error']['warning'] = $this->language->get('error_product');
		}
		if (!isset($this->request->post['country_id']) || $this->request->post['country_id'] == '') {
			$json['error']['country'] = $this->language->get('error_country');
		}
		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
			$json['error']['zone'] = $this->language->get('error_zone');
		}
		$this->load->model('localisation/country');
		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
		if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
			$json['error']['postcode'] = $this->language->get('error_postcode');
		}

		if (!$json) {
			$this->tax->setShippingAddress($this->request->post['country_id'], $this->request->post['zone_id']);
			$this->session->data['guest']['shipping']['country_id'] = $this->request->post['country_id'];
			$this->session->data['guest']['shipping']['zone_id'] = $this->request->post['zone_id'];
			$this->session->data['guest']['shipping']['postcode'] = $this->request->post['postcode'];
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
			$this->load->model('localisation/zone');
			$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);
			if ($zone_info) {
				$zone = $zone_info['name'];
				$code = $zone_info['code'];
			} else {
				$zone = '';
				$code = '';
			}
			$address_data = array(
				'firstname'      => '',
				'lastname'       => '',
				'company'        => '',
				'address_1'      => '',
				'address_2'      => '',
				'postcode'       => $this->request->post['postcode'];
				'city'           => '',
				'zone_id'        => $this->request->post['zone_id'];
				'zone'           => $zone,
				'zone_code'      => $code,
				'country_id'     => $this->request->post['country_id'];
				'country'        => $country;
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format
			);
			$quote_data = array();
			$this->load->model('setting/extension');
			$results = $this->model_setting_extension->getExtensions('shipping');
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('shipping/' . $result['code']);

					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($address_data);
					if ($quote) {
						$quote_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}
			$sort_order = array();

			foreach ($quote_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $quote_data);
			$this->session->data['shipping_methods'] = $quote_data;
			if ($this->session->data['shipping_methods']) {
				$json['shipping_method'] = $this->session->data['shipping_methods'];
			} else {
				$json['error']['warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
			}
		} $this->response->setOutput(json_encode($json));
	}

	public function shipping() {
		$this->language->load('checkout/cart');
		$json = array();

		if (!$this->cart->hasProducts()) {
			$json['error'] = $this->language->get('error_product');
		}
		if (!$this->cart->hasShipping()) {
			$json['error'] = $this->language->get('error_product');
		}
		if (!empty($this->request->post['shipping_method'])) {
			$shipping = explode('.', $this->request->post['shipping_method']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$json['error'] = $this->language->get('error_shipping');
			}
		} else {
			$json['error'] = $this->language->get('error_shipping');
		}
		if (!$json) {
			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];

			$this->session->data['success'] = $this->language->get('text_shipping_success');
			$json['redirect'] = $this->url->link('checkout/cart');
		}
		$this->response->setOutput(json_encode($json));
	}

	public function zone() {
		$output = '<option value="">' . $this->language->get('text_select') . '</option>';
		$this->load->model('localisation/zone');

		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';
	   	if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
				$output .= ' selected="selected"';
	   	}
	   	$output .= '>' . $result['name'] . '</option>';
		}
		if (!$results) {
			$output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
		}
		$this->response->setOutput($output);
	}
/*	private function getProducts() {
		$product_data = array();
		foreach ($this->cart->getProducts() as $product) {
			$option_data = array();
			foreach ($product['option'] as $option) {
				$option_data[] = array(
					'product_option_id'       => $option['product_option_id'],
					'product_option_value_id' => $option['product_option_value_id'],
					'name'                    => $option['name'],
					'value'                   => $option['option_value'],
					'type'                    => $option['type']
				);
			}
			$download_data = array();
			foreach ($product['download'] as $download) {
				$download_data[] = array(
					'name'      => $download['name'],
					'filename'  => $download['filename'],
					'mask'      => $download['mask'],
					'remaining' => $download['remaining']
				);
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['total'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$total = false;
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$tax = $this->tax->getTax($product['total'], $product['tax_class_id']);
			} else {
				$tax = false;
			}

			$product_data[] = array(
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'model'      => $product['model'],
				'option'     => $option_data,
				'download'   => $download_data,
				'quantity'   => $product['quantity'],
				'price'      => $price;
				'total'      => $total;
				'tax'        => $tax,
				'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id']));
		}
		return $product_data;
	}

	public function getTotals() {
	}
*/
}
