<?php
class ControllerHeader extends Controller {
	public function index() {
		$this->data['title'] = $this->document->getTitle();
		$this->data['description'] = $this->document->getDescription();
		$this->data['links'] = $this->document->getLinks();
		$this->data['styles'] = $this->document->getStyles();
		$this->data['scripts'] = $this->document->getScripts();

//		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['base'] = HTTP_SERVER;

		$this->id       = 'header';
		$this->template = 'header.tpl';


//		$this->data['action'] = $this->url->link('common/home');
//		$this->data['action'] = HTTP_SERVER . 'index.php?route=step_1';


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['language_code'])) {
			$this->session->data['language'] = $this->request->post['language_code'];

			if (isset($this->request->post['redirect'])) {
				$this->redirect($this->request->post['redirect']);
			} else {
				$this->redirect($this->url->link('common/home'));
			}
		}

//$this->data = array_merge($this->data, $this->load->language('common/header'));
//$this->data['language_code'] = $this->session['language'];
//$this->load->model('localisation/language');
$this->data['lang'] = "english";

$this->data['languages'] = array();
//print_r($session);

/*
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
*/
// Language
//$language = array();
$this->data['languages'] = array();
$files = array();
//$this->data['languages'] = glob(DIR_APPLICATION . 'language/*.php');

/*
$results = glob(DIR_APPLICATION . 'language/*.php');
//print_r($results);

foreach ($results as $result) {
		$this->data['languages1'][] = array(
			'name'  => $result['name'],
		);
}
*/
$files = glob(DIR_APPLICATION . 'language/*.php');
if ($files) {
	foreach ($files as $file) {
//		$this->data['languages'] = basename($file, '.php');
		$this->data['languages'][] = array(
			'name'  => basename($file, '.php'),
		);
	}
}

//print_r(DIR_APPLICATION);
/*
if ($files) {
	foreach ($files as $file) {
		$this->data['languages'] = basename($file, '.php');
//		$this->data = array_merge($this->data, $this->load->language('language/' . $install_language));
	}
}

//print_r($files);
//die;
*/

		$this->render();
	}
}
