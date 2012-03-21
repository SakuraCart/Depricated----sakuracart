<?php
class ControllerAccountAddress extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/address', '', 'SSL');
			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/address'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/address');
		$this->getList();
	}

	public function insert() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/address', '', 'SSL');
			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/address'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/address');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_account_address->addAddress($this->request->post);
			$this->session->data['success'] = $this->language->get('text_insert');
			$this->redirect($this->url->link('account/address', '', 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/address', '', 'SSL');
			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/address'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/address');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
					$this->model_account_address->editAddress($this->request->get['address_id'], $this->request->post);

			if (isset($this->session->data['shipping_address_id']) && ($this->request->get['address_id'] == $this->session->data['shipping_address_id'])) {
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['shipping_method']);
/*
				if ($this->cart->hasShipping()) {
				$this->tax->setZone($this->request->post['country_id'], $this->request->post['zone_id']);
				}
*/
			}

			if (isset($this->session->data['payment_address_id']) && ($this->request->get['address_id'] == $this->session->data['payment_address_id'])) {
				unset($this->session->data['payment_methods']);
				unset($this->session->data['payment_method']);
/*
				if (!$this->cart->hasShipping()) {
					$this->tax->setZone($this->request->post['country_id'], $this->request->post['zone_id']);
				}
*/
			}

			$this->session->data['success'] = $this->language->get('text_update');

			$this->redirect($this->url->link('account/address', '', 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/address', '', 'SSL');
			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/address'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/address');

		if (isset($this->request->get['address_id']) && $this->validateDelete()) {
			$this->model_account_address->deleteAddress($this->request->get['address_id']);

			if (isset($this->session->data['shipping_address_id']) && ($this->request->get['address_id'] == $this->session->data['shipping_address_id'])) {
				unset($this->session->data['shipping_address_id']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['shipping_method']);
/*
				if ($this->cart->hasShipping()) {
					$this->tax->setZone($this->config->get('config_country_id'), $this->config->get('config_zone_id'));
				}
*/
			}

			if (isset($this->session->data['payment_address_id']) && ($this->request->get['address_id'] == $this->session->data['payment_address_id'])) {
				unset($this->session->data['payment_address_id']);
				unset($this->session->data['payment_methods']);
				unset($this->session->data['payment_method']);
/*
				if (!$this->cart->hasShipping()) {
					$this->tax->setZone($this->config->get('config_country_id'), $this->config->get('config_zone_id'));
				}
*/
			}

			$this->session->data['success'] = $this->language->get('text_delete');

			$this->redirect($this->url->link('account/address', '', 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
/*
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
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/address', '', 'SSL'),
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
			$this->url->link('account/address', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

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

		$this->data['addresses'] = array();

		$results = $this->model_account_address->getAddresses();

		foreach ($results as $result) {
			if ($result['address_format']) {
				$format = $result['address_format'];
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
				'firstname' => $result['firstname'],
				'lastname'  => $result['lastname'],
				'company'   => $result['company'],
				'address_1' => $result['address_1'],
				'address_2' => $result['address_2'],
				'city'      => $result['city'],
				'postcode'  => $result['postcode'],
				'zone'      => $result['zone'],
				'zone_code' => $result['zone_code'],
				'country'   => $result['country']
			);

			$this->data['addresses'][] = array(
				'address_id' => $result['address_id'],
				'address'    => str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format)))),
				'update'     => $this->url->link('account/address/update', 'address_id=' . $result['address_id'], 'SSL'),
				'delete'     => $this->url->link('account/address/delete', 'address_id=' . $result['address_id'], 'SSL')
			);
		}

		$this->data['insert'] = $this->url->link('account/address/insert', '', 'SSL');
		$this->data['continue'] = $this->url->link('account/account', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/address_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/address_list.tpl';
		} else {
			$this->template = 'default/template/account/address_list.tpl';
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

	private function getForm() {
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
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/address', '', 'SSL'),
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
			$this->url->link('account/address', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		if (!isset($this->request->get['address_id'])) {
/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_edit_address'),
				'href'      => $this->url->link('account/address/insert', '', 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
		} else {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_edit_address'),
				'href'      => $this->url->link('account/address/update', 'address_id=' . $this->request->get['address_id'], 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
		}
*/

		$this->document->addBreadcrumbs(
			$this->url->link('account/address/insert', '', 'SSL'),
			$this->language->get('text_edit_address'),
			$this->language->get('text_separator')
		);
		} else {
		$this->document->addBreadcrumbs(
			$this->url->link('account/address/update', 'address_id=' . $this->request->get['address_id'], 'SSL'),
			$this->language->get('text_edit_address'),
			$this->language->get('text_separator')
		);
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

		if (isset($this->error['address_1'])) {
			$this->data['error_address_1'] = $this->error['address_1'];
		} else {
			$this->data['error_address_1'] = '';
		}

		if (isset($this->error['city'])) {
			$this->data['error_city'] = $this->error['city'];
		} else {
			$this->data['error_city'] = '';
		}

		if (isset($this->error['postcode'])) {
			$this->data['error_postcode'] = $this->error['postcode'];
		} else {
			$this->data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$this->data['error_country'] = $this->error['country'];
		} else {
			$this->data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$this->data['error_zone'] = $this->error['zone'];
		} else {
			$this->data['error_zone'] = '';
		}

		if (!isset($this->request->get['address_id'])) {
			$this->data['action'] = $this->url->link('account/address/insert', '', 'SSL');
		} else {
			$this->data['action'] = $this->url->link('account/address/update', 'address_id=' . $this->request->get['address_id'], 'SSL');
		}

		if (isset($this->request->get['address_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$address_info = $this->model_account_address->getAddress($this->request->get['address_id']);
		}

		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		} elseif (isset($address_info)) {
			$this->data['firstname'] = $address_info['firstname'];
		} else {
			$this->data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		} elseif (isset($address_info)) {
			$this->data['lastname'] = $address_info['lastname'];
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->request->post['company'])) {
			$this->data['company'] = $this->request->post['company'];
		} elseif (isset($address_info)) {
			$this->data['company'] = $address_info['company'];
		} else {
			$this->data['company'] = '';
		}

		if (isset($this->request->post['address_1'])) {
			$this->data['address_1'] = $this->request->post['address_1'];
		} elseif (isset($address_info)) {
			$this->data['address_1'] = $address_info['address_1'];
		} else {
			$this->data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$this->data['address_2'] = $this->request->post['address_2'];
		} elseif (isset($address_info)) {
			$this->data['address_2'] = $address_info['address_2'];
		} else {
			$this->data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$this->data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($address_info)) {
			$this->data['postcode'] = $address_info['postcode'];
		} else {
			$this->data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$this->data['city'] = $this->request->post['city'];
		} elseif (isset($address_info)) {
			$this->data['city'] = $address_info['city'];
		} else {
			$this->data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$this->data['country_id'] = $this->request->post['country_id'];
		}  elseif (isset($address_info)) {
			$this->data['country_id'] = $address_info['country_id'];
		} else {
			$this->data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$this->data['zone_id'] = $this->request->post['zone_id'];
		}  elseif (isset($address_info)) {
			$this->data['zone_id'] = $address_info['zone_id'];
		} else {
			$this->data['zone_id'] = '';
		}

		$this->load->model('localisation/country');

		$this->data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['default'])) {
			$this->data['default'] = $this->request->post['default'];
		} elseif (isset($this->request->get['address_id'])) {
			$this->data['default'] = $this->customer->getAddressId() == $this->request->get['address_id'];
		} else {
			$this->data['default'] = false;
		}

		$this->data['continue'] = $this->url->link('account/address', '', 'SSL');
		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');
		$this->document->addScript(URL_JS . 'mylibs/register.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/default.uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/address_form.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/address_form.tpl';
		} else {
			$this->template = 'default/template/account/address_form.tpl';
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
	private function validateForm() {
		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 128)) {
			$this->error['city'] = $this->language->get('error_city');
		}
		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
		if ($country_info && $country_info['postcode_required'] && (utf8_strlen($this->request->post['postcode']) < 2) || (utf8_strlen($this->request->post['postcode']) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		}

		if ($this->request->post['zone_id'] == '') {
			$this->error['zone'] = $this->language->get('error_zone');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if ($this->model_account_address->getTotalAddresses() == 1) {
			$this->error['warning'] = $this->language->get('error_delete');
		}

		if ($this->customer->getAddressId() == $this->request->get['address_id']) {
			$this->error['warning'] = $this->language->get('error_default');
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
}
