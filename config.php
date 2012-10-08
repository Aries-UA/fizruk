<?php

$pth = $_SERVER['DOCUMENT_ROOT'];
$ht = $_SERVER['HTTP_HOST'];

if (substr($pth, (strlen($pth)-1), 1) != DIRECTORY_SEPARATOR) {
    $pth .= DIRECTORY_SEPARATOR;
}

// HTTP
define('HTTP_SERVER', 'http://'.$ht.'/');
define('HTTP_ADMIN', 'http://'.$ht.'/admin');
define('HTTP_IMAGE', 'http://'.$ht.'/image/');

// HTTPS
define('HTTPS_SERVER', 'http://'.$ht.'/');
define('HTTPS_IMAGE', 'http://'.$ht.'/image/');

// DIR
define('DIR_APPLICATION', $pth.'/catalog/');
define('DIR_SYSTEM', $pth.'/system/');
define('DIR_DATABASE', $pth.'/system/database/');
define('DIR_LANGUAGE', $pth.'/catalog/language/');
define('DIR_TEMPLATE', $pth.'/catalog/view/theme/');
define('DIR_CONFIG', $pth.'/system/config/');
define('DIR_IMAGE', $pth.'/image/');
define('DIR_CACHE', $pth.'/system/cache/');
define('DIR_DOWNLOAD', $pth.'/download/');
define('DIR_LOGS', $pth.'/system/logs/');

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
