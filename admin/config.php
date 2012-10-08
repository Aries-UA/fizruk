<?php

$pth = $_SERVER['DOCUMENT_ROOT'];
///
if (substr($pth, (strlen($pth)-1), 1) != DIRECTORY_SEPARATOR) {
    $pth .= DIRECTORY_SEPARATOR;
}

// HTTP
define('HTTP_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/admin/');
define('HTTP_CATALOG', 'http://'.$_SERVER['HTTP_HOST'].'/');
define('HTTP_IMAGE', 'http://'.$_SERVER['HTTP_HOST'].'/image/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$_SERVER['HTTP_HOST'].'/admin/');
define('HTTPS_CATALOG', 'http://'.$_SERVER['HTTP_HOST'].'/');
define('HTTPS_IMAGE', 'http://'.$_SERVER['HTTP_HOST'].'/image/');

// DIR
define('DIR_APPLICATION', $pth.'admin/');
define('DIR_SYSTEM', $pth.'system/');
define('DIR_LIBRARY', $pth.'system/library/');
define('DIR_DATABASE', $pth.'system/database/');
define('DIR_LANGUAGE', $pth.'admin/language/');
define('DIR_TEMPLATE', $pth.'admin/view/template/');
define('DIR_CONFIG', $pth.'system/config/');
define('DIR_IMAGE', $pth.'image/');
define('DIR_CACHE', $pth.'system/cache/');
define('DIR_DOWNLOAD', $pth.'download/');
define('DIR_LOGS', $pth.'system/logs/');
define('DIR_CATALOG', $pth.'catalog/');

// DB
include "config_local.php";

/*
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', '');
define('DB_PASSWORD', '');
define('DB_DATABASE', '');
define('DB_PREFIX', '');
*/

?>
