<?php
require_once 'header.php';
$page_title = '市井觀點';
define("NUM_OF_LIST_ARTICLE", 3); // number of articles to be displayed at a time
define("TOPIC_TYPE", "主題"); // distinguish from "類別"
define("TOPIC_STATUS_OPEN", 0); // topic opening for comment
define("TOPIC_STATUS_ACTIVE", 1); // active topic
define("TOPIC_STATUS_EFFECTIVE", 2); // effective topics
define("TOPIC_STATUS_CLOSED", 3); // topics closed

$op       = isset($_REQUEST['op']) ? filter_var($_REQUEST['op']) : '';
$sn       = isset($_REQUEST['sn']) ? (int) $_REQUEST['sn'] : 0;
$topic_sn = isset($_REQUEST['topic_sn']) ? (int) $_REQUEST['topic_sn'] : 0;
switch ($op) {
    default:
        if (!$topic_sn and !$sn) {
            $op = 'list_point';
            list_point();
        } elseif ($topic_sn) {
            $op = 'show_point';
            show_point($topic_sn);
        } else {
            $op = 'show_article';
            show_article($sn);
        }
        break;
}
require_once 'footer.php';
/*************函數區**************/
// This function retrieve out all opened topics and last three articles related to active topic.
function list_point()
{
    global $db, $smarty;
    require_once 'HTMLPurifier/HTMLPurifier.auto.php';
    $config   = HTMLPurifier_Config::createDefault();
    $purifier = new HTMLPurifier($config);

    $topic_list = array();
    $all        = array();
    // find out the active topic and stored as the first array element.
    $sql    = "SELECT * FROM `topic` WHERE `topic_type`='" . TOPIC_TYPE . "' and `topic_status`= '" . TOPIC_STATUS_ACTIVE . "'";
    $result = $db->query($sql) or die($db->error);
    if ($data = $result->fetch_assoc()) {
        $topic_list[0] = $data;
        $topic_sn      = $data['topic_sn']; //the topic_sn of active topic
    }
    // Retrieve out all opened topics behind active topic
    $sql    = "SELECT * FROM `topic` WHERE `topic_type`='" . TOPIC_TYPE . "' and `topic_status`= '" . TOPIC_STATUS_EFFECTIVE . "'";
    $result = $db->query($sql) or die($db->error);
    $i      = 1;
    while ($data = $result->fetch_assoc()) {
        $data['topic_description'] = $purifier->purify($data['topic_description']);
        $topic_list[$i]            = $data;
        // $all[$i]['summary'] = mb_substr(strip_tags($data['content']), 0, 90);
        $i++;
    }
    // Retrieve out three last articles related to active topic from article table
    $sql    = "SELECT * FROM `article` WHERE `topic_sn`='{$topic_sn}' ORDER BY `update_time` DESC";
    $result = $db->query($sql) or die($db->error);
    for ($i = 0; $i < NUM_OF_LIST_ARTICLE; $i++) {
        if ($data = $result->fetch_assoc()) {
            $data['content'] = $purifier->purify($data['content']);
            $data['summary'] = mb_substr(strip_tags($data['content']), 0, 90);
            $all[$i]         = $data;
        } else {
            break;
        }
    }
    // var_export($topic_list);
    // var_export($all);
    // die();
    $smarty->assign('all', $all);
    $smarty->assign('topic_list', $topic_list);
}
// list out active topic and its related articles
function show_point($topic_sn)
{
    global $db, $smarty;
    $all        = array();
    $topic_list = array();

    require_once 'HTMLPurifier/HTMLPurifier.auto.php';
    $config   = HTMLPurifier_Config::createDefault();
    $purifier = new HTMLPurifier($config);
    // Retrieve out active topic
    $sql    = "SELECT * FROM `topic` WHERE `topic_sn`=$topic_sn";
    $result = $db->query($sql) or die($db->error);
    if ($data = $result->fetch_assoc()) {
        $data['topic_description'] = $purifier->purify($data['topic_description']);
        $topic                     = $data;
    }
    // Retrieve out all related articles
    $sql    = "SELECT * FROM `article` WHERE `topic_sn`=$topic_sn ORDER by `update_time` DESC";
    $result = $db->query($sql) or die($db->error);
    $i      = 0;
    while ($data = $result->fetch_assoc()) {
        $data['content'] = $purifier->purify($data['content']);
        $all[$i]         = $data;
        $i++;
    }
    // var_export($topic);
    // var_export($all);
    // die();
    $smarty->assign('topic_list', $topic_list);
    $smarty->assign('all', $all);
}
