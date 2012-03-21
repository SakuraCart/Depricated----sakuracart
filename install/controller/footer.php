<?php
class ControllerFooter extends Controller {
	public function index() {
		$this->id       = 'footer';
		$this->template = 'footer.tpl';
		$this->data = array_merge($this->data, $this->load->language('license'));

		$this->render();
	}
}
