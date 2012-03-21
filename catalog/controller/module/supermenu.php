<?php
class ControllerModuleSuperMenu extends Controller {
	protected function index($setting) {
		$this->data = array_merge($this->data, $this->load->language('module/supermenu'));

		$this->data['action'] = $this->url->link('common/home');

/* ------------------------------------------------- (Products) ------------------------------------------------- */
		// Menu
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$this->data['productCategories'] = array();

		$productCategories = $this->model_catalog_category->getCategories(0);

		foreach ($productCategories as $category) {
			if ($category['top']) {
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);
//				$children = $this->model_catalog_category->getCategoriesAndTotals($category['category_id']);

				foreach ($children as $child) {

					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
//					$product_total = $this->model_catalog_product->getTotalProducts($data);

					$children_data[] = array(
//						'name'  => $child['name'] . ' (' . $product_total . ')',
						'name'  => $child['name'],
//						'name'  => $child['name'] . ' (' . $child['qty'] . ')',
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = false;
				}

				// Level 1
				$this->data['productCategories'][] = array(
					'thumb'    => $image,
					'name'     => $category['name'],
					'children' => $children_data,
//					'column'   => $category['column'] ? $category['column'] : 1,
					'column'   => 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

/* ------------------------------------------------- (Articles) ------------------------------------------------- */
		// Menu
		$this->load->model('article/article_category');
		$this->load->model('article/article');

		$this->data['articleCategories'] = array();

		$articleCategories = $this->model_article_article_category->getCategories(0);

		foreach ($articleCategories as $category) {
//print_r($category);
			if ($category['top']) {
//print_r($category);
				$children_data = array();

				$children = $this->model_article_article_category->getCategories($category['category_id']);
//				$children = $this->model_article_article_category->getCategoriesAndTotals($category['category_id']);

				foreach ($children as $child) {
//print_r($children);

					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);
//					$article_total = $this->model_article_article_category->getTotalArticles($data);

					$children_data[] = array(
//						'name'  => $child['name'] . ' (' . $article_total . ')',
						'name'  => $child['name'],
//						'name'  => $child['name'] . ' (' . $child['qty'] . ')',
						'href'  => $this->url->link('article/article_category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = false;
				}
//print_r($category);

				// Level 1
				$this->data['articleCategories'][] = array(
					'thumb'    => $image,
					'name'     => $category['name'],
					'children' => $children_data,
//					'column'   => $category['column'] ? $category['column'] : 1,
					'column'   => 1,
					'href'     => $this->url->link('article/article_category', 'path=' . $category['category_id'])
				);
			}
		}

/* ------------------------------------------------- (Forums) ------------------------------------------------- */
		// Menu
		$this->load->model('forum/forum_category');
		$this->load->model('forum/thread');

		$this->data['forumCategories'] = array();

		$forumCategories = $this->model_forum_forum_category->getCategories(0);

		foreach ($forumCategories as $category) {
			if ($category['top']) {
				$children_data = array();

				$children = $this->model_forum_forum_category->getCategories($category['category_id']);
//				$children = $this->model_catalog_category->getCategoriesAndTotals($category['category_id']);

				foreach ($children as $child) {

					$data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

//					$thread_total = $this->model_forum_thread->getTotalThreads($data);

					$children_data[] = array(
//						'name'  => $child['name'] . ' (' . $thread_total . ')',
						'name'  => $child['name'],
//						'name'  => $child['name'] . ' (' . $child['qty'] . ')',
						'href'  => $this->url->link('forum/forum_category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				if ($category['image']) {
					$image = $this->model_tool_image->resize($category['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = false;
				}

				// Level 1
				$this->data['forumCategories'][] = array(
					'thumb'    => $image,
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('forum/forum_category', 'path=' . $category['category_id'])
				);
			}
		}

/* ------------------------------------------------- (languages) ------------------------------------------------- */
//
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
//
/* ------------------------------------------------- (currencies) ------------------------------------------------- */
//
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
//
/* ------------------------------------------------- (cart) ------------------------------------------------- */
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

		$this->data['text_total_items'] = $this->cart->countProducts();
		$this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));

/* ------------------------------------------------- (template) ------------------------------------------------- */
		$this->data['logged'] = $this->customer->isLogged();
		$this->data['home'] = $this->url->link('common/home');
		$this->data['text_welcome'] = sprintf($this->language->get('text_welcome'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));

//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/mb_menu/supermenu.css');
		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/mb_menu/mb_menu.css');
		$this->document->addScript(URL_JS . 'libs/mb_menu/jquery.metadata.js');
		$this->document->addScript(URL_JS . 'libs/mb_menu/jquery.hoverIntent.js');
//		$this->document->addScript(URL_JS . 'libs/jquery.hoverIntent.minified.js');
		$this->document->addScript(URL_JS . 'libs/mb_menu/mbMenu.js');
		$this->document->addScript(URL_JS . 'mylibs/mb_menu.js');

//		$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['box_position'] = $setting['position'] ? $setting['position'] : '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/supermenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/supermenu.tpl';
		} else {
			$this->template = 'default/template/module/supermenu.tpl';
		}

		$this->render();
	}
}
