<?php
class ControllerModuleAuthor extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/author'));

		$this->load->model('article/author');
		$this->load->model('tool/image');

		$this->data['authors'] = array();

		$data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
//			'limit' => $this->config->get('special_' . $module . '_limit')
			'limit' => $setting['limit']
		);

		$results = $this->model_article_author->getAuthors();

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

			$this->data['authors'][] = array(
				'author_id' => $result['author_id'],
				'thumb'      => $image,
				'name'       => $result['name'],
//				'rating'     => $rating,
//				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'rating'     => '',
				'reviews'    => '',
				'href'       => $this->url->link('article/author/article', 'author_id=' . $result['author_id']),
			);
		}

//		$this->document->addScript(URL_JS . 'mylibs/author.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/author.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/author.tpl';
		} else {
			$this->template = 'default/template/module/author.tpl';
		}

		$this->render();
	}

}
