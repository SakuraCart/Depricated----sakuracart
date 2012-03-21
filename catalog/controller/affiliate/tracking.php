<?php
class ControllerAffiliateTracking extends Controller {
	public function index() {
		if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/tracking', '', 'SSL');

			$this->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('affiliate/tracking'));
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
			'href'      => $this->url->link('affiliate/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('affiliate/tracking', '', 'SSL'),
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
			$this->url->link('affiliate/tracking', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->data['text_description'] = sprintf($this->language->get('text_description'), $this->config->get('config_name'));

		$this->data['code'] = $this->affiliate->getCode();

		$this->data['continue'] = $this->url->link('affiliate/account', '', 'SSL');
		$this->data['back'] = $this->url->link('affiliate/account', '', 'SSL');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/table.css');

		$this->document->addScript(URL_JS . 'mylibs/affiliate.js');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/tracking.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/affiliate/tracking.tpl';
		} else {
			$this->template = 'default/template/affiliate/tracking.tpl';
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

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/product');

			$data = array(
				'filter_name' => $this->request->get['filter_name'];
				'start'       => 0,
				'limit'       => 20
			);

			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				$json[] = array(
					'name' => html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'),
					'link' => str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $result['product_id'] . '&tracking=' . $this->affiliate->getCode()))
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>