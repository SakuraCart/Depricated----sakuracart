<?php
final class DB {
	private $driver;

	public function __construct($driver, $hostname, $username, $password, $database) {
		if (file_exists(DIR_DATABASE . $driver . '.php')) {
			require_once(DIR_DATABASE . $driver . '.php');
		} else {
			exit('Error: Could not load database file ' . $driver . '!');
		}

		$this->driver = new $driver($hostname, $username, $password, $database);
	}

	public function query($sql) {
		if (defined('SQL_DEBUG')) {
			$caller = debug_backtrace(); Debug::trigger('sql', $sql, $caller);
		}
		return $this->driver->query($sql);
	}

	public function escape($value) {
		return $this->driver->escape($value);
	}

	public function countAffected() {
		return $this->driver->countAffected();
	}

	public function getLastId() {
		return $this->driver->getLastId();
	}
}
?>