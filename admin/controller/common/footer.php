<?php
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->data = array_merge($this->data, $this->load->language('common/footer'));
//		$this->data['text_footer'] = sprintf($this->language->get('text_footer'), VERSION);

//		$this->data['scripts'] = $this->document->getScripts();
		$this->data['breadcrumbs1'] = $this->document->getBreadcrumbs();


		$this->template = 'common/footer.tpl';
		$this->render();
	}
}
?>