<?php
class ControllerInformationInformation extends Controller {
	public function index() {
		$this->data = array_merge($this->data, $this->load->language('information/information'));

		$this->load->model('catalog/information');
/*
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
*/
		$this->document->addBreadcrumbs(
			$this->url->link('common/home'),
			$this->language->get('text_home'),
			false
		);

		if (isset($this->request->get['information_id'])) {
			$information_id = $this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$this->document->setTitle($information_info['title']);
/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $information_info['title'],
				'href'      => $this->url->link('information/information', 'information_id=' .  $information_id),
				'separator' => $this->language->get('text_separator')
			);
*/

			$this->document->addBreadcrumbs(
				$this->url->link('information/information', 'information_id=' .  $information_id),
				$information_info['title'],
				$this->language->get('text_separator')
			);

			$this->data['heading_title'] = $information_info['title'];
			$this->data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['continue'] = $this->url->link('common/home');


//			$this->document->addScript(URL_JS . 'mylibs/author.js');
//			$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
			$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/information.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/information.tpl';
			} else {
				$this->template = 'default/template/information/information.tpl';
			}

			$this->children = array(
				'common/content_header',
				'common/content_left',
				'common/content_right',
				'common/content_center',
				'common/content_footer',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());

		} else {

			$this->data = array_merge($this->data, $this->load->language('error/not_found'));
/*
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('information/information', 'information_id=' . $information_id),
				'separator' => $this->language->get('text_separator')
			);
*/
			$this->document->addBreadcrumbs(
				$this->url->link('information/information', 'information_id=' .  $information_id),
				$this->language->get('text_error'),
				$this->language->get('text_separator')
			);

			$this->document->setTitle($this->language->get('text_error'));

			$this->data['continue'] = $this->url->link('common/home');

//		$this->document->addScript(URL_JS . 'mylibs/author.js');
//		$this->document->addStyle(URL_THEME . $this->config->get('config_template') . '/stylesheet/carousel.css');

//			$this->data['box_position'] = $setting['position'] ?: '';
			$this->data['title_heading_image'] = URL_THEME . $this->config->get('config_template') . '/image';

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}

			$this->children = array(
				'common/content_header',
				'common/content_left',
				'common/content_right',
				'common/content_center',
				'common/content_footer',
				'common/footer',
				'common/header'
			);

			$this->response->setOutput($this->render());
		}
	}

	public function info() {
	/* used for pop up windows */
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = $this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output  = '<html dir="ltr" lang="en">' . "\n";
			$output .= '<head>' . "\n";
			$output .= '  <title>' . $information_info['title'] . '</title>' . "\n";
			$output .= '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
			$output .= '</head>' . "\n";
			$output .= '<body>' . "\n";
			$output .= '  <br /><br /><h1>' . $information_info['title'] . '</h1>' . "\n";
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
			$output .= '  </body>' . "\n";
			$output .= '</html>' . "\n";

			$this->response->setOutput($output);
		}
	}
}
