<?php
class ControllerTotalVoucher extends Controller {
	public function index() {
		$this->data = array_merge($this->data, $this->load->language('total/voucher'));

		if (isset($this->session->data['voucher'])) {
			$this->data['voucher'] = $this->session->data['voucher'];
		} else {
			$this->data['voucher'] = '';
		}

		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

		$this->data['template_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/total/voucher.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/total/voucher.tpl';
		} else {
			$this->template = 'default/template/total/voucher.tpl';
		}

		$this->render();
	}

	public function calculate() {
		$this->data = array_merge($this->data, $this->load->language('total/voucher'));

		$json = array();

		if (!$this->cart->hasProducts()) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		if (isset($this->request->post['voucher'])) {
			$this->load->model('checkout/voucher');

			$voucher_info = $this->model_checkout_voucher->getVoucher($this->request->post['voucher']);

			if ($voucher_info) {
				$this->session->data['voucher'] = $this->request->post['voucher'];

				$this->session->data['success'] = $this->language->get('text_success');

				$json['redirect'] = $this->url->link('checkout/cart', '', 'SSL');
			} else {
				$json['error'] = $this->language->get('error_voucher');
			}
		}

		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
