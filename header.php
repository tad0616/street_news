<?php
if (!isset($_SESSION)) {
    session_start();
}

require_once 'setup.php';
require_once 'function.php';
require_once 'smarty/libs/Smarty.class.php';
$smarty = new Smarty;
$db     = link_db();

//編輯信箱
define('_EDITOR_MAIL', '123@abc.com');

//自動抓樣板檔
define('_PAGE_TPL', str_replace('.php', '.tpl', basename($_SERVER['PHP_SELF'])));
