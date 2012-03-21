<?php
class ControllerPaymentPPPro extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('payment/pp_pro'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('pp_pro', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['username'])) {
			$this->data['error_username'] = $this->error['username'];
		} else {
			$this->data['error_username'] = '';
		}

		if (isset($this->error['password'])) {
			$this->data['error_password'] = $this->error['password'];
		} else {
			$this->data['error_password'] = '';
		}

		if (isset($this->error['signature'])) {
			$this->data['error_signature'] = $this->error['signature'];
		} else {
			$this->data['error_signature'] = '';
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
			'href'      => $this->url->link('payment/pp_pro', 'token=' . $this->session->data['token'], 'SSL'),
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
	$this->url->link('payment/pp_pro', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['action'] = $this->url->link('payment/pp_pro', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['pp_pro_username'])) {
			$this->data['pp_pro_username'] = $this->request->post['pp_pro_username'];
		} else {
			$this->data['pp_pro_username'] = $this->config->get('pp_pro_username');
		}

		if (isset($this->request->post['pp_pro_password'])) {
			$this->data['pp_pro_password'] = $this->request->post['pp_pro_password'];
		} else {
			$this->data['pp_pro_password'] = $this->config->get('pp_pro_password');
		}

		if (isset($this->request->post['pp_pro_signature'])) {
			$this->data['pp_pro_signature'] = $this->request->post['pp_pro_signature'];
		} else {
			$this->data['pp_pro_signature'] = $this->config->get('pp_pro_signature');
		}

		if (isset($this->request->post['pp_pro_test'])) {
			$this->data['pp_pro_test'] = $this->request->post['pp_pro_test'];
		} else {
			$this->data['pp_pro_test'] = $this->config->get('pp_pro_test');
		}

		if (isset($this->request->post['pp_pro_method'])) {
			$this->data['pp_pro_transaction'] = $this->request->post['pp_pro_transaction'];
		} else {
			$this->data['pp_pro_transaction'] = $this->config->get('pp_pro_transaction');
		}

		if (isset($this->request->post['pp_pro_total'])) {
			$this->data['pp_pro_total'] = $this->request->post['pp_pro_total'];
		} else {
			$this->data['pp_pro_total'] = $this->config->get('pp_pro_total');
		}

		if (isset($this->request->post['pp_pro_order_status_id'])) {
			$this->data['pp_pro_order_status_id'] = $this->request->post['pp_pro_order_status_id'];
		} else {
			$this->data['pp_pro_order_status_id'] = $this->config->get('pp_pro_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['pp_pro_geo_zone_id'])) {
			$this->data['pp_pro_geo_zone_id'] = $this->request->post['pp_pro_geo_zone_id'];
		} else {
			$this->data['pp_pro_geo_zone_id'] = $this->config->get('pp_pro_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['pp_pro_status'])) {
			$this->data['pp_pro_status'] = $this->request->post['pp_pro_status'];
		} else {
			$this->data['pp_pro_status'] = $this->config->get('pp_pro_status');
		}

		if (isset($this->request->post['pp_pro_sort_order'])) {
			$this->data['pp_pro_sort_order'] = $this->request->post['pp_pro_sort_order'];
		} else {
			$this->data['pp_pro_sort_order'] = $this->config->get('pp_pro_sort_order');
		}

		$this->document->addStyle('view/stylesheet/table.css');

		$this->template = 'payment/pp_pro.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/pp_pro')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['pp_pro_username']) {
			$this->error['username'] = $this->language->get('error_username');
		}

		if (!$this->request->post['pp_pro_password']) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if (!$this->request->post['pp_pro_signature']) {
			$this->error['signature'] = $this->language->get('error_signature');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
