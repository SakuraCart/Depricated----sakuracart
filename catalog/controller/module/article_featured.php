<?php
class ControllerModuleArticleFeatured extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/featured'));

		$this->load->model('article/article');
		$this->load->model('tool/image');

		$this->data['articles'] = array();
//echo "1";
		$articles = explode(',', $this->config->get('article_featured_article'));

		foreach ($articles as $article_id) {
			$article_info = $this->model_article_article->getArticle($article_id);

			if ($article_info) {
				if ($article_info['image']) {
					$image = $this->model_tool_image->resize($article_info['image'], $this->config->get('article_featured_' . $module . '_image_width'), $this->config->get('article_featured_' . $module . '_image_height'));
				} else {
					$image = false;
				}
/*
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
*/
/*
				if ((float)$article_info['headline']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$headline = false;
				}
*/
				if ($this->config->get('config_review_status')) {
					$rating = $article_info['rating'];
				} else {
					$rating = false;
				}

				$this->data['articles'][] = array(
					'article_id' => $article_info['article_id'],
					'thumb'      => $image,
					'name'       => $article_info['name'],
//					'price'      => $price,
//					'headline'    => $headline,
					'rating'     => $rating,
					'comments'    => sprintf($this->language->get('text_comments'), (int)$article_info['comments']),
					'href'       => $this->url->link('article/article', 'article_id=' . $article_info['article_id']),
				);
			}
		}

//		$this->document->addScript(URL_JS . 'mylibs/slideshow.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/slideshow.css');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/article_featured.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/article_featured.tpl';
		} else {
			$this->template = 'default/template/module/article_featured.tpl';
		}

		$this->render();
	}
}
