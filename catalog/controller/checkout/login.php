<?php
class ControllerCheckoutLogin extends Controller {
	public function index() {
		$this->data = array_merge($this->data, $this->load->language('checkout/checkout'));

		$json = array();

		if ((!$this->cart->hasProducts() && (!isset($this->session->data['vouchers']) || !$this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (isset($this->request->post['account'])) {
				$this->session->data['account'] = $this->request->post['account'];
			}

			if (isset($this->request->post['email']) && isset($this->request->post['password'])) {
				if ($this->customer->login($this->request->post['email'], $this->request->post['password'])) {
					unset($this->session->data['guest']);

					$json['redirect'] = $this->url->link('checkout/checkout');
				} else {
					$json['error']['warning'] = $this->language->get('error_login');
				}
			}
		} else {

			$this->data['guest_checkout'] = ($this->config->get('config_guest_checkout') && !$this->config->get('config_customer_price') && !$this->cart->hasDownload());

			if (isset($this->session->data['account'])) {
				$this->data['account'] = $this->session->data['account'];
			} else {
				$this->data['account'] = 'register';
			}

			$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/login.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/checkout/login.tpl';
			} else {
				$this->template = 'default/template/checkout/login.tpl';
			}

			$json['output'] = $this->render();
		}
		$this->response->setOutput(json_encode($json));
	}
}
