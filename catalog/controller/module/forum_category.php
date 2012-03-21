<?php
class ControllerModuleForumCategory extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/forum_category'));

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}

		$this->load->model('forum/forum_category');
		$this->load->model('forum/thread');

		$this->data['categories'] = array();

		$categories = $this->model_forum_forum_category->getCategories(0);

		foreach ($categories as $category) {
			$children_data = array();

			$children = $this->model_forum_forum_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

//				$thread_total = $this->model_forum_thread->getTotalThreads($data);

				$children_data[] = array(
					'category_id' => $child['category_id'],
//					'name'        => $child['name'] . ' (' . $thread_total . ')',
					'name'        => $child['name'],
					'href'        => $this->url->link('forum/forum_category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
				);
			}

			$data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

//			$thread_total = $this->model_forum_thread->getTotalThreads($data);

			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
//				'name'        => $category['name'] . ' (' . $thread_total . ')',
				'name'        => $category['name'],
				'children'    => $children_data,
				'href'        => $this->url->link('forum/forum_category', 'path=' . $category['category_id'])
			);
		}

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/forum_category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/forum_category.tpl';
		} else {
			$this->template = 'default/template/module/forum_category.tpl';
		}

		$this->render();
	}
}
