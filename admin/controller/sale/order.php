<?php
class ControllerSaleOrder extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		$this->getList();
	}

	public function insert() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_order->addOrder($this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . $this->request->get['filter_customer'];
			}

			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['filter_date_modified'])) {
				$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			$this->redirect($this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_order->editOrder($this->request->get['order_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . $this->request->get['filter_customer'];
			}

			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['filter_date_modified'])) {
				$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			$this->redirect($this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		if (isset($this->request->post['selected']) && ($this->validateDelete())) {
			foreach ($this->request->post['selected'] as $order_id) {
				$this->model_sale_order->deleteOrder($order_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . $this->request->get['filter_customer'];
			}

			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['filter_date_modified'])) {
				$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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

			$this->redirect($this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['filter_order_id'])) {
			$filter_order_id = $this->request->get['filter_order_id'];
		} else {
			$filter_order_id = null;
		}

		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = null;
		}

		if (isset($this->request->get['filter_total'])) {
			$filter_total = $this->request->get['filter_total'];
		} else {
			$filter_total = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$filter_date_modified = $this->request->get['filter_date_modified'];
		} else {
			$filter_date_modified = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'o.order_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . $this->request->get['filter_customer'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			'href'      => $this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['invoice'] = $this->url->link('sale/order/invoice', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['insert'] = $this->url->link('sale/order/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('sale/order/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['orders'] = array();

		$data = array(
			'filter_order_id'        => $filter_order_id,
			'filter_customer'	  => $filter_customer,
			'filter_order_status_id' => $filter_order_status_id,
			'filter_total'           => $filter_total,
			'filter_date_added'      => $filter_date_added,
			'filter_date_modified'   => $filter_date_modified,
			'sort'                   => $sort,
			'order'                  => $order,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);

		$order_total = $this->model_sale_order->getTotalOrders($data);

		$results = $this->model_sale_order->getOrders($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_view'),
				'href' => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL')
			);
			if (strtotime($result['date_added']) > strtotime('-' . (int)$this->config->get('config_order_edit') . ' day')) {
				$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('sale/order/update', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL')
				);
			}
			$this->data['orders'][] = array(
				'order_id'      => $result['order_id'],
				'customer'      => $result['customer'],
				'status'        => $result['status'],
				'total'         => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'date_added'    => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'selected'      => isset($this->request->post['selected']) && in_array($result['order_id'], $this->request->post['selected']),
				'action'        => $action
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

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . $this->request->get['filter_customer'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_order'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.order_id' . $url, 'SSL');
		$this->data['sort_customer'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=customer' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$this->data['sort_total'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.total' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.date_added' . $url, 'SSL');
		$this->data['sort_date_modified'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . '&sort=o.date_modified' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . $this->request->get['filter_customer'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_order_id'] = $filter_order_id;
		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_order_status_id'] = $filter_order_status_id;
		$this->data['filter_total'] = $filter_total;
		$this->data['filter_date_added'] = $filter_date_added;
		$this->data['filter_date_modified'] = $filter_date_modified;

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'sale/order_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	public function getForm() {
		$this->data['token'] = $this->session->data['token'];
		if (isset($this->request->get['order_id'])) {
			$this->data['order_id'] = $this->request->get['order_id'];
		} else {
			$this->data['order_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}

		if (isset($this->error['shipping_firstname'])) {
			$this->data['error_shipping_firstname'] = $this->error['shipping_firstname'];
		} else {
			$this->data['error_shipping_firstname'] = '';
		}

		if (isset($this->error['shipping_lastname'])) {
			$this->data['error_shipping_lastname'] = $this->error['shipping_lastname'];
		} else {
			$this->data['error_shipping_lastname'] = '';
		}

		if (isset($this->error['shipping_address_1'])) {
			$this->data['error_shipping_address_1'] = $this->error['shipping_address_1'];
		} else {
			$this->data['error_shipping_address_1'] = '';
		}

		if (isset($this->error['shipping_city'])) {
			$this->data['error_shipping_city'] = $this->error['shipping_city'];
		} else {
			$this->data['error_shipping_city'] = '';
		}

		if (isset($this->error['shipping_postcode'])) {
			$this->data['error_shipping_postcode'] = $this->error['shipping_postcode'];
		} else {
			$this->data['error_shipping_postcode'] = '';
		}

		if (isset($this->error['shipping_country'])) {
			$this->data['error_shipping_country'] = $this->error['shipping_country'];
		} else {
			$this->data['error_shipping_country'] = '';
		}

		if (isset($this->error['shipping_zone'])) {
			$this->data['error_shipping_zone'] = $this->error['shipping_zone'];
		} else {
			$this->data['error_shipping_zone'] = '';
		}

		if (isset($this->error['payment_firstname'])) {
			$this->data['error_payment_firstname'] = $this->error['payment_firstname'];
		} else {
			$this->data['error_payment_firstname'] = '';
		}

		if (isset($this->error['payment_lastname'])) {
			$this->data['error_payment_lastname'] = $this->error['payment_lastname'];
		} else {
			$this->data['error_payment_lastname'] = '';
		}

		if (isset($this->error['payment_address_1'])) {
			$this->data['error_payment_address_1'] = $this->error['payment_address_1'];
		} else {
			$this->data['error_payment_address_1'] = '';
		}

		if (isset($this->error['payment_city'])) {
			$this->data['error_payment_city'] = $this->error['payment_city'];
		} else {
			$this->data['error_payment_city'] = '';
		}

		if (isset($this->error['payment_postcode'])) {
			$this->data['error_payment_postcode'] = $this->error['payment_postcode'];
		} else {
			$this->data['error_payment_postcode'] = '';
		}

		if (isset($this->error['payment_country'])) {
			$this->data['error_payment_country'] = $this->error['payment_country'];
		} else {
			$this->data['error_payment_country'] = '';
		}

		if (isset($this->error['payment_zone'])) {
			$this->data['error_payment_zone'] = $this->error['payment_zone'];
		} else {
			$this->data['error_payment_zone'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . $this->request->get['filter_customer'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			'href'      => $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		if (!isset($this->request->get['order_id'])) {
			$this->data['action'] = $this->url->link('sale/order/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('sale/order/update', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['order_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
		}
		if (isset($this->request->post['store_id'])) {
			$this->data['store_id'] = $this->request->post['store_id'];
		} elseif (!empty($order_info)) {
			$this->data['store_id'] = $order_info['store_id'];
		} else {
			$this->data['store_id'] = '';
		}

		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		$this->data['store_url'] = HTTP_CATALOG;

		if (isset($this->request->post['customer'])) {
			$this->data['customer'] = $this->request->post['customer'];
		} elseif (!empty($order_info)) {
			$this->data['customer'] = $order_info['customer'];
		} else {
			$this->data['customer'] = '';
		}

		if (isset($this->request->post['customer_id'])) {
			$this->data['customer_id'] = $this->request->post['customer_id'];
		} elseif (!empty($order_info)) {
			$this->data['customer_id'] = $order_info['customer_id'];
		} else {
			$this->data['customer_id'] = '';
		}
		if (isset($this->request->post['customer_group_id'])) {
			$this->data['customer_group_id'] = $this->request->post['customer_group_id'];
		} elseif (!empty($order_info)) {
			$this->data['customer_group_id'] = $order_info['customer_group_id'];
		} else {
			$this->data['customer_group_id'] = '';
		}

		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($order_info)) {
			$this->data['firstname'] = $order_info['firstname'];
		} else {
			$this->data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($order_info)) {
			$this->data['lastname'] = $order_info['lastname'];
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} elseif (!empty($order_info)) {
			$this->data['email'] = $order_info['email'];
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$this->data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($order_info)) {
			$this->data['telephone'] = $order_info['telephone'];
		} else {
			$this->data['telephone'] = '';
		}
		if (isset($this->request->post['fax'])) {
			$this->data['fax'] = $this->request->post['fax'];
		} elseif (!empty($order_info)) {
			$this->data['fax'] = $order_info['fax'];
		} else {
			$this->data['fax'] = '';
		} if (isset($this->request->post['affiliate_id'])) {
			$this->data['affiliate_id'] = $this->request->post['affiliate_id'];
		} elseif (!empty($order_info)) {
			$this->data['affiliate_id'] = $order_info['affiliate_id'];
		} else {
			$this->data['affiliate_id'] = '';
		}
		if (isset($this->request->post['affiliate'])) {
			$this->data['affiliate'] = $this->request->post['affiliate'];
		} elseif (!empty($order_info)) {
			$this->data['affiliate'] = ($order_info['affiliate_id'] ? $order_info['affiliate_firstname'] . ' ' . $order_info['affiliate_lastname'] : '');
		} else {
			$this->data['affiliate'] = '';
		}

		if (isset($this->request->post['order_status_id'])) {
			$this->data['order_status_id'] = $this->request->post['order_status_id'];
		} elseif (!empty($order_info)) {
			$this->data['order_status_id'] = $order_info['order_status_id'];
		} else {
			$this->data['order_status_id'] = '';
		}
		$this->load->model('localisation/order_status');
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();   	if (isset($this->request->post['comment'])) {
			$this->data['comment'] = $this->request->post['comment'];
		} elseif (!empty($order_info)) {
			$this->data['comment'] = $order_info['comment'];
		} else {
			$this->data['comment'] = '';
		} $this->load->model('sale/customer');

		if (isset($this->request->post['customer_id'])) {
			$this->data['addresses'] = $this->model_sale_customer->getAddresses($this->request->post['customer_id']);
		} elseif (!empty($order_info)) {
			$this->data['addresses'] = $this->model_sale_customer->getAddresses($order_info['customer_id']);
		} else {
			$this->data['addresses'] = array();
		}
		if (isset($this->request->post['shipping_firstname'])) {
			$this->data['shipping_firstname'] = $this->request->post['shipping_firstname'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_firstname'] = $order_info['shipping_firstname'];
		} else {
			$this->data['shipping_firstname'] = '';
		}

		if (isset($this->request->post['shipping_lastname'])) {
			$this->data['shipping_lastname'] = $this->request->post['shipping_lastname'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_lastname'] = $order_info['shipping_lastname'];
		} else {
			$this->data['shipping_lastname'] = '';
		}

		if (isset($this->request->post['shipping_company'])) {
			$this->data['shipping_company'] = $this->request->post['shipping_company'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_company'] = $order_info['shipping_company'];
		} else {
			$this->data['shipping_company'] = '';
		}

		if (isset($this->request->post['shipping_address_1'])) {
			$this->data['shipping_address_1'] = $this->request->post['shipping_address_1'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_address_1'] = $order_info['shipping_address_1'];
		} else {
			$this->data['shipping_address_1'] = '';
		}

		if (isset($this->request->post['shipping_address_2'])) {
			$this->data['shipping_address_2'] = $this->request->post['shipping_address_2'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_address_2'] = $order_info['shipping_address_2'];
		} else {
			$this->data['shipping_address_2'] = '';
		}
		if (isset($this->request->post['shipping_city'])) {
			$this->data['shipping_city'] = $this->request->post['shipping_city'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_city'] = $order_info['shipping_city'];
		} else {
			$this->data['shipping_city'] = '';
		}
		if (isset($this->request->post['shipping_postcode'])) {
			$this->data['shipping_postcode'] = $this->request->post['shipping_postcode'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_postcode'] = $order_info['shipping_postcode'];
		} else {
			$this->data['shipping_postcode'] = '';
		}

		if (isset($this->request->post['shipping_country_id'])) {
			$this->data['shipping_country_id'] = $this->request->post['shipping_country_id'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_country_id'] = $order_info['shipping_country_id'];
		} else {
			$this->data['shipping_country_id'] = '';
		}

		if (isset($this->request->post['shipping_zone_id'])) {
			$this->data['shipping_zone_id'] = $this->request->post['shipping_zone_id'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_zone_id'] = $order_info['shipping_zone_id'];
		} else {
			$this->data['shipping_zone_id'] = '';
		}
		if (isset($this->request->post['payment_firstname'])) {
			$this->data['payment_firstname'] = $this->request->post['payment_firstname'];
		} elseif (!empty($order_info)) {
			$this->data['payment_firstname'] = $order_info['payment_firstname'];
		} else {
			$this->data['payment_firstname'] = '';
		}

		if (isset($this->request->post['payment_lastname'])) {
			$this->data['payment_lastname'] = $this->request->post['payment_lastname'];
		} elseif (!empty($order_info)) {
			$this->data['payment_lastname'] = $order_info['payment_lastname'];
		} else {
			$this->data['payment_lastname'] = '';
		}

		if (isset($this->request->post['payment_company'])) {
			$this->data['payment_company'] = $this->request->post['payment_company'];
		} elseif (!empty($order_info)) {
			$this->data['payment_company'] = $order_info['payment_company'];
		} else {
			$this->data['payment_company'] = '';
		}

		if (isset($this->request->post['payment_address_1'])) {
			$this->data['payment_address_1'] = $this->request->post['payment_address_1'];
		} elseif (!empty($order_info)) {
			$this->data['payment_address_1'] = $order_info['payment_address_1'];
		} else {
			$this->data['payment_address_1'] = '';
		}

		if (isset($this->request->post['payment_address_2'])) {
			$this->data['payment_address_2'] = $this->request->post['payment_address_2'];
		} elseif (!empty($order_info)) {
			$this->data['payment_address_2'] = $order_info['payment_address_2'];
		} else {
			$this->data['payment_address_2'] = '';
		}
		if (isset($this->request->post['payment_city'])) {
			$this->data['payment_city'] = $this->request->post['payment_city'];
		} elseif (!empty($order_info)) {
			$this->data['payment_city'] = $order_info['payment_city'];
		} else {
			$this->data['payment_city'] = '';
		}

		if (isset($this->request->post['payment_postcode'])) {
			$this->data['payment_postcode'] = $this->request->post['payment_postcode'];
		} elseif (!empty($order_info)) {
			$this->data['payment_postcode'] = $order_info['payment_postcode'];
		} else {
			$this->data['payment_postcode'] = '';
		}

		if (isset($this->request->post['payment_country_id'])) {
			$this->data['payment_country_id'] = $this->request->post['payment_country_id'];
		} elseif (!empty($order_info)) {
			$this->data['payment_country_id'] = $order_info['payment_country_id'];
		} else {
			$this->data['payment_country_id'] = '';
		}

		if (isset($this->request->post['payment_zone_id'])) {
			$this->data['payment_zone_id'] = $this->request->post['payment_zone_id'];
		} elseif (!empty($order_info)) {
			$this->data['payment_zone_id'] = $order_info['payment_zone_id'];
		} else {
			$this->data['payment_zone_id'] = '';
		}

		$this->load->model('localisation/country');
		$this->data['countries'] = $this->model_localisation_country->getCountries();
		if (isset($this->request->post['shipping_method'])) {
			$this->data['shipping_method'] = $this->request->post['shipping_method'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_method'] = $order_info['shipping_method'];
		} else {
			$this->data['shipping_method'] = '';
		}   	if (isset($this->request->post['shipping_code'])) {
			$this->data['shipping_code'] = $this->request->post['shipping_code'];
		} elseif (!empty($order_info)) {
			$this->data['shipping_code'] = $order_info['shipping_code'];
		} else {
			$this->data['shipping_code'] = '';
		}

		if (isset($this->request->post['payment_method'])) {
			$this->data['payment_method'] = $this->request->post['payment_method'];
		} elseif (!empty($order_info)) {
			$this->data['payment_method'] = $order_info['payment_method'];
		} else {
			$this->data['payment_method'] = '';
		}
		if (isset($this->request->post['payment_code'])) {
			$this->data['payment_code'] = $this->request->post['payment_code'];
		} elseif (!empty($order_info)) {
			$this->data['payment_code'] = $order_info['payment_code'];
		} else {
			$this->data['payment_code'] = '';
		}
		if (isset($this->request->post['order_product'])) {
			$order_products = $this->request->post['order_product'];
		} elseif (isset($this->request->get['order_id'])) {
			$order_products = $this->model_sale_order->getOrderProducts($this->request->get['order_id']);
		} else {
			$order_products = array();
		}
		$this->load->model('catalog/product');
		$this->document->addScript('view/javascript/jquery/ajaxupload.js');
		$this->data['order_products'] = array();		foreach ($order_products as $order_product) {
			$product_info = $this->model_catalog_product->getProduct($order_product['product_id']);
			if ($product_info) {
				if (isset($order_product['order_option'])) {
					$order_option = $order_product['order_option'];
				} else {
					$order_option = $this->model_sale_order->getOrderOptions($this->request->get['order_id'], $order_product['order_product_id']);
				}

				if (isset($order_product['order_download'])) {
					$order_download = $order_product['order_download'];
				} else {
					$order_download = $this->model_sale_order->getOrderDownloads($this->request->get['order_id'], $order_product['order_product_id']);
				}

				$this->data['order_products'][] = array(
					'order_product_id' => $order_product['order_product_id'],
					'order_id'         => $order_product['order_id'],
					'product_id'       => $product_info['product_id'],
					'name'             => $product_info['name'],
					'model'            => $product_info['model'],
					'option'           => $order_option,
					'download'         => $order_download,
					'quantity'         => $order_product['quantity'],
					'price'            => $order_product['price'],
					'total'            => $order_product['total'],
					'tax'              => $order_product['tax']
				);
			}
		}
		if (isset($this->request->post['order_total'])) {
			$this->data['order_totals'] = $this->request->post['order_total'];
		} elseif (isset($this->request->get['order_id'])) {
			$this->data['order_totals'] = $this->model_sale_order->getOrderTotals($this->request->get['order_id']);
		} else {
			$this->data['order_totals'] = array();
		}

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'sale/order_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	public function info() {
		$this->load->model('sale/order');

		if (isset($this->request->get['order_id'])) {
			$order_id = $this->request->get['order_id'];
		} else {
			$order_id = 0;
		}

		$order_info = $this->model_sale_order->getOrder($order_id);

		if ($order_info) {
			$this->data = array_merge($this->data, $this->load->language('sale/order'));
			$this->document->setTitle($this->language->get('heading_title'));

			$this->data['token'] = $this->session->data['token'];

			$url = '';

			if (isset($this->request->get['filter_order_id'])) {
				$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
			}

			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . $this->request->get['filter_customer'];
			}

			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
			}

			if (isset($this->request->get['filter_date_modified'])) {
				$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
				'href'      => $this->url->link('sale/order', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

			$this->data['invoice'] = $this->url->link('sale/order/invoice', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'], 'SSL');
			$this->data['cancel'] = $this->url->link('sale/order', 'token=' . $this->session->data['token'] . $url, 'SSL');

			$this->data['order_id'] = $this->request->get['order_id'];
			if ($order_info['invoice_no']) {
				$this->data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
			} else {
				$this->data['invoice_no'] = '';
			}
			$this->data['store_name'] = $order_info['store_name'];
			$this->data['store_url'] = $order_info['store_url'];
			$this->data['firstname'] = $order_info['firstname'];
			$this->data['lastname'] = $order_info['lastname'];

			if ($order_info['customer_id']) {
				$this->data['customer'] = $this->url->link('sale/customer/update', 'token=' . $this->session->data['token'] . '&customer_id=' . $order_info['customer_id'], 'SSL');
			} else {
				$this->data['customer'] = '';
			}

			$this->load->model('sale/customer_group');

			$customer_group_info = $this->model_sale_customer_group->getCustomerGroup($order_info['customer_group_id']);

			if ($customer_group_info) {
				$this->data['customer_group'] = $customer_group_info['name'];
			} else {
				$this->data['customer_group'] = '';
			}

			$this->data['email'] = $order_info['email'];
			$this->data['ip'] = $order_info['ip'];
			$this->data['telephone'] = $order_info['telephone'];
			$this->data['fax'] = $order_info['fax'];
			$this->data['comment'] = nl2br($order_info['comment']);
			$this->data['shipping_method'] = $order_info['shipping_method'];
			$this->data['payment_method'] = $order_info['payment_method'];
			$this->data['total'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value']);
			$this->data['reward'] = $order_info['reward'];

			if ($order_info['total'] < 0) {
				$this->data['credit'] = $order_info['total'];
			} else {
				$this->data['credit'] = 0;
			}

			$this->load->model('sale/customer');

			$this->data['credit_total'] = $this->model_sale_customer->getTotalTransactionsByOrderId($this->request->get['order_id']);

			$this->data['reward_total'] = $this->model_sale_customer->getTotalCustomerRewardsByOrderId($this->request->get['order_id']);

			$this->data['affiliate_firstname'] = $order_info['affiliate_firstname'];
			$this->data['affiliate_lastname'] = $order_info['affiliate_lastname'];

			if ($order_info['affiliate_id']) {
				$this->data['affiliate'] = $this->url->link('sale/affiliate/update', 'token=' . $this->session->data['token'] . '&affiliate_id=' . $order_info['affiliate_id'], 'SSL');
			} else {
				$this->data['affiliate'] = '';
			}

			$this->data['commission'] = $this->currency->format($order_info['commission'], $order_info['currency_code'], $order_info['currency_value']);

			$this->load->model('sale/affiliate');

			$this->data['commission_total'] = $this->model_sale_affiliate->getTotalTransactionsByOrderId($this->request->get['order_id']);

			$this->load->model('localisation/order_status');

			$order_status_info = $this->model_localisation_order_status->getOrderStatus($order_info['order_status_id']);

			if ($order_status_info) {
				$this->data['order_status'] = $order_status_info['name'];
			} else {
				$this->data['order_status'] = '';
			}
			$this->data['ip'] = $order_info['ip'];
			$this->data['forwarded_ip'] = $order_info['forwarded_ip'];
			$this->data['user_agent'] = $order_info['user_agent'];
			$this->data['accept_language'] = $order_info['accept_language'];
			$this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
			$this->data['date_modified'] = date($this->language->get('date_format_short'), strtotime($order_info['date_modified']));
			$this->data['payment_firstname'] = $order_info['payment_firstname'];
			$this->data['payment_lastname'] = $order_info['payment_lastname'];
			$this->data['payment_company'] = $order_info['payment_company'];
			$this->data['payment_address_1'] = $order_info['payment_address_1'];
			$this->data['payment_address_2'] = $order_info['payment_address_2'];
			$this->data['payment_city'] = $order_info['payment_city'];
			$this->data['payment_postcode'] = $order_info['payment_postcode'];
			$this->data['payment_zone'] = $order_info['payment_zone'];
			$this->data['payment_zone_code'] = $order_info['payment_zone_code'];
			$this->data['payment_country'] = $order_info['payment_country'];
			$this->data['shipping_firstname'] = $order_info['shipping_firstname'];
			$this->data['shipping_lastname'] = $order_info['shipping_lastname'];
			$this->data['shipping_company'] = $order_info['shipping_company'];
			$this->data['shipping_address_1'] = $order_info['shipping_address_1'];
			$this->data['shipping_address_2'] = $order_info['shipping_address_2'];
			$this->data['shipping_city'] = $order_info['shipping_city'];
			$this->data['shipping_postcode'] = $order_info['shipping_postcode'];
			$this->data['shipping_zone'] = $order_info['shipping_zone'];
			$this->data['shipping_zone_code'] = $order_info['shipping_zone_code'];
			$this->data['shipping_country'] = $order_info['shipping_country'];

			$this->data['products'] = array();

			$products = $this->model_sale_order->getOrderProducts($this->request->get['order_id']);

			foreach ($products as $product) {
				$option_data = array();

				$options = $this->model_sale_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);

				foreach ($options as $option) {
					if ($option['type'] != 'file') {
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => $option['value'],
							'type'  => $option['type']
						);
					} else {
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => utf8_substr($option['value'], 0, strrpos($option['value'], '.')),
							'type'  => $option['type'],
							'href'  => $this->url->link('sale/order/download', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . '&order_option_id=' . $option['order_option_id'], 'SSL')
						);
					}
				}

				$this->data['products'][] = array(
					'order_product_id' => $product['order_product_id'],
					'product_id'       => $product['product_id'],
					'name'             => $product['name'],
					'model'            => $product['model'],
					'option'           => $option_data,
					'quantity'         => $product['quantity'],
					'price'            => $this->currency->format($product['price'], $order_info['currency_code'], $order_info['currency_value']),
					'total'            => $this->currency->format($product['total'], $order_info['currency_code'], $order_info['currency_value']),
					'href'             => $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $product['product_id'], 'SSL')
				);
			}

			$this->data['totals'] = $this->model_sale_order->getOrderTotals($this->request->get['order_id']);

			$this->data['downloads'] = array();

			foreach ($products as $product) {
				$results = $this->model_sale_order->getOrderDownloads($this->request->get['order_id'], $product['order_product_id']);
				foreach ($results as $result) {
					$this->data['downloads'][] = array(
						'name'      => $result['name'],
						'filename'  => $result['mask'],
						'remaining' => $result['remaining']
					);
				}
			}

			$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

			$this->data['order_status_id'] = $order_info['order_status_id'];

			// Fraud
			$this->load->model('sale/fraud');
			$fraud_info = $this->model_sale_fraud->getFraud($order_info['order_id']);
			if ($fraud_info) {
				$this->data['country_match'] = $fraud_info['country_match'];

				if ($fraud_info['country_code']) {
					$this->data['country_code'] = $fraud_info['country_code'];
				} else {
					$this->data['country_code'] = $this->language->get('text_unknown');
				}

				$this->data['high_risk_country'] = $fraud_info['high_risk_country'];
				$this->data['distance'] = $fraud_info['distance'];

				if ($fraud_info['ip_region']) {
					$this->data['ip_region'] = $fraud_info['ip_region'];
				} else {
					$this->data['ip_region'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_city']) {
					$this->data['ip_city'] = $fraud_info['ip_city'];
				} else {
					$this->data['ip_city'] = $this->language->get('text_unknown');
				}

				$this->data['ip_latitude'] = $fraud_info['ip_latitude'];
				$this->data['ip_longitude'] = $fraud_info['ip_longitude'];

				if ($fraud_info['ip_isp']) {
					$this->data['ip_isp'] = $fraud_info['ip_isp'];
				} else {
					$this->data['ip_isp'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_org']) {
					$this->data['ip_org'] = $fraud_info['ip_org'];
				} else {
					$this->data['ip_org'] = $this->language->get('text_unknown');
				}

				$this->data['ip_asnum'] = $fraud_info['ip_asnum'];

				if ($fraud_info['ip_user_type']) {
					$this->data['ip_user_type'] = $fraud_info['ip_user_type'];
				} else {
					$this->data['ip_user_type'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_country_confidence']) {
					$this->data['ip_country_confidence'] = $fraud_info['ip_country_confidence'];
				} else {
					$this->data['ip_country_confidence'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_region_confidence']) {
					$this->data['ip_region_confidence'] = $fraud_info['ip_region_confidence'];
				} else {
					$this->data['ip_region_confidence'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_city_confidence']) {
					$this->data['ip_city_confidence'] = $fraud_info['ip_city_confidence'];
				} else {
					$this->data['ip_city_confidence'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_postal_confidence']) {
					$this->data['ip_postal_confidence'] = $fraud_info['ip_postal_confidence'];
				} else {
					$this->data['ip_postal_confidence'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_postal_code']) {
					$this->data['ip_postal_code'] = $fraud_info['ip_postal_code'];
				} else {
					$this->data['ip_postal_code'] = $this->language->get('text_unknown');
				}

				$this->data['ip_accuracy_radius'] = $fraud_info['ip_accuracy_radius'];

				if ($fraud_info['ip_net_speed_cell']) {
					$this->data['ip_net_speed_cell'] = $fraud_info['ip_net_speed_cell'];
				} else {
					$this->data['ip_net_speed_cell'] = $this->language->get('text_unknown');
				}

				$this->data['ip_metro_code'] = $fraud_info['ip_metro_code'];
				$this->data['ip_area_code'] = $fraud_info['ip_area_code'];

				if ($fraud_info['ip_time_zone']) {
					$this->data['ip_time_zone'] = $fraud_info['ip_time_zone'];
				} else {
					$this->data['ip_time_zone'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_region_name']) {
					$this->data['ip_region_name'] = $fraud_info['ip_region_name'];
				} else {
					$this->data['ip_region_name'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_domain']) {
					$this->data['ip_domain'] = $fraud_info['ip_domain'];
				} else {
					$this->data['ip_domain'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_country_name']) {
					$this->data['ip_country_name'] = $fraud_info['ip_country_name'];
				} else {
					$this->data['ip_country_name'] = $this->language->get('text_unknown');
				}
				if ($fraud_info['ip_continent_code']) {
					$this->data['ip_continent_code'] = $fraud_info['ip_continent_code'];
				} else {
					$this->data['ip_continent_code'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['ip_corporate_proxy']) {
					$this->data['ip_corporate_proxy'] = $fraud_info['ip_corporate_proxy'];
				} else {
					$this->data['ip_corporate_proxy'] = $this->language->get('text_unknown');
				}

				$this->data['anonymous_proxy'] = $fraud_info['anonymous_proxy'];
				$this->data['proxy_score'] = $fraud_info['proxy_score'];

				if ($fraud_info['is_trans_proxy']) {
					$this->data['is_trans_proxy'] = $fraud_info['is_trans_proxy'];
				} else {
					$this->data['is_trans_proxy'] = $this->language->get('text_unknown');
				}
				$this->data['free_mail'] = $fraud_info['free_mail'];
				$this->data['carder_email'] = $fraud_info['carder_email'];

				if ($fraud_info['high_risk_username']) {
					$this->data['high_risk_username'] = $fraud_info['high_risk_username'];
				} else {
					$this->data['high_risk_username'] = $this->language->get('text_unknown');
				}

				if ($fraud_info['high_risk_password']) {
					$this->data['high_risk_password'] = $fraud_info['high_risk_password'];
				} else {
					$this->data['high_risk_password'] = $this->language->get('text_unknown');
				}
				$this->data['bin_match'] = $fraud_info['bin_match'];

				if ($fraud_info['bin_country']) {
					$this->data['bin_country'] = $fraud_info['bin_country'];
				} else {
					$this->data['bin_country'] = $this->language->get('text_unknown');
				}
				$this->data['bin_name_match'] = $fraud_info['bin_name_match'];

				if ($fraud_info['bin_name']) {
					$this->data['bin_name'] = $fraud_info['bin_name'];
				} else {
					$this->data['bin_name'] = $this->language->get('text_unknown');
				}
				$this->data['bin_phone_match'] = $fraud_info['bin_phone_match'];

				if ($fraud_info['bin_phone']) {
					$this->data['bin_phone'] = $fraud_info['bin_phone'];
				} else {
					$this->data['bin_phone'] = $this->language->get('text_unknown');
				}
				if ($fraud_info['customer_phone_in_billing_location']) {
					$this->data['customer_phone_in_billing_location'] = $fraud_info['customer_phone_in_billing_location'];
				} else {
					$this->data['customer_phone_in_billing_location'] = $this->language->get('text_unknown');
				}
				$this->data['ship_forward'] = $fraud_info['ship_forward'];

				if ($fraud_info['city_postal_match']) {
					$this->data['city_postal_match'] = $fraud_info['city_postal_match'];
				} else {
					$this->data['city_postal_match'] = $this->language->get('text_unknown');
				}
				if ($fraud_info['ship_city_postal_match']) {
					$this->data['ship_city_postal_match'] = $fraud_info['ship_city_postal_match'];
				} else {
					$this->data['ship_city_postal_match'] = $this->language->get('text_unknown');
				}
				$this->data['score'] = $fraud_info['score'];
				$this->data['explanation'] = $fraud_info['explanation'];
				$this->data['risk_score'] = $fraud_info['risk_score'];
				$this->data['queries_remaining'] = $fraud_info['queries_remaining'];
				$this->data['maxmind_id'] = $fraud_info['maxmind_id'];
				$this->data['error'] = $fraud_info['error'];
			} else {
				$this->data['maxmind_id'] = '';
			}
		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

			$this->template = 'sale/order_info.tpl';
			$this->children = array(
				'common/header',
				'common/footer',
			);

			$this->response->setOutput($this->render());
		} else {
			$this->data = array_merge($this->data, $this->load->language('error/not_found'));
			$this->document->setTitle($this->language->get('heading_title'));

/*
			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

			$this->template = 'error/not_found.tpl';
			$this->children = array(
				'common/header',
				'common/footer',
			);

			$this->response->setOutput($this->render());
		}
	}
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))) {
			$this->error['email'] = $this->language->get('error_email');
		}
		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if ((utf8_strlen($this->request->post['shipping_firstname']) < 1) || (utf8_strlen($this->request->post['shipping_firstname']) > 32)) {
			$this->error['shipping_firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['shipping_lastname']) < 1) || (utf8_strlen($this->request->post['shipping_lastname']) > 32)) {
			$this->error['shipping_lastname'] = $this->language->get('error_lastname');
		}
		if ((utf8_strlen($this->request->post['shipping_address_1']) < 3) || (utf8_strlen($this->request->post['shipping_address_1']) > 128)) {
			$this->error['shipping_address_1'] = $this->language->get('error_address_1');
		}

		if ((utf8_strlen($this->request->post['shipping_city']) < 3) || (utf8_strlen($this->request->post['shipping_city']) > 128)) {
			$this->error['shipping_city'] = $this->language->get('error_city');
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['shipping_country_id']);
		if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['shipping_postcode']) < 2) || (utf8_strlen($this->request->post['shipping_postcode']) > 10)) {
			$this->error['shipping_postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['shipping_country_id'] == '') {
			$this->error['shipping_country'] = $this->language->get('error_country');
		}
		if ($this->request->post['shipping_zone_id'] == '') {
			$this->error['shipping_zone'] = $this->language->get('error_zone');
		}
		if ((utf8_strlen($this->request->post['payment_firstname']) < 1) || (utf8_strlen($this->request->post['payment_firstname']) > 32)) {
			$this->error['payment_firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['payment_lastname']) < 1) || (utf8_strlen($this->request->post['payment_lastname']) > 32)) {
			$this->error['payment_lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['payment_address_1']) < 3) || (utf8_strlen($this->request->post['payment_address_1']) > 128)) {
			$this->error['payment_address_1'] = $this->language->get('error_address_1');
		}

		if ((utf8_strlen($this->request->post['payment_city']) < 3) || (utf8_strlen($this->request->post['payment_city']) > 128)) {
			$this->error['payment_city'] = $this->language->get('error_city');
		}

		$country_info = $this->model_localisation_country->getCountry($this->request->post['payment_country_id']);
		if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['payment_postcode']) < 2) || (utf8_strlen($this->request->post['payment_postcode']) > 10)) {
			$this->error['payment_postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['payment_country_id'] == '') {
			$this->error['payment_country'] = $this->language->get('error_country');
		}

		if ($this->request->post['payment_zone_id'] == '') {
			$this->error['payment_zone'] = $this->language->get('error_zone');
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
		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function zone() {
		$output = '<option value="">' . $this->language->get('text_select') . '</option>';

		$this->load->model('localisation/zone');

		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';

			if (isset($this->request->get['zone_id']) && ($this->request->get['zone_id'] == $result['zone_id'])) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		if (!$results) {
			$output .= '<option value="0">' . $this->language->get('text_none') . '</option>';
		}

		$this->response->setOutput($output);
	}

	public function createInvoiceNo() {
		$this->language->load('sale/order');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');
			$invoice_no = $this->model_sale_order->createInvoiceNo($this->request->get['order_id']);
			if ($invoice_no) {
				$json['invoice_no'] = $invoice_no;
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function addCredit() {
		$this->language->load('sale/order');
		$json = array();
			if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

			if ($order_info && $order_info['customer_id']) {
				$this->load->model('sale/customer');

				$credit_total = $this->model_sale_customer->getTotalTransactionsByOrderId($this->request->get['order_id']);

				if (!$credit_total) {
					$this->model_sale_customer->addTransaction($order_info['customer_id'], $this->language->get('text_order_id') . ' #' . $this->request->get['order_id'], $order_info['total'], $this->request->get['order_id']);

					$json['success'] = $this->language->get('text_credit_added');
				} else {
					$json['error'] = $this->language->get('error_action');
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function removeCredit() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
			if ($order_info && $order_info['customer_id']) {
				$this->load->model('sale/customer');

				$this->model_sale_customer->deleteTransaction($this->request->get['order_id']);

				$json['success'] = $this->language->get('text_credit_removed');
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function addReward() {
		$this->language->load('sale/order');
		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

				$reward_total = $this->model_sale_customer->getTotalCustomerRewardsByOrderId($this->request->get['order_id']);

				if (!$reward_total) {
					$this->model_sale_customer->addReward($order_info['customer_id'], $this->language->get('text_order_id') . ' #' . $this->request->get['order_id'], $order_info['reward'], $this->request->get['order_id']);

					$json['success'] = $this->language->get('text_reward_added');
				} else {
					$json['error'] = $this->language->get('error_action');
				}
			} else {
				$json['error'] = $this->language->get('error_action');
			}

		$this->response->setOutput(json_encode($json));
	}

	public function removeReward() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

			if ($order_info && $order_info['customer_id']) {
				$this->load->model('sale/customer');

				$this->model_sale_customer->deleteReward($this->request->get['order_id']);

				$json['success'] = $this->language->get('text_reward_removed');
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function addCommission() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
			if ($order_info && $order_info['affiliate_id']) {
				$this->load->model('sale/affiliate');

				$affiliate_total = $this->model_sale_affiliate->getTotalTransactionsByOrderId($this->request->get['order_id']);

				if (!$affiliate_total) {
					$this->model_sale_affiliate->addTransaction($order_info['affiliate_id'], $this->language->get('text_order_id') . ' #' . $this->request->get['order_id'], $order_info['commission'], $this->request->get['order_id']);

					$json['success'] = $this->language->get('text_commission_added');
				} else {
					$json['error'] = $this->language->get('error_action');
				}
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function removeCommission() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$json = array();
			if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');
			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);
			if ($order_info && $order_info['affiliate_id']) {
				$this->load->model('sale/affiliate');

				$this->model_sale_affiliate->deleteTransaction($this->request->get['order_id']);

				$json['success'] = $this->language->get('text_commission_removed');
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function history() {
		$this->language->load('sale/order');
		$this->load->model('sale/order');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'sale/order')) {
			$this->model_sale_order->addOrderHistory($this->request->get['order_id'], $this->request->post);

			$this->data['success'] = $this->language->get('text_success');
		} else {
			$this->data['success'] = '';
		}
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'sale/order')) {
			$this->data['error_warning'] = $this->language->get('error_permission');
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_notify'] = $this->language->get('column_notify');
		$this->data['column_comment'] = $this->language->get('column_comment');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		$this->data['histories'] = array();
		$results = $this->model_sale_order->getOrderHistories($this->request->get['order_id'], ($page - 1) * 10, 10);
			foreach ($results as $result) {
			$this->data['histories'][] = array(
				'notify'     => $result['notify'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
				'status'     => $result['status'],
				'comment'    => nl2br($result['comment']),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		} $history_total = $this->model_sale_order->getTotalOrderHistories($this->request->get['order_id']);
		$pagination = new Pagination();
		$pagination->total = $history_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/order/history', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . '&page={page}', 'SSL');
		$this->data['pagination'] = $pagination->render();
		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'sale/order_history.tpl';
		$this->response->setOutput($this->render());
	}

	public function download() {
		$this->load->model('sale/order');

		if (isset($this->request->get['order_option_id'])) {
			$order_option_id = $this->request->get['order_option_id'];
		} else {
			$order_option_id = 0;
		}

		$option_info = $this->model_sale_order->getOrderOption($this->request->get['order_id'], $order_option_id);

		if ($option_info && $option_info['type'] == 'file') {
			$file = DIR_DOWNLOAD . $option_info['value'];
			$mask = basename(utf8_substr($option_info['value'], 0, strrpos($option_info['value'], '.')));

			if (!headers_sent()) {
				if (file_exists($file)) {
					header('Content-Description: File Transfer');
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
					header('Content-Transfer-Encoding: binary');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Length: ' . filesize($file));

					readfile($file, 'rb');
					exit;
				} else {
					exit('Error: Could not find file ' . $file . '!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			$this->data = array_merge($this->data, $this->load->language('error/not_found'));
			$this->document->setTitle($this->language->get('heading_title'));

/*
			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

			$this->template = 'error/not_found.tpl';
			$this->children = array(
				'common/header',
				'common/footer',
			);

			$this->response->setOutput($this->render());
		}
	}

	public function upload() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!empty($this->request->files['file']['name'])) {
				$filename = html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8');

				if ((strlen($filename) < 3) || (strlen($filename) > 128)) {
					$json['error'] = $this->language->get('error_filename');
				}
				$allowed = array();

				$filetypes = explode(',', $this->config->get('config_upload_allowed'));

				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}

				if (!in_array(utf8_substr(strrchr($filename, '.'), 1), $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}

				if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
				}
			} else {
				$json['error'] = $this->language->get('error_upload');
			}
			if (!isset($json['error'])) {
				if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
					$file = basename($filename) . '.' . md5(rand());

					$json['file'] = $file;

					move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
				}

				$json['success'] = $this->language->get('text_upload');
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function invoice() {
		$this->data = array_merge($this->data, $this->load->language('sale/order'));
		$this->data['title'] = $this->language->get('heading_title');

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}

		$this->load->model('sale/order');

		$this->load->model('setting/setting');

		$this->data['orders'] = array();

		$orders = array();

		if (isset($this->request->post['selected'])) {
			$orders = $this->request->post['selected'];
		} elseif (isset($this->request->get['order_id'])) {
			$orders[] = $this->request->get['order_id'];
		}

		foreach ($orders as $order_id) {
			$order_info = $this->model_sale_order->getOrder($order_id);

			if ($order_info) {
				$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);

				if ($store_info) {
					$store_address = $store_info['config_address'];
					$store_email = $store_info['config_email'];
					$store_telephone = $store_info['config_telephone'];
					$store_fax = $store_info['config_fax'];
				} else {
					$store_address = $this->config->get('config_address');
					$store_email = $this->config->get('config_email');
					$store_telephone = $this->config->get('config_telephone');
					$store_fax = $this->config->get('config_fax');
				}

				if ($order_info['invoice_no']) {
					$invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
				} else {
					$invoice_no = '';
				}

				if ($order_info['shipping_address_format']) {
					$format = $order_info['shipping_address_format'];
				} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}

				$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
				);

				$replace = array(
					'firstname' => $order_info['shipping_firstname'],
					'lastname'  => $order_info['shipping_lastname'],
					'company'   => $order_info['shipping_company'],
					'address_1' => $order_info['shipping_address_1'],
					'address_2' => $order_info['shipping_address_2'],
					'city'      => $order_info['shipping_city'],
					'postcode'  => $order_info['shipping_postcode'],
					'zone'      => $order_info['shipping_zone'],
					'zone_code' => $order_info['shipping_zone_code'],
					'country'   => $order_info['shipping_country']
				);

				$shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

				if ($order_info['payment_address_format']) {
					$format = $order_info['payment_address_format'];
				} else {
					$format = '{firstname} {lastname}' . "\n" . '{company}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
				}

				$find = array(
					'{firstname}',
					'{lastname}',
					'{company}',
					'{address_1}',
					'{address_2}',
					'{city}',
					'{postcode}',
					'{zone}',
					'{zone_code}',
					'{country}'
				);

				$replace = array(
					'firstname' => $order_info['payment_firstname'],
					'lastname'  => $order_info['payment_lastname'],
					'company'   => $order_info['payment_company'],
					'address_1' => $order_info['payment_address_1'],
					'address_2' => $order_info['payment_address_2'],
					'city'      => $order_info['payment_city'],
					'postcode'  => $order_info['payment_postcode'],
					'zone'      => $order_info['payment_zone'],
					'zone_code' => $order_info['payment_zone_code'],
					'country'   => $order_info['payment_country']
				);

				$payment_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

				$product_data = array();

				$products = $this->model_sale_order->getOrderProducts($order_id);

				foreach ($products as $product) {
					$option_data = array();

					$options = $this->model_sale_order->getOrderOptions($order_id, $product['order_product_id']);

					foreach ($options as $option) {
						if ($option['type'] != 'file') {
							$option_data[] = array(
								'name'  => $option['name'],
								'value' => $option['value']
							);
						} else {
							$option_data[] = array(
								'name'  => $option['name'],
								'value' => utf8_substr($option['value'], 0, strrpos($option['value'], '.'))
							);
						}
					}

					$product_data[] = array(
						'name'     => $product['name'],
						'model'    => $product['model'],
						'option'   => $option_data,
						'quantity' => $product['quantity'],
						'price'    => $this->currency->format($product['price'], $order_info['currency_code'], $order_info['currency_value']),
						'total'    => $this->currency->format($product['total'], $order_info['currency_code'], $order_info['currency_value'])
					);
				}

				$total_data = $this->model_sale_order->getOrderTotals($order_id);

				$this->data['orders'][] = array(
					'order_id'	    => $order_id,
					'invoice_no'       => $invoice_no,
					'invoice_date'     => date($this->language->get('date_format_short'), strtotime('now')),
					'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
					'store_name'       => $order_info['store_name'],
					'store_url'        => rtrim($order_info['store_url'], '/'),
					'store_address'    => nl2br($store_address),
					'store_email'      => $store_email,
					'store_telephone'  => $store_telephone,
					'store_fax'        => $store_fax,
					'email'            => $order_info['email'],
					'telephone'        => $order_info['telephone'],
					'shipping_address' => $shipping_address,
					'payment_address'  => $payment_address,
					'payment_method'   => $order_info['payment_method'],
					'shipping_method'  => $order_info['shipping_method'],
					'product'          => $product_data,
					'total'            => $total_data,
					'comment'          => nl2br($order_info['comment'])
				);
			}
		}

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'sale/order_invoice.tpl';

		$this->response->setOutput($this->render());
	}
}
