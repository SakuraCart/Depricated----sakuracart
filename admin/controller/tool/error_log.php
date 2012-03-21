<?php
class ControllerToolErrorLog extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('tool/error_log'));
		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
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
			'href'      => $this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['clear'] = $this->url->link('tool/error_log/clear', 'token=' . $this->session->data['token'], 'SSL');

		$file = DIR_LOGS . $this->config->get('config_error_filename');
//print_r($file);

		if (file_exists($file)) {
			$this->data['log'] = file_get_contents($file, FILE_USE_INCLUDE_PATH, null);
		} else {
			$this->data['log'] = '';
		}

		$this->document->addStyle('view/stylesheet/table.css');

//		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
//		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
//		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'tool/error_log.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	public function clear() {
		$this->data = array_merge($this->data, $this->load->language('tool/error_log'));

		$file = DIR_LOGS . $this->config->get('config_error_filename');
		$handle = fopen($file, 'w+');
		fclose($handle);

		$this->session->data['success'] = $this->language->get('text_success');
		$this->redirect($this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL'));
	}
}
