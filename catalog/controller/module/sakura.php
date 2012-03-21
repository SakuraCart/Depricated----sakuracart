<?php
class ControllerModuleSakura extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/sakura'));

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';
		$this->data['image_sakura'] = URL_THEME . $this->config->get('config_template') . '/image/tree.png';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/sakura.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/sakura.tpl';
		} else {
			$this->template = 'default/template/module/sakura.tpl';
		}

		$this->render();
	}
}
