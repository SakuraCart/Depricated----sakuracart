<?php
class ControllerModuleForumLatest extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/forum_latest'));

		$this->load->model('forum/thread');
//		$this->load->model('tool/image');

		$this->data['threads'] = array();

		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_forum_thread->getThreads($data);

		foreach ($results as $result) {
/*
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
*/
/*
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
*/
/*
			if ((float)$result['headline']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$headline = false;
			}
*/
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}

			$this->data['threads'][] = array(
				'thread_id' => $result['thread_id'],
//				'thumb'      => $image,
				'title'       => $result['title'],
//				'price'      => $price,
//				'headline'    => $headline,
				'rating'     => $rating,
				'posts'    => sprintf($this->language->get('text_posts'), (int)$result['posts']),
				'href'       => $this->url->link('forum/thread', 'thread_id=' . $result['thread_id']),
			);
		}

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/forum_latest.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/forum_latest.tpl';
		} else {
			$this->template = 'default/template/module/forum_latest.tpl';
		}

		$this->render();
	}
}
