<?php
class ControllerModuleInformation extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/information'));

		$this->load->model('catalog/information');

		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			$this->data['informations'][] = array(
				'title' => $result['title'],
				'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
			);
		}

		$this->data['contact'] = $this->url->link('information/contact');
		$this->data['sitemap'] = $this->url->link('information/sitemap');

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/information.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/information.tpl';
		} else {
			$this->template = 'default/template/module/information.tpl';
		}

		$this->render();
	}

}
