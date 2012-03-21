<?php
class ControllerPaymentMoneyBookers extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('payment/moneybookers'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('moneybookers', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

/*
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
      		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/moneybookers', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_payment'),
	$this->language->get('text_separator')
);
$this->document->addBreadcrumbs(
	$this->url->link('payment/moneybookers', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['action'] = $this->url->link('payment/moneybookers', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['moneybookers_email'])) {
			$this->data['moneybookers_email'] = $this->request->post['moneybookers_email'];
		} else {
			$this->data['moneybookers_email'] = $this->config->get('moneybookers_email');
		}

		if (isset($this->request->post['moneybookers_secret'])) {
			$this->data['moneybookers_secret'] = $this->request->post['moneybookers_secret'];
		} else {
			$this->data['moneybookers_secret'] = $this->config->get('moneybookers_secret');
		}

		if (isset($this->request->post['moneybookers_total'])) {
			$this->data['moneybookers_total'] = $this->request->post['moneybookers_total'];
		} else {
			$this->data['moneybookers_total'] = $this->config->get('moneybookers_total');
		}

		if (isset($this->request->post['moneybookers_order_status_id'])) {
			$this->data['moneybookers_order_status_id'] = $this->request->post['moneybookers_order_status_id'];
		} else {
			$this->data['moneybookers_order_status_id'] = $this->config->get('moneybookers_order_status_id');
		}

		if (isset($this->request->post['moneybookers_pending_status_id'])) {
			$this->data['moneybookers_pending_status_id'] = $this->request->post['moneybookers_pending_status_id'];
		} else {
			$this->data['moneybookers_pending_status_id'] = $this->config->get('moneybookers_pending_status_id');
		}

		if (isset($this->request->post['moneybookers_canceled_status_id'])) {
			$this->data['moneybookers_canceled_status_id'] = $this->request->post['moneybookers_canceled_status_id'];
		} else {
			$this->data['moneybookers_canceled_status_id'] = $this->config->get('moneybookers_canceled_status_id');
		}

		if (isset($this->request->post['moneybookers_failed_status_id'])) {
			$this->data['moneybookers_failed_status_id'] = $this->request->post['moneybookers_failed_status_id'];
		} else {
			$this->data['moneybookers_failed_status_id'] = $this->config->get('moneybookers_failed_status_id');
		}

		if (isset($this->request->post['moneybookers_chargeback_status_id'])) {
			$this->data['moneybookers_chargeback_status_id'] = $this->request->post['moneybookers_chargeback_status_id'];
		} else {
			$this->data['moneybookers_chargeback_status_id'] = $this->config->get('moneybookers_chargeback_status_id');
		}

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['moneybookers_geo_zone_id'])) {
			$this->data['moneybookers_geo_zone_id'] = $this->request->post['moneybookers_geo_zone_id'];
		} else {
			$this->data['moneybookers_geo_zone_id'] = $this->config->get('moneybookers_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['moneybookers_status'])) {
			$this->data['moneybookers_status'] = $this->request->post['moneybookers_status'];
		} else {
			$this->data['moneybookers_status'] = $this->config->get('moneybookers_status');
		}

		if (isset($this->request->post['moneybookers_sort_order'])) {
			$this->data['moneybookers_sort_order'] = $this->request->post['moneybookers_sort_order'];
		} else {
			$this->data['moneybookers_sort_order'] = $this->config->get('moneybookers_sort_order');
		}

		if (isset($this->request->post['moneybookers_rid'])) {
			$this->data['moneybookers_rid'] = $this->request->post['moneybookers_rid'];
		} else {
			$this->data['moneybookers_rid'] = $this->config->get('moneybookers_rid');
		}

		if (isset($this->request->post['moneybookers_custnote'])) {
			$this->data['moneybookers_custnote'] = $this->request->post['moneybookers_custnote'];
		} else {
			$this->data['moneybookers_custnote'] = $this->config->get('moneybookers_custnote');
		}

		$this->document->addStyle('view/stylesheet/table.css');

		$this->template = 'payment/moneybookers.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/moneybookers')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['moneybookers_email']) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
