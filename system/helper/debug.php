<?php
class Debug {
	private static $log = array();

	public static function trigger($type, $data, &$caller) {
		if(!isset(self::$log[$type])) self::$log[$type] = array();
		if(!isset(self::$log[$type.'_func'])) self::$log[$type.'_func'] = array();
		self::$log[$type][] = $data;
		self::$log[$type.'_func'][] = array($caller[0]['file'],$caller[0]['line'],(!empty($caller[1]['class']) ? '<br/>'.$caller[1]['class'].'::'.$caller[1]['function'] : ''));
	}

	public static function output() {
		$sql_num = count(self::$log['sql']);
		echo '<tr><td colspan="3">SQL Queries Executed: ' . $sql_num . '</td></tr>';

		if (defined('SQL_DEBUG_SHOW')) {
			for($i = 0; $i < $sql_num; $i++) {
				echo '<tr><td>'.($i+1).'.</td><td>'.self::$log['sql'][$i].'</td><td>'.self::$log['sql_func'][$i][0].' <i>('.self::$log['sql_func'][$i][1].')</i>'.(self::$log['sql_func'][$i][2] ? '<b>'.self::$log['sql_func'][$i][2].'</b>' : '').'</td></tr>';
			}
		}
	}

}
?>