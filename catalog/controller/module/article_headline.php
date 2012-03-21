<?php
class ControllerModuleArticleHeadline extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/article_headline'));

		$this->load->model('article/article');
		$this->load->model('tool/image');

		$this->data['articles'] = array();

/*
		$data = array(
			'sort'  => 'p.date_added',
			'order' => 'DESC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_article_article->getArticles($data);
*/

		$limit = $setting['limit'];

		$results = $this->model_article_article->getHeadlineArticles($limit);

//print_r($results);

		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
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
/*
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'],
			} else {
				$rating = false;
			}
*/
			$this->data['articles'][] = array(
				'article_id' => $result['article_id'],
				'thumb'      => $image,
				'name'       => $result['name'],
//				'price'      => $price,
//				'headline'    => $headline,
//				'rating'     => $rating,
//				'comments'    => sprintf($this->language->get('text_comments'), (int)$result['comments']),
				'href'       => $this->url->link('article/article', 'article_id=' . $result['article_id']),
			);
		}

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/article_headline.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/article_headline.tpl';
		} else {
			$this->template = 'default/template/module/article_headline.tpl';
		}

		$this->render();
	}
}
