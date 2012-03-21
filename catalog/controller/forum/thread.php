<?php
class ControllerForumThread extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('forum/forum_category'));
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));

/* -------------------------------------------- BEGIN validate mod -------------------------------------------- */
		if ($this->session->data['secret_token']) {
			$this->data['secret_token'] = $this->session->data['secret_token'];
		} else {
			$this->session->data['secret_token'] = md5(uniqid(rand(), true));
			$this->data['secret_token'] = $this->session->data['secret_token'];
		}

		$this->session->data['time'] = time();
		$this->data['timer'] = $this->session->data['time'];
/* -------------------------------------------- END validate mod -------------------------------------------- */
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

		$this->load->model('forum/forum_category');
/*
if (!isset($this->request->get['user_id'])) {
	$this->data['action'] = $this->url->link('forum/user/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
} else {
	$this->data['action'] = $this->url->link('forum/user/update', 'token=' . $this->session->data['token'] . '&user_id=' . $this->request->get['user_id'] . $url, 'SSL');
}
*/
		$this->data['action'] = $this->url->link('forum/post/insert');


		if (isset($this->request->get['path'])) {
			$path = '';

			foreach (explode('_', $this->request->get['path']) as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_forum_forum_category->getCategory($path_id);

				if ($category_info) {
/*
					$this->data['breadcrumbs'][] = array(
						'text'      => $category_info['name'],
						'href'      => $this->url->link('forum/forum_category', 'path=' . $path),
						'separator' => $this->language->get('text_separator')
					);
*/

					$this->document->addBreadcrumbs(
						$this->url->link('forum/forum_category', 'path=' . $path),
						$category_info['name'],
						$this->language->get('text_separator')
					);


				}
			}
		}
/*
		$this->load->model('forum/user');

		if (isset($this->request->get['user_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_user'),
				'href'      => $this->url->link('forum/user'),
				'separator' => $this->language->get('text_separator')
			);

			$user_info = $this->model_user->getUser($this->request->get['user_id']);

			if ($user_info) {
				$this->data['breadcrumbs'][] = array(
					'text'	 => $user_info['name'],
					'href'	 => $this->url->link('forum/forum/thread', 'user_id=' . $this->request->get['user_id']),
					'separator' => $this->language->get('text_separator')
				);
			}
		}
*/
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

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_search'),
				'href'      => $this->url->link('forum/search', $url),
				'separator' => $this->language->get('text_separator')
			);
		}

		if (isset($this->request->get['thread_id'])) {
			$thread_id = $this->request->get['thread_id'];
		} else {
			$thread_id = 0;
		}

		$this->load->model('forum/thread');

		$thread_info = $this->model_forum_thread->getThread($thread_id);

		$this->data['thread_info'] = $thread_info;

		if ($thread_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['user_id'])) {
				$url .= '&user_id=' . $this->request->get['user_id'];
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
				'text'      => $thread_info['title'],
				'href'      => $this->url->link('forum/thread', $url . '&thread_id=' . $this->request->get['thread_id']),
				'separator' => $this->language->get('text_separator')
			);
*/

/*
// add breadcrumb if you want to link to the current thread!
// is this really necessary???
		$this->document->addBreadcrumbs(
			$this->url->link('forum/thread', $url . '&thread_id=' . $this->request->get['thread_id']),
//			$this->language->get('text_error'),
			$thread_info['title'],
			$this->language->get('text_separator')
		);
*/
			$this->document->setTitle($thread_info['title']);
			$this->document->setDescription($thread_info['meta_description']);
			$this->document->setKeywords($thread_info['meta_keyword']);
			$this->document->addLink($this->url->link('forum/thread', 'thread_id=' . $this->request->get['thread_id']), 'canonical');

			$this->data['heading_title'] = $thread_info['title'];
//			$this->data['text_minimum'] = sprintf($this->language->get('text_minimum'), $thread_info['minimum']);
			$this->data['text_post_login'] = sprintf($this->language->get('text_post_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));

			$this->load->model('forum/post');

			$this->data['tab_post'] = sprintf($this->language->get('tab_post'), $this->model_forum_post->getTotalPostsByThreadId($this->request->get['thread_id']));
			$this->data['thread_id'] = $this->request->get['thread_id'];
			$this->data['user'] = $thread_info['user'];
			$this->data['users'] = $this->url->link('forum/user/thread', 'user_id=' . $thread_info['user_id']);
			$this->data['model'] = $thread_info['model'];
			$this->data['reward'] = $thread_info['reward'];
			$this->data['points'] = $thread_info['points'];


			$this->data['viewed'] = $thread_info['viewed'] + 1;
			$this->data['date'] = date($this->language->get('date_format_short'), strtotime($thread_info['date_available']));

/*
			if ($thread_info['quantity'] <= 0) {
				$this->data['stock'] = $thread_info['thread_status'],
			} elseif ($this->config->get('config_stock_display')) {
				$this->data['stock'] = $thread_info['quantity'],
			} else {
				$this->data['stock'] = $this->language->get('text_instock');
			}
*/

//$this->post();


			$this->load->model('tool/image');

			if ($thread_info['image']) {
				$this->data['popup'] = $this->model_tool_image->resize($thread_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$this->data['popup'] = '';
			}
/*
			if ($thread_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($thread_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$this->data['thumb'] = '';
			}

			$this->data['images'] = array();

			$results = $this->model_forum_thread->getThreadImages($this->request->get['thread_id']);

			foreach ($results as $result) {
				$this->data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'] , $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}
*/
/*
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
//				$this->data['price'] = $this->currency->format($this->tax->calculate($thread_info['price'], $thread_info['tax_class_id'], $this->config->get('config_tax')));
				$this->data['price'] = $this->currency->format($thread_info['price']);
			} else {
				$this->data['price'] = false;
			}
*/
/*
			if ((float)$thread_info['headline']) {
//				$this->data['headline'] = $this->currency->format($this->tax->calculate($thread_info['headline'], $thread_info['tax_class_id'], $this->config->get('config_tax')));
				$this->data['headline'] = $this->currency->format($thread_info['headline']);
			} else {
				$this->data['headline'] = false;
			}
*/
/*
			if ($this->config->get('config_tax')) {
				$this->data['tax'] = $this->currency->format((float)$thread_info['headline'] ? $thread_info['headline'] : $thread_info['price']);
			} else {
				$this->data['tax'] = false;
			}
*/
/*
			$discounts = $this->model_forum_thread->getThreadDiscounts($this->request->get['thread_id']);

			$this->data['discounts'] = array();

			foreach ($discounts as $discount) {
				$this->data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $thread_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}
*/
/*
			$this->data['options'] = array();

			foreach ($this->model_forum_thread->getThreadOptions($this->request->get['thread_id']) as $option) {
				if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
					$option_value_data = array();

					foreach ($option['option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
							$option_value_data[] = array(
								'thread_option_value_id' => $option_value['thread_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'price'                   => (float)$option_value['price'] ? $this->currency->format($this->tax->calculate($option_value['price'], $thread_info['tax_class_id'], $this->config->get('config_tax'))) : false,
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					}

					$this->data['options'][] = array(
						'thread_option_id' => $option['thread_option_id'],
						'option_id'         => $option['option_id'],
						'name'              => $option['name'],
						'type'              => $option['type'],
						'option_value'      => $option_value_data,
						'required'          => $option['required']
					);
				} elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
					$this->data['options'][] = array(
						'thread_option_id' => $option['thread_option_id'],
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
			if ($thread_info['minimum']) {
				$this->data['minimum'] = $thread_info['minimum'],
			} else {
				$this->data['minimum'] = 1;
			}
*/
			$this->data['post_status'] = $this->config->get('config_post_status');
			$this->data['posts'] = sprintf($this->language->get('text_posts'), (int)$thread_info['posts']);
			$this->data['rating'] = (int)$thread_info['rating'];
			$this->data['description'] = html_entity_decode($thread_info['description'], ENT_QUOTES, 'UTF-8');
//			$this->data['attribute_groups'] = $this->model_forum_thread->getThreadAttributes($this->request->get['thread_id']);
			$this->data['language_id'] =(int)$this->config->get('config_language_id');

			$this->data['threads'] = array();

			$results = $this->model_forum_thread->getThreadRelated($this->request->get['thread_id']);
/*
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				} else {
					$image = false;
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
/*
				if ($this->config->get('config_post')) {
					$rating = (int)$result['rating'],
				} else {
					$rating = false;
				}

				$this->data['threads'][] = array(
					'thread_id' => $result['thread_id'],
//					'thumb'      => $image,
					'name'       => $result['name'],
//					'price'      => $price,
//					'headline'    => $headline,
					'rating'     => $rating,
					'posts'    => sprintf($this->language->get('text_posts'), (int)$result['posts']),
					'href'       => $this->url->link('forum/thread', 'thread_id=' . $result['thread_id']),
				);
			}
*/
			$this->data['tags'] = array();

			$results = $this->model_forum_thread->getThreadTags($this->request->get['thread_id']);

			foreach ($results as $result) {
				$this->data['tags'][] = array(
					'tag'  => $result['tag'],
					'href' => $this->url->link('forum/search', 'filter_tag=' . $result['tag'])
				);
			}

			$this->model_forum_thread->updateViewed($this->request->get['thread_id']);


			$this->load->model('forum/post');

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else {
				$page = 1;
			}

			$this->data['posts'] = array();

			$post_total = $this->model_forum_post->getTotalPostsByThreadId($this->request->get['thread_id']);

			$results = $this->model_forum_post->getPostsByThreadId($this->request->get['thread_id'], ($page - 1) * 5, 5);

			foreach ($results as $result) {
			$this->data['posts'][] = array(
				'user'     => $result['user'],
//				'username'     => $result['username'],
				'description'       => strip_tags($result['description']),
				'rating'     => (int)$result['rating'],
				'viewed'      => $result['viewed'],
				'date' => date($this->language->get('date_format_short'), strtotime($result['date_available'])),
				'posts'    => sprintf($this->language->get('text_posts'), (int)$post_total),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

/*
		$pagination = new Pagination();
		$pagination->total = $post_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('forum/thread/post', 'thread_id=' . $this->request->get['thread_id'] . '&page={page}');
		$this->data['pagination'] = $pagination->render();
*/
			if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$this->data['limits'] = array();

			$this->data['limits'][] = array(
				'text'  => $this->config->get('config_catalog_limit'),
				'value' => $this->config->get('config_catalog_limit'),
				'href'  => $this->url->link('forum/forum_category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $this->config->get('config_catalog_limit'))
			);

			$this->data['limits'][] = array(
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('forum/forum_category', 'path=' . $this->request->get['path'] . $url . '&limit=25')
			);

			$this->data['limits'][] = array(
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('forum/forum_category', 'path=' . $this->request->get['path'] . $url . '&limit=50')
			);

			$this->data['limits'][] = array(
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('forum/forum_category', 'path=' . $this->request->get['path'] . $url . '&limit=75')
			);

			$this->data['limits'][] = array(
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('forum/forum_category', 'path=' . $this->request->get['path'] . $url . '&limit=100')
			);

			$url = '';
/*
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
*/
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
//			$pagination->total = $thread_total;
			$pagination->total = $post_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
//			$pagination->url = $this->url->link('forum/forum_category', 'path=' . $this->request->get['path'] . $url . '&page={page}');
			$pagination->url = $this->url->link('forum/thread/post', 'thread_id=' . $this->request->get['thread_id'] . '&page={page}');

			$this->data['pagination'] = $pagination->render();

/*
			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
*/
			$this->data['limit'] = $limit;


			$this->data['continue'] = $this->url->link('common/home');


			$this->document->addScript(URL_JS . 'mylibs/forum.js');
//			$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/list_grid.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
			$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';


			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/forum/thread.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/forum/thread.tpl';
			} else {
				$this->template = 'default/template/forum/thread.tpl';
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

			if (isset($this->request->get['user_id'])) {
				$url .= '&user_id=' . $this->request->get['user_id'];
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
		}

/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('forum/thread', $url . '&thread_id=' . $thread_id),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('forum/thread', $url . '&thread_id=' . $thread_id),
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

	public function post() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));

		$this->load->model('forum/post');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$this->data['posts'] = array();

		$post_total = $this->model_forum_post->getTotalPostsByThreadId($this->request->get['thread_id']);

		$results = $this->model_forum_post->getPostsByThreadId($this->request->get['thread_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$this->data['posts'][] = array(
				'user'     => $result['user'],
				'text'       => strip_tags($result['text']),
				'rating'     => (int)$result['rating'],
				'posts'    => sprintf($this->language->get('text_posts'), (int)$post_total),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $post_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('forum/thread/post', 'thread_id=' . $this->request->get['thread_id'] . '&page={page}');

		$this->data['pagination'] = $pagination->render();

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/forum/post.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/forum/post.tpl';
		} else {
			$this->template = 'default/template/forum/post.tpl';
		}

		$this->response->setOutput($this->render());
	}

	public function write() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));

		$this->load->model('forum/thread');

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

		if ((strlen(utf8_decode($this->request->post['title'])) < 3) || (strlen(utf8_decode($this->request->post['title'])) > 25)) {
			$json['error'] = $this->language->get('error_title');
		}

		if ((strlen(utf8_decode($this->request->post['description'])) < 3) || (strlen(utf8_decode($this->request->post['description'])) > 1000)) {
			$json['error'] = $this->language->get('error_text');
		}
/*
		if (!$this->request->post['rating']) {
			$json['error'] = $this->language->get('error_rating');
		}

		if (!isset($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
			$json['error'] = $this->language->get('error_captcha');
		}
*/
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
//			$this->model_forum_post->addPost($this->request->get['thread_id'], $this->request->post);
//			$this->model_forum_thread->addThread($this->request->get['category_id'], $this->request->post);
			$this->model_forum_thread->addThread($this->request->post);

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

			$json['success'] = $this->language->get('text_success');
		}

//		$this->load->library('json');

//		$this->response->setOutput(Json::encode($json));
			$this->redirect($this->url->link('forum/forum_category&path='.$this->request->post['category_id']));
	}

	public function insertPost() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));

		$this->load->model('forum/post');

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

		if ((strlen(utf8_decode($this->request->post['title'])) < 3) || (strlen(utf8_decode($this->request->post['title'])) > 25)) {
			$json['error'] = $this->language->get('error_title');
		}

		if ((strlen(utf8_decode($this->request->post['description'])) < 3) || (strlen(utf8_decode($this->request->post['description'])) > 1000)) {
			$json['error'] = $this->language->get('error_text');
		}
/*
		if (!$this->request->post['rating']) {
			$json['error'] = $this->language->get('error_rating');
		}

		if (!isset($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
			$json['error'] = $this->language->get('error_captcha');
		}
*/
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !isset($json['error'])) {
			$this->model_forum_post->addPost($this->request->get['thread_id'], $this->request->post);
//			$this->model_forum_thread->addThread($this->request->get['thread_id'], $this->request->post);

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

			$json['success'] = $this->language->get('text_success');
		}

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
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));

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
