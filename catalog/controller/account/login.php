<?php
class ControllerAccountLogin extends Controller {
	private $error = array();

	public function index() {
		// Login override for admin users
		if (!empty($this->request->get['token'])) {
			$this->customer->logout();
			$this->load->model('account/customer');
			$customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);
			if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
				$this->redirect($this->url->link('account/account', '', 'SSL'));
			}
		} if ($this->customer->isLogged()) {
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/login'));
		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			unset($this->session->data['guest']);
/*
			$this->load->model('account/address');

			$address_info = $this->model_account_address->getAddress($this->customer->getAddressId());

			if ($address_info) {
				$this->tax->setZone($address_info['country_id'], $address_info['zone_id']);
			}
*/
			// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], HTTP_SERVER) !== false || strpos($this->request->post['redirect'], HTTPS_SERVER) !== false)) {
				$this->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
			} else {
				$this->redirect($this->url->link('account/account', '', 'SSL'));
			}
		}
/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_login'),
			'href'      => $this->url->link('account/login', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('common/home'),
			$this->language->get('text_home'),
			false
		);

		$this->document->addBreadcrumbs(
			$this->url->link('account/account', '', 'SSL'),
			$this->language->get('text_account'),
			$this->language->get('text_separator')
		);

		$this->document->addBreadcrumbs(
			$this->url->link('account/login', '', 'SSL'),
			$this->language->get('text_login'),
			$this->language->get('text_separator')
		);

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		$this->data['register'] = $this->url->link('account/register', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

		// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], HTTP_SERVER) !== false || strpos($this->request->post['redirect'], HTTPS_SERVER) !== false)) {
			$this->data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
			$this->data['redirect'] = $this->session->data['redirect'];

			unset($this->session->data['redirect']);
		} else {
			$this->data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/default.uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/login.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/login.tpl';
		} else {
			$this->template = 'default/template/account/login.tpl';
		}

			$this->children = array(
			'common/content_center',
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_footer',
			'common/footer',
			'common/header'
			);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
			$this->error['warning'] = $this->language->get('error_login');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
