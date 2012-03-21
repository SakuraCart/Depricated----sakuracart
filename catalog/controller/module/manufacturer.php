<?php
class ControllerModuleManufacturer extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/manufacturer'));

		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');

		$this->data['manufacturers'] = array();

		$data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
//			'limit' => $this->config->get('special_' . $module . '_limit')
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_manufacturer->getManufacturers();

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}

/*
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'],
			} else {
				$rating = false;
			}
*/

			$this->data['manufacturers'][] = array(
				'manufacturer_id' => $result['manufacturer_id'],
				'thumb'      => $image,
				'name'       => $result['name'],
//				'rating'     => $rating,
//				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'rating'     => '',
				'reviews'    => '',
				'href'       => $this->url->link('product/manufacturer/product', 'manufacturer_id=' . $result['manufacturer_id']),
				);
			}

//		$this->document->addScript(URL_JS . 'mylibs/manufacturer.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/manufacturer.tpl';
		} else {
			$this->template = 'default/template/module/manufacturer.tpl';
		}

		$this->render();
	}

}
