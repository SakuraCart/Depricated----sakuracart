<?php
class ControllerModuleMegaMenu extends Controller {
	protected function index($setting) {

		// Menu
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');

		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);
//				$children = $this->model_catalog_category->getCategoriesAndTotals($category['category_id']);

				foreach ($children as $child) {

					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
//					$product_total = $this->model_catalog_product->getTotalProducts($data);

					$children_data[] = array(
//						'name'  => $child['name'] . ' (' . $product_total . ')',
						'name'  => $child['name'],
//						'name'  => $child['name'] . ' (' . $child['qty'] . ')',
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/megamenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/megamenu.tpl';
		} else {
			$this->template = 'default/template/module/megamenu.tpl';
		}

		$this->render();
	}
}
