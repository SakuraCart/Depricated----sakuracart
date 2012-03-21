<?php
ini_set('display_errors', 1);
//error_reporting(E_ALL);
error_reporting(~E_NOTICE);

// HTTP
define('HTTP_SERVER', 'http://' . $_SERVER['HTTP_HOST'] . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/');
define('HTTP_CART', 'http://' . $_SERVER['HTTP_HOST'] . rtrim(rtrim(dirname($_SERVER['PHP_SELF']), 'install'), '/.\\'). '/');


// DIR
define('DIR_APPLICATION', str_replace('\'', '/', realpath(dirname(__FILE__))) . '/');
define('DIR_SYSTEM', str_replace('\'', '/', realpath(dirname(__FILE__) . '/../')) . '/system/');
define('DIR_TMP', str_replace('\'', '/', realpath(dirname(__FILE__) . '/../')) . '/tmp/');
define('DIR_CATALOG', str_replace('\'', '/', realpath(DIR_APPLICATION . '../')) . '/catalog/');
define('DIR_CART', str_replace('\'', '/', realpath(DIR_APPLICATION . '../')) . '/');
define('DIR_DATABASE', DIR_SYSTEM . 'database/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');

//print_r(DIR_CATALOG);

// Upgrade
$upgrade = false;
/*
if (filesize('../catalog/config.php') > 0) {
	$upgrade = true;
	$file = file(DIR_CART . 'catalog/config.php');
	foreach ($file as $num => $line) {
		if (strpos(strtoupper($line), 'DB_') !== false) {
			eval($line);
		}
	}
}
*/
// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Request
$request = new Request();
$registry->set('request', $request);

// Response
$response = new Response();
$response->addHeader('Content-Type: text/html; charset=UTF-8');
$registry->set('response', $response);

// Session
$session = new Session();
$registry->set('session', $session);



// Language
//$detect = '';
//$code = array();
//$code = 'en';
/*
$languages = array();
$languages[$code]['code'] = 'en';
$languages[$code]['directory'] = 'english';
$languages[$code]['filename'] = 'english';
$languages[$code]['name'] = 'English';
$languages[$code]['locale'] = 'en_US.UTF-8,en_US,en-gb,english';
$languages[$code]['status'] = '1';
*/
$languages['code'] = 'en';
$languages['directory'] = 'english';
$languages['filename'] = 'english';
$languages['name'] = 'English';
$languages['locale'] = 'en_US.UTF-8,en_US,en-gb,english';
$languages['status'] = '1';

/*
if (isset($request->server['HTTP_ACCEPT_LANGUAGE']) && ($request->server['HTTP_ACCEPT_LANGUAGE'])) {
	$browser_languages = explode(',', $request->server['HTTP_ACCEPT_LANGUAGE']);
	foreach ($browser_languages as $browser_language) {
		foreach ($languages as $key => $value) {
			if ($value['status']) {
				$locale = explode(',', $value['locale']);
				if (in_array($browser_language, $locale)) {
					$detect = $key;
				}
			}
		}
	}
}
*/
//print_r($session);
/*
if ($detect) {
	$code = $detect;
} else {
	$code = $languages['code'];
}

if (!isset($session->data['language']) || $session->data['language'] != $code) {
	$session->data['language'] = $code;
}

if (isset($session->data['language']) && array_key_exists($session->data['language'], $languages) && $languages[$session->data['language']]['status']) {
	$code = $session->data['language'];
} elseif (isset($request->cookie['language']) && array_key_exists($request->cookie['language'], $languages) && $languages[$request->cookie['language']]['status']) {
	$code = $request->cookie['language'];
} elseif ($detect) {
	$code = $detect;
} else {
	$code = $languages['code'];
}

if (!isset($request->cookie['language']) || $request->cookie['language'] != $code) {
	setcookie('language', $code, time() + 60 * 60 * 24 * 30, '/', $request->server['HTTP_HOST']);
}
*/
//$code = 'english';
//print_r($languages[$code]['filename']);

$language = array();
//$language = new Language($languages[$code]['directory']);
//$language->load($languages[$code]['filename']);
$language = new Language($languages['directory']);
$language->load($languages['filename']);
$registry->set('language', $language);



// Document
$document = new Document();
$registry->set('document', $document);

// Front Controller
$controller = new Front($registry);

// Router
if (isset($request->get['route'])) {
	$action = new Action($request->get['route']);
} elseif ($upgrade) {
	$action = new Action('upgrade');
} else {
	$action = new Action('step_1');
}
/*
if (isset($request->get['route'])) {
	$action = new Action($request->get['route']);
} else {
	$action = new Action('common/home');
}
*/

// Dispatch
$controller->dispatch($action, new Action('not_found'));

// Output
$response->output();
