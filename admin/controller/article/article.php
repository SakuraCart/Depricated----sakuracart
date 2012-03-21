<?php
class ControllerArticleArticle extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('article/article');
		$this->getList();
	}

	public function insert() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('article/article');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_article_article->addArticle($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_summary'])) {
				$url .= '&filter_summary=' . $this->request->get['filter_summary'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
*/
/*
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			if (isset($this->request->get['filter_headline'])) {
				$url .= '&filter_headline=' . $this->request->get['filter_headline'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('article/article');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

//print_r($this->request->post);
//die;

			$this->model_article_article->editArticle($this->request->get['article_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_summary'])) {
				$url .= '&filter_summary=' . $this->request->get['filter_summary'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
*/
/*
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			if (isset($this->request->get['filter_headline'])) {
				$url .= '&filter_headline=' . $this->request->get['filter_headline'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('article/article');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $article_id) {
				$this->model_article_article->deleteArticle($article_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_summary'])) {
				$url .= '&filter_summary=' . $this->request->get['filter_summary'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
*/
/*
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			if (isset($this->request->get['filter_headline'])) {
				$url .= '&filter_headline=' . $this->request->get['filter_headline'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function copy() {
		$this->data = array_merge($this->data, $this->load->language('article/article'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('article/article');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $article_id) {
				$this->model_article_article->copyArticle($article_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . $this->request->get['filter_name'];
			}

			if (isset($this->request->get['filter_summary'])) {
				$url .= '&filter_summary=' . $this->request->get['filter_summary'];
			}
/*
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
*/
/*
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
*/
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			if (isset($this->request->get['filter_headline'])) {
				$url .= '&filter_headline=' . $this->request->get['filter_headline'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	private function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_summary'])) {
			$filter_summary = $this->request->get['filter_summary'];
		} else {
			$filter_summary = null;
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$filter_price = $this->request->get['filter_price'];
		} else {
			$filter_price = null;
		}
*/
/*
		if (isset($this->request->get['filter_quantity'])) {
			$filter_quantity = $this->request->get['filter_quantity'];
		} else {
			$filter_quantity = null;
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}
		if (isset($this->request->get['filter_headline'])) {
			$filter_headline = $this->request->get['filter_headline'];
		} else {
			$filter_headline = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}

		if (isset($this->request->get['filter_summary'])) {
			$url .= '&filter_summary=' . $this->request->get['filter_summary'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}
*/
/*
		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if (isset($this->request->get['filter_headline'])) {
			$url .= '&filter_headline=' . $this->request->get['filter_headline'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['insert'] = $this->url->link('article/article/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['copy'] = $this->url->link('article/article/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('article/article/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['articles'] = array();

		$data = array(
			'filter_name'     => $filter_name,
			'filter_summary'    => $filter_summary,
//			'filter_price'    => $filter_price,
//			'filter_quantity' => $filter_quantity,
			'filter_status'   => $filter_status,
			'filter_headline'   => $filter_headline,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           => $this->config->get('config_admin_limit')
		);

		$this->load->model('tool/image');

		$article_total = $this->model_article_article->getTotalArticles($data);

		$results = $this->model_article_article->getArticles($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('article/article/update', 'token=' . $this->session->data['token'] . '&article_id=' . $result['article_id'] . $url, 'SSL')
			);

			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}
/*
			$article_headlines = $this->model_article_article->getArticleHeadlines($result['article_id']);
			if ($article_headlines) {
			$headline = reset($article_headlines);
			if (($headline['date_start'] != '0000-00-00' && $headline['date_start'] > date('Y-m-d')) || ($headline['date_end'] != '0000-00-00' && $headline['date_end'] < date('Y-m-d'))) {
					$headline = FALSE;
			}
			} else {
			$headline = FALSE;
			}
*/
			$this->data['articles'][] = array(
				'article_id' => $result['article_id'],
				'name'       => $result['name'],
				'summary'      => $result['summary'],
//				'price'      => $result['price'],
//				'headline'    => $headline['price'],
				'image'      => $image,
//				'quantity'   => $result['quantity'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'headline'     => ($result['headline'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'selected'   => isset($this->request->post['selected']) && in_array($result['article_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}

		$this->data['token'] = $this->session->data['token'];

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

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}

		if (isset($this->request->get['filter_summary'])) {
			$url .= '&filter_summary=' . $this->request->get['filter_summary'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}
*/
/*
		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if (isset($this->request->get['filter_headline'])) {
			$url .= '&filter_headline=' . $this->request->get['filter_headline'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_name'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, 'SSL');
		$this->data['sort_summary'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . '&sort=p.summary' . $url, 'SSL');
//		$this->data['sort_quantity'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, 'SSL');
		$this->data['sort_headline'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . '&sort=p.headline' . $url, 'SSL');
		$this->data['sort_order'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}

		if (isset($this->request->get['filter_summary'])) {
			$url .= '&filter_summary=' . $this->request->get['filter_summary'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}
*/
/*
		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if (isset($this->request->get['filter_headline'])) {
			$url .= '&filter_headline=' . $this->request->get['filter_headline'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $article_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('article/article', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_name'] = $filter_name;
		$this->data['filter_summary'] = $filter_summary;
//		$this->data['filter_price'] = $filter_price;
//		$this->data['filter_quantity'] = $filter_quantity;
		$this->data['filter_status'] = $filter_status;
		$this->data['filter_headline'] = $filter_headline;

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->layout = 'common/layout';

		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addStyle('view/stylesheet/datatable/datatable_style.css');
		$this->document->addScript(URL_JS . 'libs/datatables/jquery.dataTables.js');
		$this->document->addScript(URL_JS . 'mylibs/datatable.js');

		$this->template = 'article/article_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function getForm() {
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}

			if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}

			if (isset($this->error['summary'])) {
			$this->data['error_summary'] = $this->error['summary'];
		} else {
			$this->data['error_summary'] = '';
		}

		if (isset($this->error['date_available'])) {
			$this->data['error_date_available'] = $this->error['date_available'];
		} else {
			$this->data['error_date_available'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . $this->request->get['filter_name'];
		}

		if (isset($this->request->get['filter_summary'])) {
			$url .= '&filter_summary=' . $this->request->get['filter_summary'];
		}
/*
		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}
*/
/*
		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
*/
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}
		if (isset($this->request->get['filter_headline'])) {
			$url .= '&filter_headline=' . $this->request->get['filter_headline'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		if (!isset($this->request->get['article_id'])) {
			$this->data['action'] = $this->url->link('article/article/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('article/article/update', 'token=' . $this->session->data['token'] . '&article_id=' . $this->request->get['article_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('article/article', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['article_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$article_info = $this->model_article_article->getArticle($this->request->get['article_id']);
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['article_description'])) {
			$this->data['article_description'] = $this->request->post['article_description'];
		} elseif (isset($article_info)) {
			$this->data['article_description'] = $this->model_article_article->getArticleDescriptions($this->request->get['article_id']);
		} else {
			$this->data['article_description'] = array();
		}

		if (isset($this->request->post['summary'])) {
			$this->data['summary'] = $this->request->post['summary'];
		} elseif (isset($article_info)) {
			$this->data['summary'] = $article_info['summary'];
		} else {
			$this->data['summary'] = '';
		}
/*
		if (isset($this->request->post['sku'])) {
			$this->data['sku'] = $this->request->post['sku'];
		} elseif (isset($article_info)) {
			$this->data['sku'] = $article_info['sku'];
		} else {
			$this->data['sku'] = '';
		}

		if (isset($this->request->post['upc'])) {
			$this->data['upc'] = $this->request->post['upc'];
		} elseif (isset($article_info)) {
			$this->data['upc'] = $article_info['upc'];
		} else {
			$this->data['upc'] = '';
		}

		if (isset($this->request->post['location'])) {
			$this->data['location'] = $this->request->post['location'];
		} elseif (isset($article_info)) {
			$this->data['location'] = $article_info['location'];
		} else {
			$this->data['location'] = '';
		}
*/
		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['article_store'])) {
			$this->data['article_store'] = $this->request->post['article_store'];
		} elseif (isset($article_info)) {
			$this->data['article_store'] = $this->model_article_article->getArticleStores($this->request->get['article_id']);
		} else {
			$this->data['article_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (isset($article_info)) {
			$this->data['keyword'] = $article_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['article_tag'])) {
			$this->data['article_tag'] = $this->request->post['article_tag'];
		} elseif (isset($article_info)) {
			$this->data['article_tag'] = $this->model_article_article->getArticleTags($this->request->get['article_id']);
		} else {
			$this->data['article_tag'] = array();
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (isset($article_info)) {
			$this->data['image'] = $article_info['image'];
		} else {
			$this->data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($article_info) && $article_info['image'] && file_exists(DIR_IMAGE . $article_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($article_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}

		$this->load->model('article/author');

		$this->data['authors'] = $this->model_article_author->getAuthors();

		if (isset($this->request->post['author_id'])) {
			$this->data['author_id'] = $this->request->post['author_id'];
		} elseif (isset($article_info)) {
			$this->data['author_id'] = $article_info['author_id'];
		} else {
			$this->data['author_id'] = 0;
		}
/*
		if (isset($this->request->post['shipping'])) {
			$this->data['shipping'] = $this->request->post['shipping'];
		} elseif (isset($article_info)) {
			$this->data['shipping'] = $article_info['shipping'];
		} else {
			$this->data['shipping'] = 1;
		}
*/
		if (isset($this->request->post['date_available'])) {
					$this->data['date_available'] = $this->request->post['date_available'];
		} elseif (isset($article_info)) {
			$this->data['date_available'] = date('Y-m-d', strtotime($article_info['date_available']));
		} else {
			$this->data['date_available'] = date('Y-m-d', time()-86400);
		}
/*
		if (isset($this->request->post['quantity'])) {
			$this->data['quantity'] = $this->request->post['quantity'];
		} elseif (isset($article_info)) {
			$this->data['quantity'] = $article_info['quantity'];
		} else {
			$this->data['quantity'] = 1;
		}
*/
/*
		if (isset($this->request->post['minimum'])) {
			$this->data['minimum'] = $this->request->post['minimum'];
		} elseif (isset($article_info)) {
			$this->data['minimum'] = $article_info['minimum'],
		} else {
			$this->data['minimum'] = 1;
		}
*/
/*
		if (isset($this->request->post['subtract'])) {
			$this->data['subtract'] = $this->request->post['subtract'],
		} elseif (isset($article_info)) {
			$this->data['subtract'] = $article_info['subtract'],
		} else {
			$this->data['subtract'] = 1;
		}
*/
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (isset($article_info)) {
			$this->data['sort_order'] = $article_info['sort_order'];
		} else {
			$this->data['sort_order'] = 1;
		}
/*
		$this->load->model('localisation/article_status');

		$this->data['article_statuses'] = $this->model_localisation_article_status->getArticleStatuses();

		if (isset($this->request->post['article_status_id'])) {
			$this->data['article_status_id'] = $this->request->post['article_status_id'],
		} else if (isset($article_info)) {
			$this->data['article_status_id'] = $article_info['article_status_id'],
		} else {
			$this->data['article_status_id'] = $this->config->get('config_article_status_id');
		}
*/
/*
		if (isset($this->request->post['price'])) {
			$this->data['price'] = $this->request->post['price'],
		} else if (isset($article_info)) {
			$this->data['price'] = $article_info['price'],
		} else {
			$this->data['price'] = '';
		}
*/
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} else if (isset($article_info)) {
			$this->data['status'] = $article_info['status'];
		} else {
			$this->data['status'] = 1;
		}
		if (isset($this->request->post['headline'])) {
			$this->data['headline'] = $this->request->post['headline'];
		} else if (isset($article_info)) {
			$this->data['headline'] = $article_info['headline'];
		} else {
			$this->data['headline'] = 1;
		}
/*
		$this->load->model('localisation/tax_class');

		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['tax_class_id'])) {
			$this->data['tax_class_id'] = $this->request->post['tax_class_id'],
		} else if (isset($article_info)) {
			$this->data['tax_class_id'] = $article_info['tax_class_id'],
		} else {
			$this->data['tax_class_id'] = 0;
		}
*/
/*
		if (isset($this->request->post['weight'])) {
			$this->data['weight'] = $this->request->post['weight'],
		} else if (isset($article_info)) {
			$this->data['weight'] = $article_info['weight'],
		} else {
			$this->data['weight'] = '';
		}

		$this->load->model('localisation/weight_class');

		$this->data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		$weight_info = $this->model_localisation_weight_class->getWeightClassDescriptionByUnit($this->config->get('config_weight_class'));

		if (isset($this->request->post['weight_class_id'])) {
			$this->data['weight_class_id'] = $this->request->post['weight_class_id'],
		} elseif (isset($article_info)) {
			$this->data['weight_class_id'] = $article_info['weight_class_id'],
		} elseif (isset($weight_info)) {
			$this->data['weight_class_id'] = $weight_info['weight_class_id'],
		} else {
			$this->data['weight_class_id'] = '';
		}
*/
/*
		if (isset($this->request->post['length'])) {
			$this->data['length'] = $this->request->post['length'],
		} elseif (isset($article_info)) {
			$this->data['length'] = $article_info['length'],
		} else {
			$this->data['length'] = '';
		}

		if (isset($this->request->post['width'])) {
			$this->data['width'] = $this->request->post['width'],
		} elseif (isset($article_info)) {
			$this->data['width'] = $article_info['width'],
		} else {
			$this->data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$this->data['height'] = $this->request->post['height'],
		} elseif (isset($article_info)) {
			$this->data['height'] = $article_info['height'],
		} else {
			$this->data['height'] = '';
		}

		$this->load->model('localisation/length_class');

		$this->data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		$length_info = $this->model_localisation_length_class->getLengthClassDescriptionByUnit($this->config->get('config_length_class'));

		if (isset($this->request->post['length_class_id'])) {
			$this->data['length_class_id'] = $this->request->post['length_class_id'],
		} elseif (isset($article_info)) {
			$this->data['length_class_id'] = $article_info['length_class_id'],
		} elseif (isset($length_info)) {
			$this->data['length_class_id'] = $length_info['length_class_id'],
		} else {
			$this->data['length_class_id'] = '';
		}
*/
/*
		if (isset($this->request->post['article_attribute'])) {
			$this->data['article_attributes'] = $this->request->post['article_attribute'],
		} elseif (isset($article_info)) {
			$this->data['article_attributes'] = $this->model_article_article->getArticleAttributes($this->request->get['article_id']);
		} else {
			$this->data['article_attributes'] = array();
		}
*/
/*
		if (isset($this->request->post['article_option'])) {
			$article_options = $this->request->post['article_option'],
		} elseif (isset($article_info)) {
			$article_options = $this->model_article_article->getArticleOptions($this->request->get['article_id']);
		} else {
			$article_options = array();
		}

		$this->data['article_options'] = array();

		foreach ($article_options as $article_option) {
			if ($article_option['type'] == 'select' || $article_option['type'] == 'radio' || $article_option['type'] == 'checkbox') {
				$article_option_value_data = array();

				foreach ($article_option['article_option_value'] as $article_option_value) {
					$article_option_value_data[] = array(
						'article_option_value_id' => $article_option_value['article_option_value_id'],
						'option_value_id'         => $article_option_value['option_value_id'],
						'quantity'                => $article_option_value['quantity'],
						'subtract'                => $article_option_value['subtract'],
						'price'                   => $article_option_value['price'],
						'price_prefix'            => $article_option_value['price_prefix'],
						'points'                  => $article_option_value['points'],
						'points_prefix'           => $article_option_value['points_prefix'],
						'weight'                  => $article_option_value['weight'],
						'weight_prefix'           => $article_option_value['weight_prefix']
					);
				}

				$this->data['article_options'][] = array(
					'article_option_id'    => $article_option['article_option_id'],
					'option_id'            => $article_option['option_id'],
					'name'                 => $article_option['name'],
					'type'                 => $article_option['type'],
					'article_option_value' => $article_option_value_data,
					'required'             => $article_option['required']
				);
			} else {
				$this->data['article_options'][] = array(
					'article_option_id' => $article_option['article_option_id'],
					'option_id'         => $article_option['option_id'],
					'name'              => $article_option['name'],
					'type'              => $article_option['type'],
					'option_value'      => $article_option['option_value'],
					'required'          => $article_option['required']
				);
			}
		}
*/
		$this->load->model('sale/customer_group');

		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
/*
		if (isset($this->request->post['article_discount'])) {
			$this->data['article_discounts'] = $this->request->post['article_discount'],
		} elseif (isset($article_info)) {
			$this->data['article_discounts'] = $this->model_article_article->getArticleDiscounts($this->request->get['article_id']);
		} else {
			$this->data['article_discounts'] = array();
		}
*/
/*
		if (isset($this->request->post['article_headline'])) {
			$this->data['article_headlines'] = $this->request->post['article_headline'],
		} elseif (isset($article_info)) {
			$this->data['article_headlines'] = $this->model_article_article->getArticleHeadlines($this->request->get['article_id']);
		} else {
			$this->data['article_headlines'] = array();
		}
*/
		if (isset($this->request->post['article_image'])) {
			$article_images = $this->request->post['article_image'];
		} elseif (isset($article_info)) {
			$article_images = $this->model_article_article->getArticleImages($this->request->get['article_id']);
		} else {
			$article_images = array();
		}

		$this->data['article_images'] = array();

		foreach ($article_images as $article_image) {
			if ($article_image['image'] && file_exists(DIR_IMAGE . $article_image['image'])) {
				$image = $article_image['image'];
			} else {
				$image = 'no_image.jpg';
			}

			$this->data['article_images'][] = array(
				'image'   => $image,
				'thumb' => $this->model_tool_image->resize($image, 100, 100),
				'sort_order' => $article_image['sort_order']
			);
		}

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->load->model('catalog/download');

		$this->data['downloads'] = $this->model_catalog_download->getDownloads();

		if (isset($this->request->post['article_download'])) {
			$this->data['article_download'] = $this->request->post['article_download'];
		} elseif (isset($article_info)) {
			$this->data['article_download'] = $this->model_article_article->getArticleDownloads($this->request->get['article_id']);
		} else {
			$this->data['article_download'] = array();
		}

		$this->load->model('article/article_category');

		$this->data['categories'] = $this->model_article_article_category->getCategories(0);

		if (isset($this->request->post['article_category'])) {
			$this->data['article_category'] = $this->request->post['article_category'];
		} elseif (isset($article_info)) {
			$this->data['article_category'] = $this->model_article_article->getArticleCategories($this->request->get['article_id']);
		} else {
			$this->data['article_category'] = array();
		}

		if (isset($this->request->post['article_related'])) {
			$articles = $this->request->post['article_related'];
		} elseif (isset($article_info)) {
			$articles = $this->model_article_article->getArticleRelated($this->request->get['article_id']);
		} else {
			$articles = array();
		}

		$this->data['article_related'] = array();

		foreach ($articles as $article_id) {
			$related_info = $this->model_article_article->getArticle($article_id);

			if ($related_info) {
				$this->data['article_related'][] = array(
					'article_id' => $related_info['article_id'],
					'name'       => $related_info['name']
				);
			}
		}

		if (isset($this->request->post['points'])) {
			$this->data['points'] = $this->request->post['points'];
		} else if (isset($article_info)) {
			$this->data['points'] = $article_info['points'];
		} else {
			$this->data['points'] = '';
		}

		if (isset($this->request->post['article_reward'])) {
			$this->data['article_reward'] = $this->request->post['article_reward'];
		} elseif (isset($article_info)) {
			$this->data['article_reward'] = $this->model_article_article->getArticleRewards($this->request->get['article_id']);
		} else {
			$this->data['article_reward'] = array();
		}

		if (isset($this->request->post['article_layout'])) {
			$this->data['article_layout'] = $this->request->post['article_layout'];
		} elseif (isset($article_info)) {
			$this->data['article_layout'] = $this->model_article_article->getArticleLayouts($this->request->get['article_id']);
		} else {
			$this->data['article_layout'] = array();
		}

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();


		$this->document->addStyle('view/stylesheet/table.css');

		$this->document->addScript(URL_JS . 'libs/ckeditor/ckeditor.js');
		$this->document->addScript(URL_JS . 'admin/filemanager.js');
		$this->document->addScript(URL_JS . 'jquery/ui/jquery-ui-timepicker-addon.js');

		$this->template = 'article/article_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'article/article')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['article_description'] as $language_id => $value) {
			if ((strlen(utf8_decode($value['name'])) < 1) || (strlen(utf8_decode($value['name'])) > 255)) {

		$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}

		if ((strlen(utf8_decode($this->request->post['summary'])) < 1) || (strlen(utf8_decode($this->request->post['summary'])) > 64)) {
			$this->error['summary'] = $this->language->get('error_summary');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'article/article')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	private function validateCopy() {
		if (!$this->user->hasPermission('modify', 'article/article')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function option() {
		$output = '';

		$this->load->model('catalog/option');

		$results = $this->model_catalog_option->getOptionValues($this->request->get['option_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['option_value_id'] . '"';

			if (isset($this->request->get['option_value_id']) && ($this->request->get['option_value_id'] == $result['option_value_id'])) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
	}

/*
	public function autocomplete1() {
		$json = array();
		if (isset($this->request->post['filter_name'])) {
			$this->load->model('article/article');
			$data = array(
				'filter_name' => $this->request->post['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);
			$results = $this->model_article_article->getArticles($data);
			foreach ($results as $result) {
				$json[] = array(
					'article_id' => $result['article_id'],
					'name'       => html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'),
					'model'      => $result['model']
//					'price'      => $result['price']
				);
			}
		}
		$this->load->library('json');
		$this->response->setOutput(Json::encode($json));
	}
*/

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_summary']) || isset($this->request->get['filter_category_id'])) {
			$this->load->model('article/article');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_summary'])) {
				$filter_summary = $this->request->get['filter_summary'];
			} else {
				$filter_summary = '';
			}

			if (isset($this->request->get['filter_category_id'])) {
				$filter_category_id = $this->request->get['filter_category_id'];
			} else {
				$filter_category_id = '';
			}

			if (isset($this->request->get['filter_sub_category'])) {
				$filter_sub_category = $this->request->get['filter_sub_category'];
			} else {
				$filter_sub_category = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 20;
			}

			$data = array(
				'filter_name'         => $filter_name,
				'filter_summary'        => $filter_summary,
				'filter_category_id'  => $filter_category_id,
				'filter_sub_category' => $filter_sub_category,
				'start'               => 0,
				'limit'               => $limit
			);

			$results = $this->model_article_article->getArticles($data);

			foreach ($results as $result) {
/*
				$option_data = array();
				$product_options = $this->model_catalog_product->getProductOptions($result['product_id']);

				foreach ($product_options as $product_option) {
					if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
						$option_value_data = array();

						foreach ($product_option['product_option_value'] as $product_option_value) {
							$option_value_data[] = array(
								'product_option_value_id' => $product_option_value['product_option_value_id'],
								'option_value_id'         => $product_option_value['option_value_id'],
								'name'                    => $product_option_value['name'],
								'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
								'price_prefix'            => $product_option_value['price_prefix']
							);
						}

						$option_data[] = array(
							'product_option_id' => $product_option['product_option_id'],
							'option_id'         => $product_option['option_id'],
							'name'              => $product_option['name'],
							'type'              => $product_option['type'],
							'option_value'      => $option_value_data,
							'required'          => $product_option['required']
						);
					} else {
						$option_data[] = array(
							'product_option_id' => $product_option['product_option_id'],
							'option_id'         => $product_option['option_id'],
							'name'              => $product_option['name'],
							'type'              => $product_option['type'],
							'option_value'      => $product_option['option_value'],
							'required'          => $product_option['required']
						);
					}
				}
*/

				$json[] = array(
					'article_id' => $result['article_id'],
					'name'       => html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'),
					'summary'      => $result['summary'],
//					'option'     => $option_data,
//					'price'      => $result['price']
				);
			}

		}
		$this->response->setOutput(json_encode($json));
	}
}
