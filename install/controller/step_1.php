<?php
class ControllerStep1 extends Controller {
	private $error = array();
	public function index() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->redirect(HTTP_SERVER . 'index.php?route=step_2');
		}
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
//$this->data['text_license'] = require_once(DIR_SYSTEM . '../install/language/license.php');
//$this->data = array_merge($this->data, $this->load->language('language/license'));
//$this->data['license'] = require_once(DIR_SYSTEM . '../_docs/license.txt');

//$this->data = array_merge($this->data, $this->load->language('install/license'));
//$this->language->load('install/license');

//print_r($this->language);

//		$this->language->load('account/account');
//$this->language->load('license');
//$this->data['text_license'] = $this->language->get('text_license');

//$this->language->load('license');
		$this->data = array_merge($this->data, $this->load->language('license'));
		$this->document->setTitle($this->language->get('text_heading_step_1'));

		$this->data['action'] = HTTP_SERVER . 'index.php?route=step_1';
		$this->children = array(
			'header',
			'footer'
		);
		$this->template = 'step_1.tpl';

		$this->response->setOutput($this->render());
	}
	private function validate() {
		if (!isset($this->request->post['agree'])) {
//			$this->error['warning'] = 'You must agree to the license before you can install the cart!';
			$this->error['warning'] = $this->language->get('error_license');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
			}
}
