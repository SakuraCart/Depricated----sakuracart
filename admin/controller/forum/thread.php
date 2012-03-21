<?php
class ControllerForumThread extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/thread');

		$this->getList();
	}

	public function insert() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/thread');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_forum_thread->addThread($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . $this->request->get['filter_title'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . $this->request->get['filter_model'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'],
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->redirect($this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/thread');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_forum_thread->editThread($this->request->get['thread_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . $this->request->get['filter_title'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . $this->request->get['filter_model'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->redirect($this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/thread');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $thread_id) {
				$this->model_forum_thread->deleteThread($thread_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . $this->request->get['filter_title'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . $this->request->get['filter_model'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'],
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'],
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->redirect($this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function copy() {
		$this->data = array_merge($this->data, $this->load->language('forum/thread'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/thread');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $thread_id) {
				$this->model_forum_thread->copyThread($thread_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . $this->request->get['filter_title'];
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . $this->request->get['filter_model'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'],
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'],
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->redirect($this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['filter_title'])) {
			$filter_title = $this->request->get['filter_title'];
		} else {
			$filter_title = null;
		}

		if (isset($this->request->get['filter_model'])) {
			$filter_model = $this->request->get['filter_model'];
		} else {
			$filter_model = null;
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$filter_price = $this->request->get['filter_price'],
		} else {
			$filter_price = null;
		}

		if (isset($this->request->get['filter_quantity'])) {
			$filter_quantity = $this->request->get['filter_quantity'],
		} else {
			$filter_quantity = null;
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.title';
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

		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . $this->request->get['filter_model'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'],
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'],
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
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

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['insert'] = $this->url->link('forum/thread/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['copy'] = $this->url->link('forum/thread/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('forum/thread/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['threads'] = array();

		$data = array(
			'filter_title'     => $filter_title,
			'filter_model'    => $filter_model,
//			'filter_price'    => $filter_price,
//			'filter_quantity' => $filter_quantity,
			'filter_status'   => $filter_status,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           => $this->config->get('config_admin_limit')
		);

		$this->load->model('tool/image');

		$thread_total = $this->model_forum_thread->getTotalThreads($data);

		$results = $this->model_forum_thread->getThreads($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('forum/thread/update', 'token=' . $this->session->data['token'] . '&thread_id=' . $result['thread_id'] . $url, 'SSL')
			);

			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}

/*
			$special = false;

			$thread_specials = $this->model_forum_thread->getThreadSpecials($result['thread_id']);

			foreach ($thread_specials  as $thread_special) {
				if (($thread_special['date_start'] == '0000-00-00' || $thread_special['date_start'] > date('Y-m-d')) && ($thread_special['date_end'] == '0000-00-00' || $thread_special['date_end'] < date('Y-m-d'))) {
					$special = $thread_special['price'];

					break;
				}
			}
*/

			$this->data['threads'][] = array(
				'thread_id' => $result['thread_id'],
				'title'       => $result['title'],
				'model'      => $result['model'],
//				'price'      => $result['price'],
//				'special'    => $special,
				'image'      => $image,
//				'quantity'   => $result['quantity'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected'   => isset($this->request->post['selected']) && in_array($result['thread_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . $this->request->get['filter_model'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'],
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'],
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_title'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . '&sort=pd.title' . $url, 'SSL');
		$this->data['sort_model'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . '&sort=p.model' . $url, 'SSL');
//		$this->data['sort_price'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . '&sort=p.price' . $url, 'SSL');
//		$this->data['sort_quantity'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, 'SSL');
		$this->data['sort_order'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . $this->request->get['filter_model'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

/*
		$pagination = new Pagination();
		$pagination->total = $thread_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();
*/
		$this->data['filter_title'] = $filter_title;
		$this->data['filter_model'] = $filter_model;
//		$this->data['filter_price'] = $filter_price;
//		$this->data['filter_quantity'] = $filter_quantity;
		$this->data['filter_status'] = $filter_status;

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

			$this->template = 'forum/thread_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function getForm() {
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = array();
		}

		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}

			if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}

			if (isset($this->error['model'])) {
			$this->data['error_model'] = $this->error['model'];
		} else {
			$this->data['error_model'] = '';
		}

		if (isset($this->error['date_available'])) {
			$this->data['error_date_available'] = $this->error['date_available'];
		} else {
			$this->data['error_date_available'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . $this->request->get['filter_title'];
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . $this->request->get['filter_model'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
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

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		if (!isset($this->request->get['thread_id'])) {
			$this->data['action'] = $this->url->link('forum/thread/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('forum/thread/update', 'token=' . $this->session->data['token'] . '&thread_id=' . $this->request->get['thread_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('forum/thread', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['thread_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$thread_info = $this->model_forum_thread->getThread($this->request->get['thread_id']);
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['thread_description'])) {
			$this->data['thread_description'] = $this->request->post['thread_description'];
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_description'] = $this->model_forum_thread->getThreadDescriptions($this->request->get['thread_id']);
		} else {
			$this->data['thread_description'] = array();
		}

		if (isset($this->request->post['model'])) {
			$this->data['model'] = $this->request->post['model'];
		} elseif (!empty($thread_info)) {
			$this->data['model'] = $thread_info['model'];
		} else {
			$this->data['model'] = '';
		}
/*
		if (isset($this->request->post['sku'])) {
			$this->data['sku'] = $this->request->post['sku'];
		} elseif (!empty($thread_info)) {
			$this->data['sku'] = $thread_info['sku'],
		} else {
			$this->data['sku'] = '';
		}

		if (isset($this->request->post['upc'])) {
			$this->data['upc'] = $this->request->post['upc'],
		} elseif (!empty($thread_info)) {
			$this->data['upc'] = $thread_info['upc'],
		} else {
			$this->data['upc'] = '';
		}
*/
		if (isset($this->request->post['location'])) {
			$this->data['location'] = $this->request->post['location'];
		} elseif (!empty($thread_info)) {
			$this->data['location'] = $thread_info['location'];
		} else {
			$this->data['location'] = '';
		}

		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['thread_store'])) {
			$this->data['thread_store'] = $this->request->post['thread_store'];
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_store'] = $this->model_forum_thread->getThreadStores($this->request->get['thread_id']);
		} else {
			$this->data['thread_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($thread_info)) {
			$this->data['keyword'] = $thread_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['thread_tag'])) {
			$this->data['thread_tag'] = $this->request->post['thread_tag'];
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_tag'] = $this->model_forum_thread->getThreadTags($this->request->get['thread_id']);
		} else {
			$this->data['thread_tag'] = array();
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($thread_info)) {
			$this->data['image'] = $thread_info['image'];
		} else {
			$this->data['image'] = '';
		}

		$this->load->model('tool/image');
		if (!empty($thread_info) && $thread_info['image'] && file_exists(DIR_IMAGE . $thread_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($thread_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->load->model('forum/user');
		$this->data['users'] = $this->model_forum_user->getUsers();

		if (isset($this->request->post['user_id'])) {
			$this->data['user_id'] = $this->request->post['user_id'];
		} elseif (!empty($thread_info)) {
			$this->data['user_id'] = $thread_info['user_id'];
		} else {
			$this->data['user_id'] = 0;
		}
/*
		if (isset($this->request->post['shipping'])) {
			$this->data['shipping'] = $this->request->post['shipping'],
		} elseif (!empty($thread_info)) {
			$this->data['shipping'] = $thread_info['shipping'],
		} else {
			$this->data['shipping'] = 1;
		}

		if (isset($this->request->post['price'])) {
			$this->data['price'] = $this->request->post['price'],
		} else if (!empty($thread_info)) {
			$this->data['price'] = $thread_info['price'],
		} else {
			$this->data['price'] = '';
		}
		$this->load->model('localisation/tax_class');
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
			if (isset($this->request->post['tax_class_id'])) {
			$this->data['tax_class_id'] = $this->request->post['tax_class_id'],
		} else if (!empty($thread_info)) {
			$this->data['tax_class_id'] = $thread_info['tax_class_id'],
		} else {
			$this->data['tax_class_id'] = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$this->data['quantity'] = $this->request->post['quantity'],
		} elseif (!empty($thread_info)) {
			$this->data['quantity'] = $thread_info['quantity'],
		} else {
			$this->data['quantity'] = 1;
		}

		if (isset($this->request->post['minimum'])) {
			$this->data['minimum'] = $this->request->post['minimum'],
		} elseif (!empty($thread_info)) {
			$this->data['minimum'] = $thread_info['minimum'],
		} else {
			$this->data['minimum'] = 1;
		}

		if (isset($this->request->post['subtract'])) {
			$this->data['subtract'] = $this->request->post['subtract'],
		} elseif (!empty($thread_info)) {
			$this->data['subtract'] = $thread_info['subtract'],
		} else {
			$this->data['subtract'] = 1;
		}
*/
		if (isset($this->request->post['date_available'])) {
      		$this->data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($thread_info)) {
			$this->data['date_available'] = date('Y-m-d', strtotime($thread_info['date_available']));
		} else {
			$this->data['date_available'] = date('Y-m-d', time() - 86400);
		}

		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($thread_info)) {
			$this->data['sort_order'] = $thread_info['sort_order'];
		} else {
			$this->data['sort_order'] = 1;
		}

/*
		$this->load->model('localisation/stock_status');

		$this->data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		if (isset($this->request->post['stock_status_id'])) {
			$this->data['stock_status_id'] = $this->request->post['stock_status_id'],
		} else if (!empty($thread_info)) {
			$this->data['stock_status_id'] = $thread_info['stock_status_id'],
		} else {
			$this->data['stock_status_id'] = $this->config->get('config_stock_status_id');
		}
*/
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} else if (!empty($thread_info)) {
			$this->data['status'] = $thread_info['status'];
		} else {
			$this->data['status'] = 1;
		}
/*
		if (isset($this->request->post['weight'])) {
			$this->data['weight'] = $this->request->post['weight'],
		} else if (!empty($thread_info)) {
			$this->data['weight'] = $thread_info['weight'],
		} else {
			$this->data['weight'] = '';
		}
		$this->load->model('localisation/weight_class');

		$this->data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();
			if (isset($this->request->post['weight_class_id'])) {
			$this->data['weight_class_id'] = $this->request->post['weight_class_id'],
		} elseif (!empty($thread_info)) {
			$this->data['weight_class_id'] = $thread_info['weight_class_id'],
		} else {
			$this->data['weight_class_id'] = $this->config->get('config_weight_class_id');
		}
		if (isset($this->request->post['length'])) {
			$this->data['length'] = $this->request->post['length'],
		} elseif (!empty($thread_info)) {
			$this->data['length'] = $thread_info['length'],
		} else {
			$this->data['length'] = '';
		}

		if (isset($this->request->post['width'])) {
			$this->data['width'] = $this->request->post['width'],
		} elseif (!empty($thread_info)) {
			$this->data['width'] = $thread_info['width'],
		} else {
			$this->data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$this->data['height'] = $this->request->post['height'],
		} elseif (!empty($thread_info)) {
			$this->data['height'] = $thread_info['height'],
		} else {
			$this->data['height'] = '';
		}

		$this->load->model('localisation/length_class');

		$this->data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();
			if (isset($this->request->post['length_class_id'])) {
			$this->data['length_class_id'] = $this->request->post['length_class_id'],
		} elseif (!empty($thread_info)) {
			$this->data['length_class_id'] = $thread_info['length_class_id'],
		} else {
			$this->data['length_class_id'] = $this->config->get('config_length_class_id');
		}

		if (isset($this->request->post['thread_attribute'])) {
			$this->data['thread_attributes'] = $this->request->post['thread_attribute'],
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_attributes'] = $this->model_forum_thread->getThreadAttributes($this->request->get['thread_id']);
		} else {
			$this->data['thread_attributes'] = array();
		}
		$this->load->model('catalog/option');
		if (isset($this->request->post['thread_option'])) {
			$thread_options = $this->request->post['thread_option'],
		} elseif (isset($this->request->get['thread_id'])) {
			$thread_options = $this->model_forum_thread->getThreadOptions($this->request->get['thread_id']);
		} else {
			$thread_options = array();
		}

		$this->data['thread_options'] = array();

		foreach ($thread_options as $thread_option) {
			if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox' || $thread_option['type'] == 'image') {
				$thread_option_value_data = array();

				foreach ($thread_option['thread_option_value'] as $thread_option_value) {
					$thread_option_value_data[] = array(
						'thread_option_value_id' => $thread_option_value['thread_option_value_id'],
						'option_value_id'         => $thread_option_value['option_value_id'],
						'quantity'                => $thread_option_value['quantity'],
						'subtract'                => $thread_option_value['subtract'],
						'price'                   => $thread_option_value['price'],
						'price_prefix'            => $thread_option_value['price_prefix'],
						'points'                  => $thread_option_value['points'],
						'points_prefix'           => $thread_option_value['points_prefix'],
						'weight'                  => $thread_option_value['weight'],
						'weight_prefix'           => $thread_option_value['weight_prefix']
					);
				}

				$this->data['thread_options'][] = array(
					'thread_option_id'    => $thread_option['thread_option_id'],
					'thread_option_value' => $thread_option_value_data,
					'option_id'            => $thread_option['option_id'],
					'title'                 => $thread_option['title'],
					'type'                 => $thread_option['type'],
					'required'             => $thread_option['required']
				);
			} else {
				$this->data['thread_options'][] = array(
					'thread_option_id' => $thread_option['thread_option_id'],
					'option_id'         => $thread_option['option_id'],
					'title'              => $thread_option['title'],
					'type'              => $thread_option['type'],
					'option_value'      => $thread_option['option_value'],
					'required'          => $thread_option['required']
				);
			}
		}
		$this->data['option_values'] = array();
		foreach ($thread_options as $thread_option) {
			if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox' || $thread_option['type'] == 'image') {
				if (!isset($this->data['option_values'][$thread_option['option_id']])) {
					$this->data['option_values'][$thread_option['option_id']] = $this->model_forum_option->getOptionValues($thread_option['option_id']);
				}
			}
		}
		$this->load->model('sale/customer_group');

		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		if (isset($this->request->post['thread_discount'])) {
			$this->data['thread_discounts'] = $this->request->post['thread_discount'],
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_discounts'] = $this->model_forum_thread->getThreadDiscounts($this->request->get['thread_id']);
		} else {
			$this->data['thread_discounts'] = array();
		}

		if (isset($this->request->post['thread_special'])) {
			$this->data['thread_specials'] = $this->request->post['thread_special'],
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_specials'] = $this->model_forum_thread->getThreadSpecials($this->request->get['thread_id']);
		} else {
			$this->data['thread_specials'] = array();
		}
*/

		if (isset($this->request->post['thread_image'])) {
			$thread_images = $this->request->post['thread_image'];
		} elseif (isset($this->request->get['thread_id'])) {
			$thread_images = $this->model_forum_thread->getThreadImages($this->request->get['thread_id']);
		} else {
			$thread_images = array();
		}

		$this->data['thread_images'] = array();

		foreach ($thread_images as $thread_image) {
			if ($thread_image['image'] && file_exists(DIR_IMAGE . $thread_image['image'])) {
				$image = $thread_image['image'];
			} else {
				$image = 'no_image.jpg';
			}

			$this->data['thread_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($image, 100, 100),
				'sort_order' => $thread_image['sort_order'],
			);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
/*
		$this->load->model('catalog/download');

		$this->data['downloads'] = $this->model_forum_download->getDownloads();

		if (isset($this->request->post['thread_download'])) {
			$this->data['thread_download'] = $this->request->post['thread_download'],
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_download'] = $this->model_forum_thread->getThreadDownloads($this->request->get['thread_id']);
		} else {
			$this->data['thread_download'] = array();
		}
*/
		$this->load->model('forum/forum_category');

		$this->data['categories'] = $this->model_forum_forum_category->getCategories(0);

		if (isset($this->request->post['thread_category'])) {
			$this->data['thread_category'] = $this->request->post['thread_category'];
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_category'] = $this->model_forum_thread->getThreadCategories($this->request->get['thread_id']);
		} else {
			$this->data['thread_category'] = array();
		}

		if (isset($this->request->post['thread_related'])) {
			$threads = $this->request->post['thread_related'];
		} elseif (isset($this->request->get['thread_id'])) {
			$threads = $this->model_forum_thread->getThreadRelated($this->request->get['thread_id']);
		} else {
			$threads = array();
		}

		$this->data['thread_related'] = array();

		foreach ($threads as $thread_id) {
			$related_info = $this->model_forum_thread->getThread($thread_id);

			if ($related_info) {
				$this->data['thread_related'][] = array(
					'thread_id' => $related_info['thread_id'];
					'title'       => $related_info['title']
				);
			}
		}

		if (isset($this->request->post['points'])) {
			$this->data['points'] = $this->request->post['points'];
		} else if (!empty($thread_info)) {
			$this->data['points'] = $thread_info['points'];
		} else {
			$this->data['points'] = '';
		}

		if (isset($this->request->post['thread_reward'])) {
			$this->data['thread_reward'] = $this->request->post['thread_reward'];
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_reward'] = $this->model_forum_thread->getThreadRewards($this->request->get['thread_id']);
		} else {
			$this->data['thread_reward'] = array();
		}

		if (isset($this->request->post['thread_layout'])) {
			$this->data['thread_layout'] = $this->request->post['thread_layout'];
		} elseif (isset($this->request->get['thread_id'])) {
			$this->data['thread_layout'] = $this->model_forum_thread->getThreadLayouts($this->request->get['thread_id']);
		} else {
			$this->data['thread_layout'] = array();
		}

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addScript(URL_JS . 'libs/ckeditor/ckeditor.js');
		$this->document->addScript(URL_JS . 'admin/filemanager.js');
		$this->document->addScript(URL_JS . 'jquery/ui/jquery-ui-timepicker-addon.js');

		$this->template = 'forum/thread_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'forum/thread')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['thread_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 1) || (utf8_strlen($value['title']) > 255)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		}
		if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
			$this->error['model'] = $this->language->get('error_model');
		}
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'forum/thread')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateCopy() {
		if (!$this->user->hasPermission('modify', 'forum/thread')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function option() {
		$output = '';

		$this->load->model('catalog/option');

		$results = $this->model_forum_option->getOptionValues($this->request->get['option_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['option_value_id'] . '"';

			if (isset($this->request->get['option_value_id']) && ($this->request->get['option_value_id'] == $result['option_value_id'])) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['title'] . '</option>';
		}

		$this->response->setOutput($output);
	}

	public function autocomplete() {
		$json = array();
		if (isset($this->request->get['filter_title']) || isset($this->request->get['filter_model']) || isset($this->request->get['filter_category_id'])) {
			$this->load->model('forum/thread');

			if (isset($this->request->get['filter_title'])) {
				$filter_title = $this->request->get['filter_title'];
			} else {
				$filter_title = '';
			}

			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}

			if (isset($this->request->get['filter_category_id'])) {
				$filter_category_id = $this->request->get['filter_category_id'];
			} else {
				$filter_category_id = '';
			}

			if (isset($this->request->get['filter_sub_category'])) {
				$filter_sub_category = $this->request->get['filter_sub_category'];
			} else {
				$filter_sub_category = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 20;
			}

			$data = array(
				'filter_title'         => $filter_title,
				'filter_model'        => $filter_model,
				'filter_category_id'  => $filter_category_id,
				'filter_sub_category' => $filter_sub_category,
				'start'               => 0,
				'limit'               => $limit
			);

			$results = $this->model_forum_thread->getThreads($data);

			foreach ($results as $result) {
				$option_data = array();
/*
				$thread_options = $this->model_forum_thread->getThreadOptions($result['thread_id']);

				foreach ($thread_options as $thread_option) {
					if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox' || $thread_option['type'] == 'image') {
						$option_value_data = array();

						foreach ($thread_option['thread_option_value'] as $thread_option_value) {
							$option_value_data[] = array(
								'thread_option_value_id' => $thread_option_value['thread_option_value_id'],
								'option_value_id'         => $thread_option_value['option_value_id'],
								'title'                    => $thread_option_value['title'],
								'price'                   => (float)$thread_option_value['price'] ? $this->currency->format($thread_option_value['price'], $this->config->get('config_currency')) : false,
								'price_prefix'            => $thread_option_value['price_prefix']
							);
						}

						$option_data[] = array(
							'thread_option_id' => $thread_option['thread_option_id'],
							'option_id'         => $thread_option['option_id'],
							'title'              => $thread_option['title'],
							'type'              => $thread_option['type'],
							'option_value'      => $option_value_data,
							'required'          => $thread_option['required']
						);
					} else {
						$option_data[] = array(
							'thread_option_id' => $thread_option['thread_option_id'],
							'option_id'         => $thread_option['option_id'],
							'title'              => $thread_option['title'],
							'type'              => $thread_option['type'],
							'option_value'      => $thread_option['option_value'],
							'required'          => $thread_option['required']
						);
					}
				}
*/
				$json[] = array(
					'thread_id' => $result['thread_id'],
					'title'       => html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8'),
					'model'      => $result['model'],
//					'option'     => $option_data,
//					'price'      => $result['price']
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
