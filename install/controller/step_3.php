<?php
class ControllerStep3 extends Controller {
	private $error = array();
	public function index() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->load->model('install');
			$this->model_install->mysql($this->request->post);
			$output  = '<?php' . "\n";
			$output .= '// HTTP' . "\n";
			$output .= 'define(\'HTTP_SERVER\', \'' . HTTP_CART . '\');' . "\n";
			$output .= 'define(\'HTTP_IMAGE\', \'' . HTTP_CART . 'image/\');' . "\n";
			$output .= 'define(\'HTTP_ADMIN\', \'' . HTTP_CART . 'admin/\');' . "\n\n";

			$output .= '// HTTPS' . "\n";
			$output .= 'define(\'HTTPS_SERVER\', \'' . HTTP_CART . '\');' . "\n";
			$output .= 'define(\'HTTPS_IMAGE\', \'' . HTTP_CART . 'image/\');' . "\n\n";

			$output .= '// DIR' . "\n";
			$output .= 'define(\'DIR_APPLICATION\', \'' . DIR_CART . 'catalog/\');' . "\n";
			$output .= 'define(\'DIR_SYSTEM\', \'' . DIR_CART. 'system/\');' . "\n";
			$output .= 'define(\'DIR_DATABASE\', \'' . DIR_CART . 'system/database/\');' . "\n";
			$output .= 'define(\'DIR_LANGUAGE\', \'' . DIR_CART . 'catalog/language/\');' . "\n";
			$output .= 'define(\'DIR_TEMPLATE\', \'' . DIR_CART . 'catalog/view/theme/\');' . "\n";
			$output .= 'define(\'DIR_CONFIG\', \'' . DIR_CART . 'system/config/\');' . "\n";
			$output .= 'define(\'DIR_IMAGE\', \'' . DIR_CART . 'image/\');' . "\n";
			$output .= 'define(\'DIR_CACHE\', \'' . DIR_CART . 'tmp/cache/\');' . "\n";
			$output .= 'define(\'DIR_DOWNLOAD\', \'' . DIR_CART . 'download/\');' . "\n";
			$output .= 'define(\'DIR_LOGS\', \'' . DIR_CART . 'tmp/logs/\');' . "\n\n";

			$output .= 'define(\'URL_JS\', \'js/\');' . "\n";
			$output .= 'define(\'URL_IMAGE\', \'image/\');' . "\n";
			$output .= 'define(\'ICON\', \'image/icons/\');' . "\n";
			$output .= 'define(\'IMAGE\', \'' . DIR_CART. 'image/\');' . "\n";
			$output .= 'define(\'URL_THEME\', \'catalog/view/theme/\');' . "\n";

			$output .= '// DB' . "\n";
			$output .= 'define(\'DB_DRIVER\', \'mysql\');' . "\n";
			$output .= 'define(\'DB_HOSTNAME\', \'' . addslashes($this->request->post['db_host']) . '\');' . "\n";
			$output .= 'define(\'DB_USERNAME\', \'' . addslashes($this->request->post['db_user']) . '\');' . "\n";
			$output .= 'define(\'DB_PASSWORD\', \'' . addslashes($this->request->post['db_password']) . '\');' . "\n";
			$output .= 'define(\'DB_DATABASE\', \'' . addslashes($this->request->post['db_name']) . '\');' . "\n";
			$output .= 'define(\'DB_PREFIX\', \'' . addslashes($this->request->post['db_prefix']) . '\');' . "\n";
			$output .= '?>';

			$file = fopen(DIR_CATALOG . 'config.php', 'w');

			fwrite($file, $output);

			fclose($file);

			$output  = '<?php' . "\n";
			$output .= '// HTTP' . "\n";
			$output .= 'define(\'HTTP_SERVER\', \'' . HTTP_CART . 'admin/\');' . "\n";
			$output .= 'define(\'HTTP_CATALOG\', \'' . HTTP_CART . '\');' . "\n";
			$output .= 'define(\'HTTP_IMAGE\', \'' . HTTP_CART . 'image/\');' . "\n\n";

			$output .= '// HTTPS' . "\n";
			$output .= 'define(\'HTTPS_SERVER\', \'' . HTTP_CART . 'admin/\');' . "\n";
			$output .= 'define(\'HTTPS_IMAGE\', \'' . HTTP_CART . 'image/\');' . "\n\n";

			$output .= '// DIR' . "\n";
			$output .= 'define(\'DIR_APPLICATION\', \'' . DIR_CART . 'admin/\');' . "\n";
			$output .= 'define(\'DIR_SYSTEM\', \'' . DIR_CART . 'system/\');' . "\n";
			$output .= 'define(\'DIR_DATABASE\', \'' . DIR_CART . 'system/database/\');' . "\n";
			$output .= 'define(\'DIR_LANGUAGE\', \'' . DIR_CART . 'admin/language/\');' . "\n";
			$output .= 'define(\'DIR_TEMPLATE\', \'' . DIR_CART . 'admin/view/template/\');' . "\n";
			$output .= 'define(\'DIR_CONFIG\', \'' . DIR_CART . 'system/config/\');' . "\n";
			$output .= 'define(\'DIR_IMAGE\', \'' . DIR_CART . 'image/\');' . "\n";
			$output .= 'define(\'DIR_CACHE\', \'' . DIR_CART . 'tmp/cache/\');' . "\n";
			$output .= 'define(\'DIR_DOWNLOAD\', \'' . DIR_CART . 'download/\');' . "\n";
			$output .= 'define(\'DIR_LOGS\', \'' . DIR_CART . 'tmp/logs/\');' . "\n";
			$output .= 'define(\'DIR_CATALOG\', \'' . DIR_CART . 'catalog/\');' . "\n\n";

			$output .= 'define(\'DIR_IMAGE_CACHE\', \'' . DIR_CART . 'tmp/image/data/\');' . "\n";
			$output .= 'define(\'URL_JS\', \'../js/\');' . "\n";
			$output .= 'define(\'URL_IMAGE\', \'../image/\');' . "\n";
			$output .= 'define(\'ICON\', \'../image/icons/\');' . "\n";
			$output .= 'define(\'URL_THEME\', \'view/\');' . "\n";

			$output .= '// DB' . "\n";
			$output .= 'define(\'DB_DRIVER\', \'mysql\');' . "\n";
			$output .= 'define(\'DB_HOSTNAME\', \'' . addslashes($this->request->post['db_host']) . '\');' . "\n";
			$output .= 'define(\'DB_USERNAME\', \'' . addslashes($this->request->post['db_user']) . '\');' . "\n";
			$output .= 'define(\'DB_PASSWORD\', \'' . addslashes($this->request->post['db_password']) . '\');' . "\n";
			$output .= 'define(\'DB_DATABASE\', \'' . addslashes($this->request->post['db_name']) . '\');' . "\n";
			$output .= 'define(\'DB_PREFIX\', \'' . addslashes($this->request->post['db_prefix']) . '\');' . "\n";
			$output .= '?>';

			$file = fopen(DIR_CART . 'admin/config.php', 'w');
			fwrite($file, $output);
			fclose($file);
			$this->redirect(HTTP_SERVER . 'index.php?route=step_4');
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['error_db_host'])) {
			$this->data['error_db_host'] = $this->error['db_host'];
		} else {
			$this->data['error_db_host'] = '';
		}

		if (isset($this->error['db_user'])) {
			$this->data['error_db_user'] = $this->error['db_user'];
		} else {
			$this->data['error_db_user'] = '';
		}

		if (isset($this->error['db_name'])) {
			$this->data['error_db_name'] = $this->error['db_name'];
		} else {
			$this->data['error_db_name'] = '';
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

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

		$this->data['action'] = HTTP_SERVER . 'index.php?route=step_3';

		if (isset($this->request->post['db_host'])) {
			$this->data['db_host'] = $this->request->post['db_host'];
		} else {
			$this->data['db_host'] = 'localhost';
		}

		if (isset($this->request->post['db_user'])) {
			$this->data['db_user'] = html_entity_decode($this->request->post['db_user']);
		} else {
			$this->data['db_user'] = '';
		}

		if (isset($this->request->post['db_password'])) {
			$this->data['db_password'] = html_entity_decode($this->request->post['db_password']);
		} else {
			$this->data['db_password'] = '';
		}

		if (isset($this->request->post['db_name'])) {
			$this->data['db_name'] = html_entity_decode($this->request->post['db_name']);
		} else {
			$this->data['db_name'] = '';
		}

		if (isset($this->request->post['db_prefix'])) {
			$this->data['db_prefix'] = html_entity_decode($this->request->post['db_prefix']);
		} else {
			$this->data['db_prefix'] = '';
		}

		if (isset($this->request->post['username'])) {
			$this->data['username'] = $this->request->post['username'];
		} else {
			$this->data['username'] = 'admin';
		}

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}

		$this->data = array_merge($this->data, $this->load->language('license'));
		$this->document->setTitle($this->language->get('text_heading_step_3'));

		$this->template = 'step_3.tpl';
		$this->children = array(
			'header',
			'footer'
		);
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->request->post['db_host']) {
//			$this->error['db_host'] = 'Host required!';
			$this->error['warning'] = $this->language->get('error_db_host');
		}

		if (!$this->request->post['db_user']) {
//			$this->error['db_user'] = 'User required!';
			$this->error['warning'] = $this->language->get('error_db_user');
		}

		if (!$this->request->post['db_name']) {
//			$this->error['db_name'] = 'Database Name required!';
			$this->error['warning'] = $this->language->get('error_db_name');
		}

		if (!$this->request->post['username']) {
//			$this->error['username'] = 'Username required!';
			$this->error['warning'] = $this->language->get('error_username');
		}

		if (!$this->request->post['password']) {
//			$this->error['password'] = 'Password required!';
			$this->error['warning'] = $this->language->get('error_password');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
//			$this->error['email'] = 'Invalid E-Mail!';
			$this->error['warning'] = $this->language->get('error_email');
		}

		if (!$connection = @mysql_connect($this->request->post['db_host'], $this->request->post['db_user'], $this->request->post['db_password'])) {
//			$this->error['warning'] = 'Error: Could not connect to the database please make sure the database server, username and password is correct!';
			$this->error['warning'] = $this->language->get('error_db_connection');
		} else {
			if (!@mysql_select_db($this->request->post['db_name'], $connection)) {
//				$this->error['warning'] = 'Error: Database does not exist!';
			$this->error['warning'] = $this->language->get('error_db_exist');
			}
			mysql_close($connection);
		}

		if (!is_writable(DIR_CATALOG . 'config.php')) {
//			$this->error['warning'] = 'Error: Could not write to config.php please check you have set the correct permissions on: ' . DIR_CART . 'config.php!';
//			$this->error['warning'] = $this->language->get('error_write_config');
			$this->error['warning'] = sprintf($this->language->get('error_write_config'), DIR_CATALOG);
		}

		if (!is_writable(DIR_CART . 'admin/config.php')) {
//			$this->error['warning'] = 'Error: Could not write to config.php please check you have set the correct permissions on: ' . DIR_CART . 'admin/config.php!';
//			$this->error['warning'] = $this->language->get('error_write_admin_config');
			$this->error['warning'] = sprintf($this->language->get('error_write_admin_config'), DIR_CART);
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

}
