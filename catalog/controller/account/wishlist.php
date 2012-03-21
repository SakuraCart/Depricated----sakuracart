<?php
class ControllerAccountWishList extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/wishlist', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/wishlist'));

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
/*
		if (!isset($this->session->data['wishlist'])) {
			$this->session->data['wishlist'] = array();
		}

		if (isset($this->request->post['remove'])) {
			foreach ($this->request->post['remove'] as $product_id) {
				$key = array_search($product_id, $this->session->data['wishlist']);

				if ($key !== false) {
					unset($this->session->data['wishlist'][$key]);
				}
			}

			$this->redirect($this->url->link('account/wishlist'));
		}
*/
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
			'href'      => $this->url->link('account/wishlist'),
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
			$this->url->link('account/wishlist', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->data['action'] = $this->url->link('account/wishlist');

		if (!isset($this->session->data['wishlist'])) {
			$this->session->data['wishlist'] = array();
		}

		$this->data['products'] = array();
		foreach ($this->session->data['wishlist'] as $key => $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_wishlist_width'), $this->config->get('config_image_wishlist_height'));
				} else {
					$image = false;
				}

				if ($product_info['quantity'] <= 0) {
					$stock = $product_info['stock_status'];
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $product_info['quantity'];
				} else {
					$stock = $this->language->get('text_instock');
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'thumb'      => $image,
					'name'       => $product_info['name'],
					'model'      => $product_info['model'],
					'stock'      => $stock,
					'price'      => $price,
					'special'    => $special,
					'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
				);
			} else {
				unset($this->session->data['wishlist'][$key]);
			}
		}

		$this->data['continue'] = $this->url->link('account/account', '', 'SSL');

		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_style.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_page.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/jquery/smoothness/jquery-ui-1.8.4.custom.css');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/datatable/datatable_jui.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
		$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/wishlist.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/wishlist.tpl';
		} else {
			$this->template = 'default/template/account/wishlist.tpl';
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

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('account/wishlist'));

		$json = array();

		if (!isset($this->session->data['wishlist'])) {
			$this->session->data['wishlist'] = array();
		}

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (!in_array($this->request->post['product_id'], $this->session->data['wishlist'])) {
				$this->session->data['wishlist'][] = $this->request->post['product_id'];
			}

			if ($this->customer->isLogged()) {
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));
			} else {
				$json['success'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));
			}
			$json['total'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		} $this->response->setOutput(json_encode($json));
	}
	public function remove() {
		$this->language->load('account/wishlist');
		$json = array();
		if (!isset($this->session->data['wishlist'])) {
			$this->session->data['wishlist'] = array();
		}
		if (isset($this->request->post['product_id'])) {
			$this->load->model('catalog/product');
			$product_info = $this->model_catalog_product->getProduct($this->request->post['product_id']);
			if ($product_info) {
				$key = array_search($this->request->post['product_id'], $this->session->data['wishlist']);

				if ($key !== false) {
					unset($this->session->data['wishlist'][$key]);
				}

				if ($this->session->data['wishlist']) {
					$json['success'] = sprintf($this->language->get('text_remove'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('account/wishlist'));
				} else {
					$json['redirect'] = $this->url->link('account/wishlist');
				}
			}
		}
		$this->response->setOutput(json_encode($json));	}
}
