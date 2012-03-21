<?php
class ControllerCommonHeader extends Controller {
	protected function index() {
		$this->data['title'] = $this->document->getTitle();

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = $this->config->get('config_ssl');
		} else {
			$this->data['base'] = $this->config->get('config_url');
		}

		$this->data['description'] = $this->document->getDescription();
		$this->data['keywords'] = $this->document->getKeywords();
		$this->data['links'] = $this->document->getLinks();
		$this->data['styles'] = $this->document->getStyles();
//		$this->data['scripts'] = $this->document->getScripts();
		$this->data['lang'] = $this->language->get('code');
		$this->data['direction'] = $this->language->get('direction');
//		$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$this->data['theme'] = URL_THEME . $this->config->get('config_template');
		$this->data['breadcrumbs'] = $this->document->getBreadcrumbs();

//		$this->document->social_meta_html = html_entity_decode($this->config->get('social_meta_html'));
//		$this->data['social_url'] = $this->model_tool_seo_url->rewrite($this->config->get('config_url'));
//		$this->data['social_image'] = $this->model_tool_seo_url->rewrite(HTTP_SERVER . $this->config->get('social_opengraph_image'));
//		$this->data['social_twitter_via'] = $this->config->get('social_twitter_via');
//		$this->data['social_mixi_key'] = $this->config->get('social_mixi_key');

		$this->data = array_merge($this->data, $this->load->language('common/header'));

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = HTTPS_IMAGE;
		} else {
			$server = HTTP_IMAGE;
		}

		if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->data['icon'] = $server . $this->config->get('config_icon');
		} else {
			$this->data['icon'] = '';
		}

		$this->data['name'] = $this->config->get('config_name');

//print_r($this->config->get('config_logo'));

		if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
			$this->data['logo'] = $server . $this->config->get('config_logo');
		} else {
			$this->data['logo'] = '';
		}

/*
// moved to supermenu
		// Calculate Totals
		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$this->load->model('setting/extension');
			$sort_order = array();
			$results = $this->model_setting_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}
		}
*/

		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_readlist'] = sprintf($this->language->get('text_readlist'), (isset($this->session->data['readlist']) ? count($this->session->data['readlist']) : 0));
		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
/*
// moved to supermneu
		$this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
*/

		$this->data['logged'] = $this->customer->isLogged();
		$this->data['affiliate_logged'] = $this->affiliate->isLogged();
		$this->data['affiliate_logout'] = $this->url->link('affiliate/logout', '', 'SSL');
		$this->data['home'] = $this->url->link('common/home');
		$this->data['wishlist'] = $this->url->link('account/wishlist');
		$this->data['readlist'] = $this->url->link('article/readlist');
		$this->data['compare'] = $this->url->link('product/compare');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		if (isset($this->request->get['filter_name'])) {
			$this->data['filter_name'] = $this->request->get['filter_name'];
		} else {
			$this->data['filter_name'] = '';
		}

		$this->data['action'] = $this->url->link('common/home');

//print_r($route . ' - - ');
		if (!isset($this->request->get['route'])) {
			$this->data['redirect'] = $this->url->link('common/home');
			$route = $this->url->link('common/home');
		} else {
			$data = $this->request->get;
			unset($data['_route_']);
			$route = $data['route'];
			unset($data['route']);
			$url = '';
			if ($data) {
				$url = '&' . urldecode(http_build_query($data, '', '&'));
			}
			if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
				$connection = 'NOSSL';
			} else {
				$connection = 'SSL';
			}
			$this->data['redirect'] = $this->url->link($route, $url, $connection);
		}
//print_r($route);

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['language_code'])) {
			$this->session->data['language'] = $this->request->post['language_code'];

			if (isset($this->request->post['redirect'])) {
				$this->redirect($this->request->post['redirect']);
			} else {
				$this->redirect($this->url->link('common/home'));
			}
		}

		$this->data['language_code'] = $this->session->data['language'];
		$this->load->model('localisation/language');
		$this->data['languages'] = array();

		$results = $this->model_localisation_language->getLanguages();

		foreach ($results as $result) {
			if ($result['status']) {
				$this->data['languages'][] = array(
					'name'  => $result['name'],
					'code'  => $result['code'],
					'image' => $result['image']
				);
			}
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['currency_code'])) {
			$this->currency->set($this->request->post['currency_code']);

			unset($this->session->data['shipping_methods']);
			unset($this->session->data['shipping_method']);

			if (isset($this->request->post['redirect'])) {
				$this->redirect($this->request->post['redirect']);
			} else {
				$this->redirect($this->url->link('common/home'));
			}
		}
		$this->data['currency_code'] = $this->currency->getCode();
		$this->load->model('localisation/currency');
		$this->data['currencies'] = array();

		$results = $this->model_localisation_currency->getCurrencies();

		foreach ($results as $result) {
			if ($result['status']) {
					$this->data['currencies'][] = array(
					'title'        => $result['title'],
					'code'         => $result['code'],
					'symbol_left'  => $result['symbol_left'],
					'symbol_right' => $result['symbol_right']
				);
			}
		}

$this->load->model('design/layout');

$layout_id = 0;

if (!$layout_id) {
	$layout_id = $this->model_design_layout->getLayout($route);
}

if (!$layout_id) {
	$layout_id = $this->config->get('config_layout_id');
}

$column_left = $this->cache->get('content_left');
//	$column_left = $this->cache->get('content_left.' . $layout_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
$column_right = $this->cache->get('content_right');
//	$column_right = $this->cache->get('content_right.' . $layout_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

if ($column_left && $column_right) {
	$column = 'LR';
} elseif ($column_left && !$column_right)  {
	$column = 'L';
} elseif (!$column_left && $column_right)  {
	$column = 'R';
} else {
	$column = 'None';
}
$this->data['column'] = $column;
//print_r($layout_id);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/header.tpl';
		} else {
			$this->template = 'default/template/common/header.tpl';
		}
/*
		$this->children = array(
				'common/content_header',
				'common/content_left',
				'common/content_right',
				'common/content_center',
				'common/content_footer',
				'common/footer',
				'common/header'
		);
*/

		$this->children = array(
			'common/content_header',
			'common/content_left',
			'common/content_right',
			'common/content_center',
			'common/content_footer',
			'common/footer'
		);

		$this->render();
	}
}
/*
		// Menu
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);
		foreach ($categories as $category) {
			if ($category['top']) {
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true					);
					$product_total = $this->model_catalog_product->getTotalProducts($data);

					$children_data[] = array(
						'name'  => $child['name'] . ' (' . $product_total . ')',
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']));
				}

				// Level 1
				$this->data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
*/
