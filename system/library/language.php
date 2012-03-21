<?php
final class Language {
	private $default = 'english';
	private $directory;
	private $data = array();

	public function __construct($directory) {
		$this->directory = $directory;
	}

	public function get($key) {
//print_r($key);
		return (isset($this->data[$key]) ? $this->data[$key] : $key);
	}

	public function load($filename) {
//print_r($filename);
//print_r($this->directory);
		$file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';
//print_r($file);

		if (file_exists($file)) {
			$_ = array();
			require($file);
			$this->data = array_merge($this->data, $_);
			return $this->data;
		}

		$file = DIR_LANGUAGE . $this->default . '/' . $filename . '.php';

		if (file_exists($file)) {
			$_ = array();
			require($file);
			$this->data = array_merge($this->data, $_);
			return $this->data;
		} else {
			echo 'Error: Could not load language ' . $filename . '!';
			exit();
		}

	}
}
