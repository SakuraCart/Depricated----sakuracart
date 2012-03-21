<?php
class ControllerModuleSpare extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/spare'));

		$this->data['logged'] = $this->customer->isLogged();

		$this->data['manufacturer'] = $this->url->link('product/manufacturer', '', 'SSL');
		$this->data['voucher'] = $this->url->link('checkout/voucher', '', 'SSL');
		$this->data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$this->data['special'] = $this->url->link('product/special');

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/spare.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/spare.tpl';
		} else {
			$this->template = 'default/template/module/spare.tpl';
		}

		$this->render();
	}
}
