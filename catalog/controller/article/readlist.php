<?php
class ControllerArticleReadList extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('article/readlist', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('article/readlist'));

		$this->load->model('article/article');

		$this->load->model('tool/image');

		if (!isset($this->session->data['readlist'])) {
			$this->session->data['readlist'] = array();
		}

		if (isset($this->request->post['remove'])) {
			foreach ($this->request->post['remove'] as $article_id) {
				$key = array_search($article_id, $this->session->data['readlist']);

				if ($key !== false) {
					unset($this->session->data['readlist'][$key]);
				}
			}

			$this->redirect($this->url->link('article/readlist'));
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
			'href'      => $this->url->link('account/readlist'),
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
			$this->url->link('account/readlist', '', 'SSL'),
			$this->language->get('heading_title'),
			$this->language->get('text_separator')
		);

		$this->data['action'] = $this->url->link('account/readlist');

		$this->data['articles'] = array();

		foreach ($this->session->data['readlist'] as $article_id) {
			$article_info = $this->model_article_article->getArticle($article_id);

			if ($article_info) {
				if ($article_info['image']) {
					$image = $this->model_tool_image->resize($article_info['image'], $this->config->get('config_image_readlist_width'), $this->config->get('config_image_readlist_height'));
				} else {
					$image = false;
				}

/*
				if ($article_info['quantity'] <= 0) {
					$stock = $article_info['stock_status'],
				} elseif ($this->config->get('config_stock_display')) {
					$stock = $article_info['quantity'],
				} else {
					$stock = $this->language->get('text_instock');
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($article_info['price'], $article_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$article_info['special']) {
					$special = $this->currency->format($this->tax->calculate($article_info['special'], $article_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
*/

				$this->data['articles'][] = array(
					'article_id' => $article_info['article_id'],
					'thumb'      => $image,
					'name'       => $article_info['name'],
					'model'      => $article_info['model'],
//					'description'=> $article_info['description'],
					'description' => substr(strip_tags(html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8')), 0, 80) . '..',
//					'stock'      => $stock,
//					'price'      => $price,
//					'special'    => $special,
					'href'       => $this->url->link('article/article', 'article_id=' . $article_info['article_id'])
				);
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

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/article/readlist.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/article/readlist.tpl';
		} else {
			$this->template = 'default/template/article/readlist.tpl';
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
//		$this->data = array_merge($this->data, $this->load->language('account/account'));
		$this->data = array_merge($this->data, $this->load->language('article/readlist'));

		$json = array();

		if (!isset($this->session->data['readlist'])) {
			$this->session->data['readlist'] = array();
		}

		if (isset($this->request->post['article_id'])) {
			$article_id = $this->request->post['article_id'];
		} else {
			$article_id = 0;
		}

		$this->load->model('article/article');

		$article_info = $this->model_article_article->getArticle($article_id);

		if ($article_info) {
			if (!in_array($this->request->post['article_id'], $this->session->data['readlist'])) {
				$this->session->data['readlist'][] = $this->request->post['article_id'];
			}

			if ($this->customer->isLogged()) {
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('article/article', 'article_id=' . $this->request->post['article_id']), $article_info['name'], $this->url->link('account/readlist'));
			} else {
				$json['success'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'), $this->url->link('article/article', 'article_id=' . $this->request->post['article_id']), $article_info['name'], $this->url->link('article/readlist'));
			}

			$json['total'] = sprintf($this->language->get('text_readlist_count'), (isset($this->session->data['readlist']) ? count($this->session->data['readlist']) : 0));
		}

		$this->load->library('json');

		$this->response->setOutput(Json::encode($json));
	}
}
