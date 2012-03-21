<?php
class ControllerAffiliatePayment extends Controller {
	private $error = array();

	public function index() {
		if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/payment', '', 'SSL');

			$this->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('affiliate/payment'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('affiliate/affiliate');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->model_affiliate_affiliate->editPayment($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('affiliate/account', '', 'SSL'));
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
			'href'      => $this->url->link('affiliate/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('affiliate/payment', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/

		$this->document->addBreadcrumbs(
			$this->url->link('common/home'),
			$this->language->get('text_home'),
			false
		);

		$this->document->addBreadcrumbs(
			$this->url->link('affiliate/account', '', 'SSL'),
			$this->language->get('text_account'),
			$this->language->get('text_separator')
		);

		$this->document->addBreadcrumbs(
			$this->url->link('affiliate/payment', '', 'SSL'),
			$this->language->get('text_payment'),
			$this->language->get('text_separator')
		);

		$this->data['action'] = $this->url->link('affiliate/payment', '', 'SSL');

		if ($this->request->server['REQUEST_METHOD'] != 'POST') {
			$affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->affiliate->getId());
		}

		if (isset($this->request->post['tax'])) {
			$this->data['tax'] = $this->request->post['tax'];
		} elseif (!empty($affiliate_info)) {
			$this->data['tax'] = $affiliate_info['tax'];
		} else {
			$this->data['tax'] = '';
		}

		if (isset($this->request->post['payment'])) {
			$this->data['payment'] = $this->request->post['payment'];
		} elseif (!empty($affiliate_info)) {
			$this->data['payment'] = $affiliate_info['payment'];
		} else {
			$this->data['payment'] = 'cheque';
		}

		if (isset($this->request->post['cheque'])) {
			$this->data['cheque'] = $this->request->post['cheque'];
		} elseif (!empty($affiliate_info)) {
			$this->data['cheque'] = $affiliate_info['cheque'];
		} else {
			$this->data['cheque'] = '';
		}

		if (isset($this->request->post['paypal'])) {
			$this->data['paypal'] = $this->request->post['paypal'];
		} elseif (!empty($affiliate_info)) {
			$this->data['paypal'] = $affiliate_info['paypal'];
		} else {
			$this->data['paypal'] = '';
		}

		if (isset($this->request->post['bank_name'])) {
			$this->data['bank_name'] = $this->request->post['bank_name'];
		} elseif (!empty($affiliate_info)) {
			$this->data['bank_name'] = $affiliate_info['bank_name'];
		} else {
			$this->data['bank_name'] = '';
		}

		if (isset($this->request->post['bank_branch_number'])) {
			$this->data['bank_branch_number'] = $this->request->post['bank_branch_number'];
		} elseif (!empty($affiliate_info)) {
			$this->data['bank_branch_number'] = $affiliate_info['bank_branch_number'];
		} else {
			$this->data['bank_branch_number'] = '';
		}

		if (isset($this->request->post['bank_swift_code'])) {
			$this->data['bank_swift_code'] = $this->request->post['bank_swift_code'];
		} elseif (!empty($affiliate_info)) {
			$this->data['bank_swift_code'] = $affiliate_info['bank_swift_code'];
		} else {
			$this->data['bank_swift_code'] = '';
		}

		if (isset($this->request->post['bank_account_name'])) {
			$this->data['bank_account_name'] = $this->request->post['bank_account_name'];
		} elseif (!empty($affiliate_info)) {
			$this->data['bank_account_name'] = $affiliate_info['bank_account_name'];
		} else {
			$this->data['bank_account_name'] = '';
		}

		if (isset($this->request->post['bank_account_number'])) {
			$this->data['bank_account_number'] = $this->request->post['bank_account_number'];
		} elseif (!empty($affiliate_info)) {
			$this->data['bank_account_number'] = $affiliate_info['bank_account_number'];
		} else {
			$this->data['bank_account_number'] = '';
		}

		$this->data['back'] = $this->url->link('affiliate/account', '', 'SSL');

		$this->document->addScript(URL_JS . 'libs/uniform/uni-form-validation.jquery.js');
		$this->document->addScript(URL_JS . 'mylibs/uniform.js');
		$this->document->addScript(URL_JS . 'libs/uniform/localization/' . $this->language->get('code') . '.js');
		$this->document->addScript(URL_JS . 'mylibs/register.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uni-form.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/uniform/uniform_style.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/payment.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/affiliate/payment.tpl';
		} else {
			$this->template = 'default/template/affiliate/payment.tpl';
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
