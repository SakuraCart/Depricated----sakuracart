<?php
class ControllerTotalCoupon extends Controller {
	public function index() {
		$this->data = array_merge($this->data, $this->load->language('total/coupon'));

		if (isset($this->session->data['coupon'])) {
			$this->data['coupon'] = $this->session->data['coupon'];
		} else {
			$this->data['coupon'] = '';
		}

		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');
		$this->document->addScript(URL_JS . 'mylibs/coupon.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

		$this->data['template_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/total/coupon.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/total/coupon.tpl';
		} else {
			$this->template = 'default/template/total/coupon.tpl';
		}

		$this->render();
	}

	public function calculate() {
		$this->data = array_merge($this->data, $this->load->language('total/coupon'));

		$json = array();

		if (!$this->cart->hasProducts()) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		if (isset($this->request->post['coupon'])) {
			$this->load->model('checkout/coupon');

			$coupon_info = $this->model_checkout_coupon->getCoupon($this->request->post['coupon']);

			if ($coupon_info) {
				$this->session->data['coupon'] = $this->request->post['coupon'];

				$this->session->data['success'] = $this->language->get('text_success');

				$json['redirect'] = $this->url->link('checkout/cart', '', 'SSL');
			} else {
				$json['error'] = $this->language->get('error_coupon');
			}
		}

		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
