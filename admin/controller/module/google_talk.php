<?php
class ControllerModuleGoogleTalk extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('module/google_talk'));
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['module_name'] = 'google_talk' . '_module';

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('google_talk', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['code'])) {
			$this->data['error_code'] = $this->error['code'];
		} else {
			$this->data['error_code'] = '';
		}

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/google_talk', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_module'),
	$this->language->get('text_separator')
);
$this->document->addBreadcrumbs(
	$this->url->link('module/heading_title', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['action'] = $this->url->link('module/google_talk', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['google_talk_code'])) {
			$this->data['google_talk_code'] = $this->request->post['google_talk_code'];
		} else {
			$this->data['google_talk_code'] = $this->config->get('google_talk_code');
		}

		$this->data['modules'] = array();

		if (isset($this->request->post['google_talk_module'])) {
			$this->data['modules'] = $this->request->post['google_talk_module'];
		} elseif ($this->config->get('google_talk_module')) {
			$this->data['modules'] = $this->config->get('google_talk_module');
		}

		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->document->addStyle('view/stylesheet/table.css');

		$this->template = 'module/google_talk.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/google_talk')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->request->post['google_talk_code']) {
			$this->error['code'] = $this->language->get('error_code');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}
