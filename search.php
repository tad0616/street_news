<?php
require_once 'header.php';
$page_title = '搜尋';

// die(var_dump($_SESSION));

$op      = isset($_REQUEST['op']) ? filter_var($_REQUEST['op']) : '';
$keyword = isset($_REQUEST['keyword']) ? filter_var($_REQUEST['keyword']) : '';

/*************控制器**************/

switch ($op) {
    case 'search':
        search_article($keyword);
        break;

    default:
        break;
}

require_once 'footer.php';

/*************函數區**************/

//讀出所有文章
function search_article($keyword)
{
    global $db, $smarty;

    if (empty($keyword)) {
        header("location: index.php");
        exit;
    }

    $keyword_arr = explode(' ', $keyword);
    $key_arr     = array();
    foreach ($keyword_arr as $word) {
        if (!empty($word)) {
            $key_arr[] = "(`title` LIKE '%{$word}%' OR `content` LIKE '%{$word}%')";
        }
    }
    $query = implode(' OR ', $key_arr);

    $sql = "SELECT * FROM `article`
    WHERE $query
    ORDER BY `update_time` DESC";

    include_once "PageBar.php";

    $PageBar = getPageBar($db, $sql, 5, 10);
    $bar     = $PageBar['bar'];
    $sql     = $PageBar['sql'];
    $total   = $PageBar['total'];
    $result  = $db->query($sql) or die($db->error);

    $all = array();
    $i   = 0;
    while ($data = $result->fetch_assoc()) {
        $all[$i]            = $data;
        $all[$i]['summary'] = mb_substr(strip_tags($data['content']), 0, 90);
        $i++;
    }
    // die(var_export($all));
    $smarty->assign('all', $all);
    $smarty->assign('bar', $bar);
    $smarty->assign('sql', $sql);
}
