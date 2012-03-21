<?php
class ControllerForumPost extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('forum/post'));
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('forum/post');
		$this->getList();
	}

	public function insert() {
		$this->data = array_merge($this->data, $this->load->language('forum/post'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/post');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

//print_r($this->request->post);
//exit;

			$this->model_forum_post->addPost($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

//			$this->redirect($this->url->link('forum/post'));
			$this->redirect($this->url->link('forum/thread/&thread_id='.$this->request->post['thread_id']));
		}

		$this->getForm();
	}

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('forum/post'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/post');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_forum_post->editPost($this->request->get['post_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->redirect($this->url->link('forum/post'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->data = array_merge($this->data, $this->load->language('forum/post'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('forum/post');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $post_id) {
				$this->model_forum_post->deletePost($post_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->redirect($this->url->link('forum/post'));
		}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'r.date_added';
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

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
//			'href'      => $this->url->link('common/home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('forum/post'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['insert'] = $this->url->link('forum/post/insert');
		$this->data['delete'] = $this->url->link('forum/post/delete');

		$this->data['posts'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$post_total = $this->model_forum_post->getTotalPosts();

		$results = $this->model_forum_post->getPosts($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('forum/post/update', 'token=' . $this->session->data['token'] . '&post_id=' . $result['post_id'] . $url, 'SSL')
			);

			$this->data['posts'][] = array(
				'post_id'  => $result['post_id'],
				'name'       => $result['name'],
				'user'     => $result['user'],
				'rating'     => $result['rating'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'   => isset($this->request->post['selected']) && in_array($result['post_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}

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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
/*
		$this->data['sort_thread'] = $this->url->link('forum/post', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, 'SSL');
		$this->data['sort_user'] = $this->url->link('forum/post', 'token=' . $this->session->data['token'] . '&sort=r.user' . $url, 'SSL');
		$this->data['sort_rating'] = $this->url->link('forum/post', 'token=' . $this->session->data['token'] . '&sort=r.rating' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('forum/post', 'token=' . $this->session->data['token'] . '&sort=r.status' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('forum/post', 'token=' . $this->session->data['token'] . '&sort=r.date_added' . $url, 'SSL');
*/
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $post_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('forum/post', $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

//		$this->template = 'forum/post_list.tpl';

if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/forum/thread.tpl')) {
		$this->template = $this->config->get('config_template') . '/template/forum/thread.tpl';
} else {
	$this->template = 'default/template/forum/thread.tpl';
}

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

		if (isset($this->error['thread'])) {
			$this->data['error_thread'] = $this->error['thread'];
		} else {
			$this->data['error_thread'] = '';
		}

		if (isset($this->error['user'])) {
			$this->data['error_user'] = $this->error['user'];
		} else {
			$this->data['error_user'] = '';
		}

		if (isset($this->error['text'])) {
			$this->data['error_text'] = $this->error['text'];
		} else {
			$this->data['error_text'] = '';
		}

		if (isset($this->error['rating'])) {
			$this->data['error_rating'] = $this->error['rating'];
		} else {
			$this->data['error_rating'] = '';
		}

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

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
//			'href'      => $this->url->link('common/home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('forum/post'),
			'separator' => $this->language->get('text_separator')
		);

		if (!isset($this->request->get['post_id'])) {
			$this->data['action'] = $this->url->link('forum/post/insert');
		} else {
			$this->data['action'] = $this->url->link('forum/post/update', 'token=' . $this->session->data['token'] . '&post_id=' . $this->request->get['post_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('forum/post');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['post_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$post_info = $this->model_forum_post->getPost($this->request->get['post_id']);
		}

		$this->load->model('forum/forum');

		if (isset($this->request->post['thread_id'])) {
			$this->data['thread_id'] = $this->request->post['thread_id'];
		} elseif (isset($post_info)) {
			$this->data['thread_id'] = $post_info['thread_id'];
		} else {
			$this->data['thread_id'] = '';
		}

		if (isset($this->request->post['thread'])) {
			$this->data['thread'] = $this->request->post['thread'];
		} elseif (isset($post_info)) {
			$this->data['thread'] = $post_info['thread'];
		} else {
			$this->data['thread'] = '';
		}

		if (isset($this->request->post['user'])) {
			$this->data['user'] = $this->request->post['user'];
		} elseif (isset($post_info)) {
			$this->data['user'] = $post_info['user'];
		} else {
			$this->data['user'] = '';
		}

		if (isset($this->request->post['text'])) {
			$this->data['text'] = $this->request->post['text'];
		} elseif (isset($post_info)) {
			$this->data['text'] = $post_info['text'];
		} else {
			$this->data['text'] = '';
		}

		if (isset($this->request->post['rating'])) {
			$this->data['rating'] = $this->request->post['rating'];
		} elseif (isset($post_info)) {
			$this->data['rating'] = $post_info['rating'];
		} else {
			$this->data['rating'] = '';
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (isset($post_info)) {
			$this->data['status'] = $post_info['status'];
		} else {
			$this->data['status'] = '';
		}

		$this->template = 'forum/post_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validateForm() {
/*
		if (!$this->user->hasPermission('modify', 'forum/post')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
*/
		if (!$this->request->post['thread_id']) {
			$this->error['thread'] = $this->language->get('error_thread');
		}
/*
		if ((strlen(utf8_decode($this->request->post['user'])) < 3) || (strlen(utf8_decode($this->request->post['user'])) > 64)) {
			$this->error['user'] = $this->language->get('error_user');
		}
*/
		if (strlen(utf8_decode($this->request->post['description'])) < 1) {
			$this->error['description'] = $this->language->get('error_text');
		}
/*
		if (!isset($this->request->post['rating'])) {
			$this->error['rating'] = $this->language->get('error_rating');
		}
*/
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'forum/post')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
