<?php
class ControllerModuleForumMegaMenu extends Controller {
	protected function index($setting) {

		// Menu
		$this->load->model('forum/forum_category');
		$this->load->model('forum/thread');

		$this->data['forumCategories'] = array();

		$forumCategories = $this->model_forum_forum_category->getCategories(0);

		foreach ($forumCategories as $category) {
			if ($category['top']) {
				$children_data = array();

				$children = $this->model_forum_forum_category->getCategories($category['category_id']);
//				$children = $this->model_catalog_category->getCategoriesAndTotals($category['category_id']);

				foreach ($children as $child) {

					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

//					$thread_total = $this->model_forum_thread->getTotalThreads($data);

					$children_data[] = array(
//						'name'  => $child['name'] . ' (' . $thread_total . ')',
						'name'  => $child['name'],
//						'name'  => $child['name'] . ' (' . $child['qty'] . ')',
						'href'  => $this->url->link('forum/forum_category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$this->data['forumCategories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('forum/forum_category', 'path=' . $category['category_id'])
				);
			}
		}

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

// ----------------------------------------------------------------------------------------------------
//		$category_data = $this->cache->get('forum_categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id')) . '.tpl';
//		if(!$category_data && !is_array($category_data)){
// ----------------------------------------------------------------------------------------------------
//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/forum_megamenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/forum_megamenu.tpl';
		} else {
			$this->template = 'default/template/module/forum_megamenu.tpl';
		}
// ----------------------------------------------------------------------------------------------------
//			$category_data = $query->rows;
//			$this->cache->set('forum_categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data) . '.tpl';
//		}
// ----------------------------------------------------------------------------------------------------

		$this->render();
	}
}
