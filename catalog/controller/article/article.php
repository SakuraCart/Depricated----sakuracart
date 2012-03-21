<?php
class ControllerArticleArticle extends Controller {
	private $error = array();

	public function index() {
/* -------------------------------------------- BEGIN validate mod -------------------------------------------- */
		if (isset($this->session->data['secret_token'])) {
			$this->data['secret_token'] = $this->session->data['secret_token'];
		} else {
			$this->session->data['secret_token'] = md5(uniqid(rand(), true));
			$this->data['secret_token'] = $this->session->data['secret_token'];
		}

		$this->session->data['time'] = time();
		$this->data['timer'] = $this->session->data['time'];
/* -------------------------------------------- END validate mod -------------------------------------------- */
		$this->data = array_merge($this->data, $this->load->language('article/article'));
		$this->data['logged'] = $this->customer->isLogged();

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('common/home'),
			$this->language->get('text_home'),
			false
		);

		$this->load->model('article/article_category');

		if (isset($this->request->get['path'])) {
			$path = '';

			foreach (explode('_', $this->request->get['path']) as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_article_article_category->getCategory($path_id);

				if ($category_info) {
/*
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('article/category', 'path=' . $path),
						'separator' => $this->language->get('text_separator')
					);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('article/article_category', 'path=' . $path),
			$category_info['name'],
			$this->language->get('text_separator')
		);

				}
			}
		}

		$this->load->model('article/author');

		if (isset($this->request->get['author_id'])) {
/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_author'),
				'href'      => $this->url->link('article/author'),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('article/author'),
			$this->language->get('text_author'),
			$this->language->get('text_separator')
		);

			$author_info = $this->model_article_author->getAuthor($this->request->get['author_id']);

			if ($author_info) {
/*
				$this->data['breadcrumbs'][] = array(
					'text'	 => $author_info['name'],
					'href'	 => $this->url->link('article/author/article', 'author_id=' . $this->request->get['author_id']),
					'separator' => $this->language->get('text_separator')
				);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('article/author/article', 'author_id=' . $this->request->get['author_id']),
			$author_info['name'],
			$this->language->get('text_separator')
		);

}
		}

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_tag'])) {
			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}

			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}

			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}

/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('article/search', $url),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('article/search', $url),
			$this->language->get('text_search'),
			$this->language->get('text_separator')
		);

		}

		if (isset($this->request->get['article_id'])) {
			$article_id = $this->request->get['article_id'];
		} else {
			$article_id = 0;
		}

		$this->load->model('article/article');

		$article_info = $this->model_article_article->getArticle($article_id);

		$this->data['article_info'] = $article_info;

		if ($article_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['author_id'])) {
				$url .= '&author_id=' . $this->request->get['author_id'];
			}

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}

			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}

			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}

/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $article_info['name'],
				'href'      => $this->url->link('article/article', $url . '&article_id=' . $this->request->get['article_id']),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('article/article', $url . '&article_id=' . $this->request->get['article_id']),
			$article_info['name'],
			$this->language->get('text_separator')
		);

			$this->document->setTitle($article_info['name']);
			$this->document->setDescription($article_info['meta_description']);
			$this->document->setKeywords($article_info['meta_keyword']);
			$this->document->addLink($this->url->link('article/article', 'article_id=' . $this->request->get['article_id']), 'canonical');

			$this->data['heading_title'] = $article_info['name'];
//			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $article_info['minimum']);

// need a summary -- use meta_description as quick fix
			$this->data['meta_description'] = $article_info['meta_description'];

			$this->load->model('article/comment');

			$this->data['tab_comment'] = sprintf($this->language->get('tab_comment'), $this->model_article_comment->getTotalCommentsByArticleId($this->request->get['article_id']));
			$this->data['article_id'] = $this->request->get['article_id'];
			$this->data['author'] = $article_info['author'];
			$this->data['authors'] = $this->url->link('article/author/article', 'author_id=' . $article_info['author_id']);
			$this->data['summary'] = $article_info['summary'];
			$this->data['reward'] = $article_info['reward'];
			$this->data['points'] = $article_info['points'];

			$this->data['viewed'] = $article_info['viewed'] + 1;
			$this->data['date'] = date($this->language->get('date_format_short'), strtotime($article_info['date_available']));
/*
			if ($article_info['quantity'] <= 0) {
				$this->data['stock'] = $article_info['article_status'],
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $article_info['quantity'],
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}
*/
			$this->load->model('tool/image');

			if ($article_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = '';
			}

			if ($article_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = '';
			}


			if ($article_info['image']) {
				$this->data['slider'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('config_image_slider_width'), $this->config->get('config_image_slider_height'));
			} else {
				$this->data['slider'] = '';
			}



			$this->data['images'] = array();

			$results = $this->model_article_article->getArticleImages($this->request->get['article_id']);

			foreach ($results as $result) {
				$this->data['images'][] = array(
/*
					'popup' => $this->model_tool_image->resize($result['image'] , $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
*/
					'additional' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height')),
					'slider' => $this->model_tool_image->resize($result['image'] , $this->config->get('config_image_slider_width'), $this->config->get('config_image_slider_height')),
					'popup' => $this->model_tool_image->resize($result['image'] , $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'))

				);
			}
/*
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
//				$this->data['price'] = $this->currency->format($this->tax->calculate($article_info['price'], $article_info['tax_class_id'], $this->config->get('config_tax')));
				$this->data['price'] = $this->currency->format($article_info['price']);
			} else {
				$this->data['price'] = false;
			}
*/
/*
			if ((float)$article_info['headline']) {
//				$this->data['headline'] = $this->currency->format($this->tax->calculate($article_info['headline'], $article_info['tax_class_id'], $this->config->get('config_tax')));
				$this->data['headline'] = $this->currency->format($article_info['headline']);
			} else {
				$this->data['headline'] = false;
			}
*/
/*
			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$article_info['headline'] ? $article_info['headline'] : $article_info['price']);
			} else {
				$this->data['tax'] = false;
			}
*/
/*
			$discounts = $this->model_article_article->getArticleDiscounts($this->request->get['article_id']);

			$this->data['discounts'] = array();

			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $article_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
*/
/*
			$this->data['options'] = array();

			foreach ($this->model_article_article->getArticleOptions($this->request->get['article_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
					$option_value_data = array();

					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							$option_value_data[] = array(
								'article_option_value_id' => $option_value['article_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'price'                   => (float)$option_value['price'] ? $this->currency->format($this->tax->calculate($option_value['price'], $article_info['tax_class_id'], $this->config->get('config_tax'))) : false,
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					}

					$this->data['options'][] = array(
						'article_option_id' => $option['article_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'article_option_id' => $option['article_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option['option_value'],
						'required'          => $option['required']
					);
				}
			}
*/
/*
			if ($article_info['minimum']) {
				$this->data['minimum'] = $article_info['minimum'],
			} else {
				$this->data['minimum'] = 1;
			}
*/
			$this->data['comment_status'] = $this->config->get('config_comment_status');
			$this->data['comments'] = sprintf($this->language->get('text_comments'), (int)$article_info['comments']);
			$this->data['rating'] = (int)$article_info['rating'];
			$this->data['description'] = html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8');
//			$this->data['attribute_groups'] = $this->model_article_article->getArticleAttributes($this->request->get['article_id']);
			$this->data['text_review_login'] = sprintf($this->language->get('text_review_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));

			$this->data['articles'] = array();

			$results = $this->model_article_article->getArticleRelated($this->request->get['article_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize(URL_IMAGE . 'no_image.jpg', $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
//					$image = false;
				}
/*
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
//					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					$price = $this->currency->format($result['price']);
				} else {
					$price = false;
				}
*/
/*
				if ((float)$result['headline']) {
//					$headline = $this->currency->format($this->tax->calculate($result['headline'], $result['tax_class_id'], $this->config->get('config_tax')));
					$headline = $this->currency->format($result['headline']);
				} else {
					$headline = false;
				}
*/
				if ($this->config->get('config_comment')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$this->data['articles'][] = array(
					'article_id'  => $result['article_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
//					'description' => $result['description'],
					'description' => substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'viewed'      => $result['viewed'],
					'date' => date($this->language->get('date_format_short'), strtotime($result['date_available'])),
//					'headline'    => $headline,
					'rating'     => $rating,
					'comments'    => sprintf($this->language->get('text_comments'), (int)$result['comments']),
					'href'       => $this->url->link('article/article', 'article_id=' . $result['article_id']),
				);
			}

			$this->data['tags'] = array();

			$results = $this->model_article_article->getArticleTags($this->request->get['article_id']);

			foreach ($results as $result) {
				$this->data['tags'][] = array(
					'tag'  => $result['tag'],
					'href' => $this->url->link('article/search', 'filter_tag=' . $result['tag'])
				);
			}

			$this->model_article_article->updateViewed($this->request->get['article_id']);
			$this->data['continue'] = $this->url->link('common/home');

		$this->document->addScript(URL_JS . 'mylibs/article.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/default.uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
			$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/article/article.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/article/article.tpl';
			} else {
				$this->template = 'default/template/article/article.tpl';
			}

			$this->children = array(
			'common/content_center',
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_footer',
			'common/footer',
			'common/header'
			);

			$this->response->setOutput($this->render());
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['author_id'])) {
				$url .= '&author_id=' . $this->request->get['author_id'];
			}

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_tag'])) {
				$url .= '&filter_tag=' . $this->request->get['filter_tag'];
			}

			if (isset($this->request->get['filter_description'])) {
				$url .= '&filter_description=' . $this->request->get['filter_description'];
			}

			if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}

/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('article/article', $url . '&article_id=' . $article_id),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('article/article', $url . '&article_id=' . $article_id),
			$this->language->get('text_error'),
			$this->language->get('text_separator')
		);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
			'common/content_center',
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_footer',
			'common/footer',
			'common/header'
			);

			$this->response->setOutput($this->render());
		}
	}

	public function comment() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));

		$this->load->model('article/comment');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$this->data['comments'] = array();

		$comment_total = $this->model_article_comment->getTotalCommentsByArticleId($this->request->get['article_id']);

		$results = $this->model_article_comment->getCommentsByArticleId($this->request->get['article_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$this->data['comments'][] = array(
				'author'     => $result['author'],
				'text'       => strip_tags($result['text']),
				'rating'     => (int)$result['rating'],
				'comments'    => sprintf($this->language->get('text_comments'), (int)$comment_total),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $comment_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('article/article/comment', 'article_id=' . $this->request->get['article_id'] . '&page={page}');

		$this->data['pagination'] = $pagination->render();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/article/comment.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/article/comment.tpl';
		} else {
			$this->template = 'default/template/article/comment.tpl';
		}

		$this->response->setOutput($this->render());
	}

	public function write() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));

		$this->load->model('article/comment');

		$json = array();

/* -------------------------------------------- BEGIN validate mod -------------------------------------------- */
		$min_allowed_time = 10;

		if  ( (time() - $this->request->post['timer']) < $min_allowed_time ) {
			unset($this->session->data['secret_token']);
			$this->redirect($this->url->link('information/contact'));
		}

		if ( (!empty($this->session->data['secret_token'])) && (!empty($this->request->post['secret_token'])) ) {
			if ($this->session->data['secret_token'] == $this->request->post['secret_token']) {
//process the form
/* -------------------------------------------- END validate mod -------------------------------------------- */
		if ((strlen(utf8_decode($this->request->post['name'])) < 3) || (strlen(utf8_decode($this->request->post['name'])) > 25)) {
			$json['error'] = $this->language->get('error_name');
		}

		if ((strlen(utf8_decode($this->request->post['text'])) < 25) || (strlen(utf8_decode($this->request->post['text'])) > 1000)) {
			$json['error'] = $this->language->get('error_text');
		}

		if (!$this->request->post['rating']) {
			$json['error'] = $this->language->get('error_rating');
		}

/*
		if (!isset($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
			$json['error'] = $this->language->get('error_captcha');
		}
*/

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			$this->model_article_comment->addComment($this->request->get['article_id'], $this->request->post);

			$json['success'] = $this->language->get('text_success');
		}
/* -------------------------------------------- BEGIN validate mod -------------------------------------------- */
/*
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
*/
				if (!$this->error) {
					return TRUE;
					unset($this->session->data['secret_token']);
				} else {
					return FALSE;
					unset($this->session->data['secret_token']);
				}
			}
		}
/* -------------------------------------------- END validate mod -------------------------------------------- */

		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}

	public function captcha() {
		$this->load->library('captcha');

		$captcha = new Captcha();

		$this->session->data['captcha'] = $captcha->getCode();

		$captcha->showImage();
	}

	public function upload() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));

		$json = array();

		if (isset($this->request->files['file']['name']) && $this->request->files['file']['name']) {
			if ((strlen(utf8_decode($this->request->files['file']['name'])) < 3) || (strlen(utf8_decode($this->request->files['file']['name'])) > 128)) {

		$json['error'] = $this->language->get('error_filename');
			}

			$allowed = array();

			$filetypes = explode(',', $this->config->get('config_upload_allowed'));

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(substr(strrchr($this->request->files['file']['name'], '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
					}

			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$json['file'] = basename($this->request->files['file']['name']) . '.' . md5(rand());

				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $json['file']);
			}

			$json['success'] = $this->language->get('text_upload');
		}

		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
