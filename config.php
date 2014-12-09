<?php

//ROOT
define('DIR_ROOT', dirname(__FILE__));

// BOOTSTRAP
if (is_file('bootstrap.php')) {
	require_once(DIR_ROOT . DIRECTORY_SEPARATOR . 'bootstrap.php');
}

// HTTP
define('HTTP_SERVER', 'http://' . DOMAIN_NAME . SITE_ALIAS);

// HTTPS
define('HTTPS_SERVER', 'http://' . DOMAIN_NAME . SITE_ALIAS);

// DIR
define('DIR_APPLICATION', DIR_ROOT . DIRECTORY_SEPARATOR . 'catalog/');
define('DIR_SYSTEM', DIR_ROOT . DIRECTORY_SEPARATOR . 'system/');
define('DIR_LANGUAGE', DIR_APPLICATION . DIRECTORY_SEPARATOR . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . DIRECTORY_SEPARATOR . 'view/theme/');
define('DIR_CONFIG', DIR_SYSTEM . DIRECTORY_SEPARATOR . 'config/');
define('DIR_IMAGE', DIR_ROOT . DIRECTORY_SEPARATOR . 'image/');
define('DIR_CACHE', DIR_SYSTEM . DIRECTORY_SEPARATOR . 'cache/');
define('DIR_DOWNLOAD', DIR_SYSTEM . DIRECTORY_SEPARATOR . 'download/');
define('DIR_UPLOAD', DIR_SYSTEM . DIRECTORY_SEPARATOR . 'upload/');
define('DIR_MODIFICATION', DIR_SYSTEM . DIRECTORY_SEPARATOR . 'modification/');
define('DIR_LOGS', DIR_SYSTEM . DIRECTORY_SEPARATOR . 'logs/');