<?php
class ControllerCheckoutCheckout extends Controller {
	public function index() {
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->redirect($this->url->link('checkout/cart'));
		}
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->redirect($this->url->link('checkout/cart'));
			}
		}

		$this->data = array_merge($this->data, $this->load->language('checkout/checkout'));
		$this->document->setTitle($this->language->get('heading_title'));

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_cart'),
			'href'      => $this->url->link('checkout/cart'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('checkout/checkout', '', 'SSL'),
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
			$this->language->get('text_cart'),
			$this->language->get('text_separator')
		);

		$this->document->addBreadcrumbs(
			$this->url->link('checkout/checkout', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->data['text_checkout_option'] = sprintf($this->language->get('text_checkout_option'));

		$this->data['logged'] = $this->customer->isLogged();
		$this->data['shipping_required'] = $this->cart->hasShipping();

			$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
			$this->document->addScript(URL_JS . 'mylibs/uniform.js');
			$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');
			$this->document->addScript(URL_JS . 'mylibs/checkout.js');
			$this->document->addScript(URL_JS . 'mylibs/checkout_address.js');
//			$this->document->addScript(URL_JS . 'mylibs/fancybox.js');

			$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
//			$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/default.uni-form.css');
			$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/table.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
			$this->data['template_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/checkout.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/checkout.tpl';
		} else {
			$this->template = 'default/template/checkout/checkout.tpl';
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
