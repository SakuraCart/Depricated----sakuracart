<?php
class ControllerLocalisationStockStatus extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('localisation/stock_status'));
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('localisation/stock_status');
		$this->getList();
	}


	public function insert() {
		$this->data = array_merge($this->data, $this->load->language('localisation/stock_status'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('localisation/stock_status');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_stock_status->addStockStatus($this->request->post);

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

			$this->redirect($this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('localisation/stock_status'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('localisation/stock_status');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_stock_status->editStockStatus($this->request->get['stock_status_id'], $this->request->post);

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

			$this->redirect($this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->data = array_merge($this->data, $this->load->language('localisation/stock_status'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('localisation/stock_status');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $stock_status_id) {
				$this->model_localisation_stock_status->deleteStockStatus($stock_status_id);
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

			$this->redirect($this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
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

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['insert'] = $this->url->link('localisation/stock_status/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('localisation/stock_status/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['stock_statuses'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$stock_status_total = $this->model_localisation_stock_status->getTotalStockStatuses();

		$results = $this->model_localisation_stock_status->getStockStatuses($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('localisation/stock_status/update', 'token=' . $this->session->data['token'] . '&stock_status_id=' . $result['stock_status_id'] . $url, 'SSL')
			);

			$this->data['stock_statuses'][] = array(
				'stock_status_id' => $result['stock_status_id'],
				'name'            => $result['name'] . (($result['stock_status_id'] == $this->config->get('config_stock_status_id')) ? $this->language->get('text_default') : null),
				'selected'        => isset($this->request->post['selected']) && in_array($result['stock_status_id'], $this->request->post['selected']),
				'action'          => $action
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

		$this->data['sort_name'] = $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $stock_status_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'localisation/stock_status_list.tpl';
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

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
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

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		if (!isset($this->request->get['stock_status_id'])) {
			$this->data['action'] = $this->url->link('localisation/stock_status/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('localisation/stock_status/update', 'token=' . $this->session->data['token'] . '&stock_status_id=' . $this->request->get['stock_status_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('localisation/stock_status', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['stock_status'])) {
			$this->data['stock_status'] = $this->request->post['stock_status'];
		} elseif (isset($this->request->get['stock_status_id'])) {
			$this->data['stock_status'] = $this->model_localisation_stock_status->getStockStatusDescriptions($this->request->get['stock_status_id']);
		} else {
			$this->data['stock_status'] = array();
		}

		$this->document->addStyle('view/stylesheet/table.css');
//		$this->document->addScript(URL_JS . 'admin/filemanager.js');

		$this->template = 'localisation/stock_status_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'localisation/stock_status')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		foreach ($this->request->post['stock_status'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 32)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'localisation/stock_status')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('setting/store');
		$this->load->model('catalog/product');

		foreach ($this->request->post['selected'] as $stock_status_id) {
			if ($this->config->get('config_stock_status_id') == $stock_status_id) {
				$this->error['warning'] = $this->language->get('error_default');
			}

			$product_total = $this->model_catalog_product->getTotalProductsByStockStatusId($stock_status_id);

			if ($product_total) {
				$this->error['warning'] = sprintf($this->language->get('error_product'), $product_total);
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
