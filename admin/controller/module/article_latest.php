<?php
class ControllerModuleArticleLatest extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('module/article_latest'));
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['module_name'] = 'article_latest' . '_module';

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('article_latest', $this->request->post);
			$this->cache->delete('product');
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
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
			'href'      => $this->url->link('module/article_latest', 'token=' . $this->session->data['token'], 'SSL'),
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
	$this->url->link('module/article_latest', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['action'] = $this->url->link('module/article_latest', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();

		if (isset($this->request->post['article_latest_module'])) {
			$this->data['modules'] = $this->request->post['article_latest_module'];
		} elseif ($this->config->get('article_latest_module')) {
			$this->data['modules'] = $this->config->get('article_latest_module');
		}

		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->document->addStyle('view/stylesheet/table.css');

		$this->template = 'module/article_latest.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/article_latest')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (isset($this->request->post['article_latest_module'])) {
			foreach ($this->request->post['article_latest_module'] as $key => $value) {
				if (!$value['image_width'] || !$value['image_height']) {
					$this->error['image'][$key] = $this->language->get('error_image');
				}
			}
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}
