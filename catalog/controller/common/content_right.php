<?php
class ControllerCommonContentRight extends Controller {

	public function index() {
		$this->load->model('design/layout');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/information');

		if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if (substr($route, 0, 16) == 'product/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$this->request->get['path']);

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}

		if (substr($route, 0, 15) == 'product/product' && isset($this->request->get['product_id'])) {
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if (substr($route, 0, 23) == 'information/information' && isset($this->request->get['information_id'])) {
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}

// ----------------------------------------------------------------------------------------------------
		$module_data = $this->cache->get('content_right.' . $layout_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if (!$module_data) {
// ----------------------------------------------------------------------------------------------------
		$module_data = array();
		$this->load->model('setting/extension');
		$extensions = $this->model_setting_extension->getExtensions('module');

/*
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
			if ($modules) {
				foreach ($modules as $module) {
					if ($module['layout_id'] == $layout_id && $module['position'] == 'content_right' && $module['status']) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);
					}
				}
			}
		}
*/
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
			if ($modules) {
				foreach ($modules as $module) {
//					if ($module['layout_id'] == $layout_id && $module['position'] == 'content_header' && $module['status']) {
// Hack to allow extensions to override the base opencart layout/route system
// NOTE! The value of '0' was hardcoded into the the following IF statement.
// I used 0 since that is the first number. I could have used 'override' but that would defeat the purpose of localizations
					if (($module['layout_id'] == $layout_id && $module['position'] == 'content_right' && $module['status']) || ($module['layout_id'] == '0' && $module['position'] == 'content_right' && $module['status'])) {
						$module_data[] = array(
							'code'       => $extension['code'],
							'setting'    => $module,
							'sort_order' => $module['sort_order']
						);
					}
				}
			}
		}

// ----------------------------------------------------------------------------------------------------
			$this->cache->set('content_right', $module_data);
		}
// ----------------------------------------------------------------------------------------------------

		$sort_order = array();

		foreach ($module_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $module_data);

		$this->data['modules'] = array();

		foreach ($module_data as $module) {
			$module = $this->getChild('module/' . $module['code'], $module['setting']);

			if ($module) {
				$this->data['modules'][] = $module;
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/content_right.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/content_right.tpl';
		} else {
			$this->template = 'default/template/common/content_right.tpl';
		}

		$this->render();
	}

}
