<?php
class ControllerStep2 extends Controller {
	private $error = array();
	public function index() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->redirect(HTTP_SERVER . 'index.php?route=step_3');
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		$this->data['action'] = HTTP_SERVER . 'index.php?route=step_2';

		$this->data['config_catalog'] = DIR_CATALOG . 'config.php';
		$this->data['config_admin'] = DIR_CART . 'admin/config.php';
		$this->data['cache'] = DIR_TMP . 'cache';
		$this->data['logs'] = DIR_TMP . 'logs';
		$this->data['image'] = DIR_CART . 'image';
		$this->data['image_cache'] = DIR_CART . 'image/cache';
		$this->data['image_data'] = DIR_CART . 'image/data';
		$this->data['download'] = DIR_CART . 'download';

		$this->template = 'step_2.tpl';

		$this->data = array_merge($this->data, $this->load->language('license'));
		$this->document->setTitle($this->language->get('text_heading_step_2'));

		$this->children = array(
			'header',
			'footer'
		);		$this->response->setOutput($this->render());
	}
	private function validate() {
		if (phpversion() < '5.0') {
//			$this->error['warning'] = 'Warning: You need to use PHP5 or above for Cart to work!';
			$this->error['warning'] = $this->language->get('error_php_version');
		}

		if (!ini_get('file_uploads')) {
//			$this->error['warning'] = 'Warning: file_uploads needs to be enabled!';
			$this->error['warning'] = $this->language->get('error_file_upload');
		}
		if (ini_get('session.auto_start')) {
//			$this->error['warning'] = 'Warning: Cart will not work with session.auto_start enabled!';
			$this->error['warning'] = $this->language->get('error_session_auto');
		}

		if (!extension_loaded('mysql')) {
//			$this->error['warning'] = 'Warning: MySQL extension needs to be loaded for Cart to work!';
			$this->error['warning'] = $this->language->get('error_mysql');
		}

		if (!extension_loaded('gd')) {
//			$this->error['warning'] = 'Warning: GD extension needs to be loaded for Cart to work!';
			$this->error['warning'] = $this->language->get('error_gd');
		}

		if (!extension_loaded('zlib')) {
//			$this->error['warning'] = 'Warning: ZLIB extension needs to be loaded for Cart to work!';
			$this->error['warning'] = $this->language->get('error_zlib');
		}
		if (!is_writable(DIR_CATALOG . 'config.php')) {
//			$this->error['warning'] = 'Warning: config.php needs to be writable for Cart to be installed!';
			$this->error['warning'] = $this->language->get('error_catalog_config');
		}
			if (!is_writable(DIR_CART . 'admin/config.php')) {
//			$this->error['warning'] = 'Warning: admin/config.php needs to be writable for Cart to be installed!';
			$this->error['warning'] = $this->language->get('error_admin_config');
		}

		if (!is_writable(DIR_TMP . 'cache')) {
//			$this->error['warning'] = 'Warning: Cache directory needs to be writable for Cart to work!';
			$this->error['warning'] = $this->language->get('error_cache');
		}
		if (!is_writable(DIR_TMP . 'logs')) {
//			$this->error['warning'] = 'Warning: Logs directory needs to be writable for Cart to work!';
			$this->error['warning'] = $this->language->get('error_logs');
		}
		if (!is_writable(DIR_CART . 'image')) {
//			$this->error['warning'] = 'Warning: Image directory needs to be writable for Cart to work!';
			$this->error['warning'] = $this->language->get('error_image');
		}

		if (!is_writable(DIR_CART . 'image/cache')) {
//			$this->error['warning'] = 'Warning: Image cache directory needs to be writable for Cart to work!';
			$this->error['warning'] = $this->language->get('error_image_cache');
		}
		if (!is_writable(DIR_CART . 'image/data')) {
//			$this->error['warning'] = 'Warning: Image data directory needs to be writable for Cart to work!';
			$this->error['warning'] = $this->language->get('error_image_data');
		}
		if (!is_writable(DIR_CART . 'download')) {
//			$this->error['warning'] = 'Warning: Download directory needs to be writable for Cart to work!';
			$this->error['warning'] = $this->language->get('error_file_download');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
