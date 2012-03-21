<?php
class ControllerModuleCarousel extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/carousel'));
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->data['limit'] = $setting['limit'];
		$this->data['scroll'] = $setting['scroll'];

		$this->data['carousels'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
//print_r($result['image']);
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['carousels'][] = array(
					'title' => $result['title'],
//					'link'  => $result['link'],
					'link'  => $this->url->link($result['link']),
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$this->data['module'] = $module++;

		$this->document->addScript(URL_JS . 'libs/jquery.jcarousel.min.js');
		$this->document->addScript(URL_JS . 'mylibs/carousel.js');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/carousel.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/carousel.tpl';
		} else {
			$this->template = 'default/template/module/carousel.tpl';
		}

//print_r($this->config->get('config_template'));

		$this->render();
	}
}
