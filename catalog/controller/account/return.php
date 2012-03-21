<?php
class ControllerAccountReturn extends Controller {
	private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/return', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/return'));
		$this->document->setTitle($this->language->get('heading_title'));
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

		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
/*
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/return', $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('account/return', $url, 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->data['action'] = $this->url->link('account/history', '', 'SSL');

		$this->load->model('account/return');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$this->data['returns'] = array();

		$return_total = $this->model_account_return->getTotalReturns();

		$results = $this->model_account_return->getReturns(($page - 1) * $this->config->get('config_catalog_limit'), $this->config->get('config_catalog_limit'));

		foreach ($results as $result) {
			$product_total = $this->model_account_return->getTotalReturnProductsByReturnId($result['return_id']);

			$this->data['returns'][] = array(
				'return_id'  => $result['return_id'],
				'order_id'   => $result['order_id'],
				'name'       => $result['firstname'] . ' ' . $result['lastname'],
				'status'     => $result['status'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'products'   => $product_total,
				'href'       => $this->url->link('account/return/info', 'return_id=' . $result['return_id'] . $url, 'SSL')
			);
		}
/*
		$pagination = new Pagination();
		$pagination->total = $return_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_catalog_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('account/history', 'page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();
*/
		$this->data['continue'] = $this->url->link('account/account', '', 'SSL');

		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_style.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_page.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/jquery/smoothness/jquery-ui-1.8.4.custom.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_jui.css');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/return_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/return_list.tpl';
		} else {
			$this->template = 'default/template/account/return_list.tpl';
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

	public function info() {
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/return'));

		if (isset($this->request->get['return_id'])) {
			$return_id = $this->request->get['return_id'];
		} else {
			$return_id = 0;
		}

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/return/info', 'return_id=' . $return_id, 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->model('account/return');

		$return_info = $this->model_account_return->getReturn($return_id);

		if ($return_info) {
			$this->document->setTitle($this->language->get('text_return'));
/*
			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', '', 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_account'),
				'href'      => $this->url->link('account/account', '', 'SSL'),
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

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('account/return', $url, 'SSL'),
				'separator' => $this->language->get('text_separator')
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_return'),
				'href'      => $this->url->link('account/return/info', 'return_id=' . $this->request->get['return_id'] . $url, 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('account/return', $url, 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->document->addBreadcrumbs(
			$this->url->link('account/return/info', 'return_id=' . $this->request->get['return_id'] . $url, 'SSL'),
			$this->language->get('text_return_information'),
			$this->language->get('text_separator')
		);

			$this->data['return_id'] = $return_info['return_id'];
			$this->data['order_id'] = $return_info['order_id'];
			$this->data['date_ordered'] = date($this->language->get('date_format_short'), strtotime($return_info['date_ordered']));
			$this->data['firstname'] = $return_info['firstname'];
			$this->data['lastname'] = $return_info['lastname'];
			$this->data['email'] = $return_info['email'];
			$this->data['telephone'] = $return_info['telephone'];
			$this->data['comment'] = $return_info['comment'];
			$this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($return_info['date_added']));

			$this->data['products'] = array();

			$results = $this->model_account_return->getReturnProducts($this->request->get['return_id']);

			foreach ($results as $result) {
				$this->data['products'][] = array(
					'name'     => $result['name'],
					'model'    => $result['model'],
					'quantity' => $result['quantity'],
					'reason'   => $result['reason'],
					'opened'   => $result['opened'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
					'comment'  => nl2br($result['comment']),
					'action'   => $result['action']
				);
			}

			$this->data['histories'] = array();

			$results = $this->model_account_return->getReturnHistories($this->request->get['return_id']);

			foreach ($results as $result) {
				$this->data['histories'][] = array(
					'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
					'status'     => $result['status'],
					'comment'    => nl2br($result['comment'])
				);
			}

			$this->data['continue'] = $this->url->link('account/return', $url, 'SSL');

			$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/table.css');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/return_info.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/account/return_info.tpl';
			} else {
				$this->template = 'default/template/account/return_info.tpl';
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
		} else {
			$this->document->setTitle($this->language->get('text_return'));
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
				'href'      => $this->url->link('account/return', '', 'SSL'),
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
			$this->url->link('account/return', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_return'),
				'href'      => $this->url->link('account/return/info', 'return_id=' . $return_id . $url, 'SSL'),
				'separator' => $this->language->get('text_separator')
			);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('account/return/info', 'return_id=' . $return_id . $url, 'SSL'),
			$this->language->get('text_return'),
			$this->language->get('text_separator')
		);

			$this->data['continue'] = $this->url->link('account/return', '', 'SSL');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
	}

	public function insert() {
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/return'));

		$this->load->model('account/return');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_account_return->addReturn($this->request->post);

			$this->redirect($this->url->link('account/return/success', '', 'SSL'));
		}

		$this->document->setTitle($this->language->get('heading_title'));
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
			'href'      => $this->url->link('account/return/insert', '', 'SSL'),
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
			$this->url->link('account/return/insert', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['order_id'])) {
			$this->data['error_order_id'] = $this->error['order_id'];
		} else {
			$this->data['error_order_id'] = '';
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

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}

		if (isset($this->error['model'])) {
			$this->data['error_model'] = $this->error['model'];
		} else {
			$this->data['error_model'] = '';
		}

		if (isset($this->error['reason'])) {
			$this->data['error_reason'] = $this->error['reason'];
		} else {
			$this->data['error_reason'] = '';
		}

		if (isset($this->error['captcha'])) {
			$this->data['error_captcha'] = $this->error['captcha'];
		} else {
			$this->data['error_captcha'] = '';
		}

		$this->data['action'] = $this->url->link('account/return/insert', '', 'SSL');

		if (isset($this->request->post['order_id'])) {
			$this->data['order_id'] = $this->request->post['order_id'];
		} elseif (isset($this->session->data['return']['order_id'])) {
			$this->data['order_id'] = $this->session->data['return']['order_id'];
		} else {
			$this->data['order_id'] = '';
		}

		if (isset($this->request->post['date_ordered'])) {
			$this->data['date_ordered'] = $this->request->post['date_ordered'];
		} elseif (isset($this->session->data['return'])) {
			$this->data['date_ordered'] = date('Y-m-d', strtotime($this->session->data['return']['date_added']));
		} else {
			$this->data['date_ordered'] = '';
		}

		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		} else {
			$this->data['firstname'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		} else {
			$this->data['lastname'] = $this->customer->getLastName();
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['telephone'])) {
			$this->data['telephone'] = $this->request->post['telephone'];
		} else {
			$this->data['telephone'] = $this->customer->getTelephone();
		}

		$this->load->model('localisation/return_reason');

		$this->data['return_reasons'] = $this->model_localisation_return_reason->getReturnReasons();

		if (isset($this->request->post['return_product'])) {
			$this->data['return_products'] = $this->request->post['return_product'];
		} elseif (isset($this->session->data['return'])) {
			$this->data['return_products'] = array();

			foreach ($this->session->data['return']['product'] as $result) {
				$this->data['return_products'][] = array(
					'name'     => $result['name'],
					'model'    => $result['model'],
					'quantity' => 1,
					'opened'   => false,
					'comment'  => ''
				);
			}
		} else {
			$this->data['return_products'] = array();
		}

		if (isset($this->session->data['return'])) {
			unset($this->session->data['return']);
		}

		if (isset($this->request->post['comment'])) {
			$this->data['comment'] = $this->request->post['comment'];
		} else {
			$this->data['comment'] = '';
		}
/*
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}
*/
		$this->data['continue'] = $this->url->link('account/order', '', 'SSL');
//		$this->data['continue'] = $this->url->link('account/order/info&order_id=', '', 'SSL');

		$this->document->addScript(URL_JS . 'mylibs/return_form.js');
		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');
//		$this->document->addScript(URL_JS . 'jquery/ui/ui.datepicker.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/default.uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/return_form.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/return_form.tpl';
		} else {
			$this->template = 'default/template/account/return_form.tpl';
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

	public function success() {
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/return'));

		$this->document->setTitle($this->language->get('heading_title'));
/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/return', '', 'SSL'),
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
			$this->url->link('account/return', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->data['continue'] = $this->url->link('common/home');

//		$this->document->addScript(URL_JS . 'mylibs/author.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
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
		if (!$this->request->post['order_id']) {
			$this->error['order_id'] = $this->language->get('error_order_id');
		}
		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}
		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}
		if (!isset($this->request->post['return_product'])) {
			$this->error['warning'] = $this->language->get('error_product');
		} else {
			foreach ($this->request->post['return_product'] as $key => $value) {
				if (!isset($value['return_reason_id'])) {
					$this->error['reason'][$key] = $this->language->get('error_reason');
				}
				if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
					$this->error['name'][$key] = $this->language->get('error_name');
				}
				if ((utf8_strlen($value['model']) < 1) || (utf8_strlen($value['model']) > 64)) {
					$this->error['model'][$key] = $this->language->get('error_model');
				}
			}
		}
/*
		if (!isset($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
			$this->error['captcha'] = $this->language->get('error_captcha');
		}
*/
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function captcha() {
		$this->load->library('captcha');
		$captcha = new Captcha();
		$this->session->data['captcha'] = $captcha->getCode();
		$captcha->showImage();
	}
}
