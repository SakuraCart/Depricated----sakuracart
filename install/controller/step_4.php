<?php
class ControllerStep4 extends Controller {
	public function index() {
		$this->children = array(
			'header',
			'footer'
		);

		$this->data = array_merge($this->data, $this->load->language('license'));
		$this->document->setTitle($this->language->get('text_heading_step_4'));

		$this->template = 'step_4.tpl';

		$this->response->setOutput($this->render());
	}
}
