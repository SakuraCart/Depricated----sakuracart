<?php
class ControllerForumUser extends Controller {
	public function index() {
		$this->data = array_merge($this->data, $this->load->language('forum/user'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/user');
		$this->load->model('tool/image');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_user'),
			'href'      => $this->url->link('forum/user'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['categories'] = array();

		$results = $this->model_forum_user->getUsers();

		foreach ($results as $result) {
			if (is_int(substr($result['name'], 0, 1))) {
				$key = '0 - 9';
			} else {
				$key = substr(strtoupper($result['name']), 0, 1);
			}

			if (!isset($this->data['users'][$key])) {
				$this->data['categories'][$key]['name'] = $key;
			}

			$this->data['categories'][$key]['user'][] = array(
				'name' => $result['name'],
				'href' => $this->url->link('forum/user/thread', 'user_id=' . $result['user_id'])
			);
		}

		$this->data['continue'] = $this->url->link('common/home');

//		$this->document->addScript(URL_JS . 'mylibs/author.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/forum/user_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/forum/user_list.tpl';
		} else {
			$this->template = 'default/template/forum/user_list.tpl';
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

	public function thread() {
		$this->data = array_merge($this->data, $this->load->language('forum/user'));

		$this->load->model('forum/user');
		$this->load->model('forum/forum');
		$this->load->model('tool/image');

		if (isset($this->request->get['user_id'])) {
			$user_id = $this->request->get['user_id'];
		} else {
			$user_id = 0;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

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

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_user'),
			'href'      => $this->url->link('forum/user'),
			'separator' => $this->language->get('text_separator')
		);

		$user_info = $this->model_forum_user->getUser($user_id);

		if ($user_info) {
			$this->document->setTitle($user_info['name']);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $user_info['name'],
				'href'      => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . $url),
				'separator' => $this->language->get('text_separator')
			);

			$this->data['heading_title'] = $user_info['name'];
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

			$this->data['compare'] = $this->url->link('forum/compare');

			$this->data['threads'] = array();

			$data = array(
				'filter_user_id' => $user_id,
				'sort'                   => $sort,
				'order'                  => $order,
				'start'                  => ($page - 1) * $limit,
				'limit'                  => $limit
			);

			$thread_total = $this->model_forum_forum->getTotalThreads($data);

			$results = $this->model_forum_forum->getThreads($data);

			foreach ($results as $result) {
				if ($result['image']) {
//					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_thread_width'), $this->config->get('config_image_thread_height'));
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
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
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['headline'] ? $result['headline'] : $result['price']);
				} else {
					$tax = false;
				}
*/
				if ($this->config->get('config_post')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$this->data['threads'][] = array(
					'thread_id'  => $result['thread_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
//					'price'       => $price,
//					'headline'     => $headline,
//					'tax'         => $tax,
					'rating'      => $result['rating'],
					'posts'     => sprintf($this->language->get('text_posts'), (int)$result['posts']),
					'href'        => $this->url->link('forum/forum', $url . '&user_id=' . $result['user_id'] . '&thread_id=' . $result['thread_id'])
				);
			}

			$url = '';

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['sorts'] = array();

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_default'),
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=pd.name&order=DESC' . $url)
			);
/*
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=p.price&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=p.price&order=DESC' . $url)
			);
*/
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=rating&order=DESC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=rating&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=p.model&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . '&sort=p.model&order=DESC' . $url)
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$this->data['limits'] = array();

			$this->data['limits'][] = array(
				'text'  => $this->config->get('config_catalog_limit'),
				'value' => $this->config->get('config_catalog_limit'),
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . $url . '&limit=' . $this->config->get('config_catalog_limit'))
			);

			$this->data['limits'][] = array(
				'text'  => 25,
				'value' => 25,
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . $url . '&limit=25')
			);

			$this->data['limits'][] = array(
				'text'  => 50,
				'value' => 50,
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . $url . '&limit=50')
			);

			$this->data['limits'][] = array(
				'text'  => 75,
				'value' => 75,
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . $url . '&limit=75')
			);

			$this->data['limits'][] = array(
				'text'  => 100,
				'value' => 100,
				'href'  => $this->url->link('forum/user/thread', 'user_id=' . $this->request->get['user_id'] . $url . '&limit=100')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $thread_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('forum/user/thread','user_id=' . $this->request->get['user_id'] .  $url . '&page={page}');

			$this->data['pagination'] = $pagination->render();

			$this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;

			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/forum/user_info.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/forum/user_info.tpl';
			} else {
				$this->template = 'default/template/forum/user_info.tpl';
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

			if (isset($this->request->get['user_id'])) {
				$url .= '&user_id=' . $this->request->get['user_id'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('forum/category', $url),
				'separator' => $this->language->get('text_separator')
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
}
