<?php
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
    $config   = HTMLPurifier_Config::createDefault();
    $purifier = new HTMLPurifier($config);

    $sql             = "SELECT * FROM `article` WHERE `sn`='$sn'";
    $result          = $db->query($sql) or die($db->error);
    $data            = $result->fetch_assoc();
    $data['content'] = $purifier->purify($data['content']);
    $smarty->assign('article', $data);
}

//讀出所有類別
function list_topic()
{
    global $db, $smarty;

    $sql    = "SELECT * FROM `topic` ORDER BY `topic_sn` ";
    $result = $db->query($sql) or die($db->error);
    $all    = [];
    $i      = 0;
    while ($data = $result->fetch_assoc()) {
        $all[$i] = $data;
        $i++;
    }

    //die(var_export($all));
    list_topic_status();
    $smarty->assign('all', $all);

}

//讀出所有TOPIC_status
function list_topic_status()
{
    if (!isset($smarty)) {
        global $smarty;
    }

    //狀態值增刪記得修改TABLE值
    $status = ['開始投稿', '當期', '一般', '關閉'];
    $smarty->assign('topic_status', $status);

}
