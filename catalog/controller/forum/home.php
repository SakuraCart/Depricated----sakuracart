<?php
class ControllerForumHome extends Controller {

	public function index() {
		$this->document->setTitle($this->config->get('config_title'));

		$this->data['heading_title'] = $this->config->get('config_title');


		// Menu
		$this->load->model('forum/forum_category');
		$this->load->model('forum/thread');

		$this->data['forumCategories'] = array();

		$forumCategories = $this->model_forum_forum_category->getCategories(0);

//print_r($forumCategories);

		foreach ($forumCategories as $category) {
			if ($category['top']) {
				$children_data = array();

				$children = $this->model_forum_forum_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$thread_total = $this->model_forum_thread->getTotalThreads($data);

					$children_data[] = array(
						'name'  => $child['name'] . ' (' . $thread_total . ')',
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



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/forum/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/forum/home.tpl';
		} else {
			$this->template = 'default/template/forum/home.tpl';
		}

		$this->children = array(
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_center',
			'common/content_footer',
			'common/footer',
			'common/header'
		);

		$this->response->setOutput($this->render());
	}

}
