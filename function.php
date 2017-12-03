<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);

//連線到資料庫
function link_db()
{
    $db = new mysqli(_DB_HOST, _DB_USER, _DB_PASS, _DB_NAME);
    if ($db->connect_error) {
        die('無法連上資料庫：' . $db->connect_error);
    }
    $db->set_charset("utf8");
    return $db;
}

//讀出單一文章
function show_article($sn)
{
    global $db, $smarty;

    require_once 'HTMLPurifier/HTMLPurifier.auto.php';
    $config = HTMLPurifier_Config::createDefault();
    $purifier = new HTMLPurifier($config);

    $sql = "SELECT * FROM `article` WHERE `sn`='$sn'";
    $result = $db->query($sql) or die($db->error);
    $data = $result->fetch_assoc();
    $data['content'] = $purifier->purify($data['content']);
    $smarty->assign('article', $data);

    //上一筆
    $sql = "SELECT * FROM `article` WHERE `update_time` > '{$data['update_time']}' ORDER BY `update_time` LIMIT 0,1";
    $result = $db->query($sql) or die($db->error);
    $previous = $result->fetch_assoc();
    $previous['title'] = mb_substr($previous['title'], 0, 16) . '...';
    $smarty->assign('previous', $previous);

    //下一筆
    $sql = "SELECT * FROM `article` WHERE `update_time` < '{$data['update_time']}' ORDER BY `update_time` DESC LIMIT 0,1";
    $result = $db->query($sql) or die($db->error);
    $next = $result->fetch_assoc();
    $next['title'] = mb_substr($next['title'], 0, 16) . '...';
    $smarty->assign('next', $next);
}
