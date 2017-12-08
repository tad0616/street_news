<?php
require_once 'header.php';
$page_title = '街巷故事';

// die(var_dump($_SESSION));

$op = isset($_REQUEST['op']) ? filter_var($_REQUEST['op']) : '';
$sn = isset($_REQUEST['sn']) ? (int) $_REQUEST['sn'] : 0;

/*************控制器**************/

switch ($op) {
    case 'submission':
        $op = 'submission';
        break;

    default:
        if ($sn) {
            show_article($sn);
            $op = 'show_article';
        } else {
            list_story();
            $op = 'list_story';
        }
        break;
}

require_once 'footer.php';

/*************函數區**************/

//讀出所有文章
function list_story()
{
    global $db, $smarty;

    $sql = "SELECT * FROM `article` WHERE `topic_sn`=1 ORDER BY `update_time` DESC";
    include_once "PageBar.php";
    $PageBar = getPageBar($db, $sql, 5, 10);
    $bar = $PageBar['bar'];
    $sql = $PageBar['sql'];
    $total = $PageBar['total'];
    $result = $db->query($sql) or die($db->error);
    $all = array();
    $i = 0;
    while ($data = $result->fetch_assoc()) {
        $all[$i] = $data;
        $all[$i]['summary'] = mb_substr(strip_tags($data['content']), 0, 90);
        $i++;
    }
    // die(var_export($all));
    $smarty->assign('all', $all);
    $smarty->assign('bar', $bar);
}
