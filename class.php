<?php
/*
程式功能：從 article , 找出分類編號屬於「私房知識塾」的文章（即 topic_sn=2）
 */
require_once 'header.php';
$page_title = '私房知識塾';

$op          = isset($_REQUEST['op']) ? filter_var($_REQUEST['op']) : '';
$searchTitle = isset($_REQUEST['searchTitle']) ? filter_var($_REQUEST['searchTitle']) : '';
$searchBdate = isset($_REQUEST['searchBdate']) ? filter_var($_REQUEST['searchBdate']) : '';
$searchEdate = isset($_REQUEST['searchEdate']) ? filter_var($_REQUEST['searchEdate']) : '';
$sn          = isset($_REQUEST['sn']) ? (int) $_REQUEST['sn'] : 0;

switch ($op) {
    default:
        if ($sn) {
            show_article($sn);
            $op = 'show_class';
        } else {
            $op = "list_class";
            list_class($searchTitle, $searchBdate, $searchEdate);
        }
        break;
}

require_once 'footer.php';
function list_class($searchTitle = "", $searchBdate = "", $searchEdate = "")
{
    global $db, $smarty;
    $tbl   = 'article';
    $where = "WHERE  `topic_sn`='2' ";
    if ($searchTitle != "") {
        $where .= "and  `title` Like '%$searchTitle%' ";
    }

    if ($searchBdate != "") {
        $where .= "and  `create_time` >= '$searchBdate' ";
    }

    if ($searchEdate != "") {
        $temDate = $searchEdate . " 23:59:59";
        $where .= "and  `create_time` <= '$temDate' ";
    }

    $sql = "SELECT * FROM `{$tbl}` $where ORDER BY sort";
    include_once "PageBar.php";
    // $PageBar = getPageBar($db, $sql, 10, 10);
    // $bar     = $PageBar['bar'];
    // $sql     = $PageBar['sql'];
    // $total   = $PageBar['total'];
    //送至資料庫
    $result = $db->query($sql) or die($db->error);
    //取回資料
    // $date    = '2017/12/04';
    // $weekday = date('l', strtotime($date));
    // die($weekday);
    $all = array();
    $i   = 0;
    while ($data = $result->fetch_assoc()) {
        $all[$i] = $data;
        $wkstr1  = mb_substr(strip_tags($data['content']), 0, 90);
        if (mb_strlen(strip_tags($data['content'])) > mb_strlen($wkstr1)) {
            $wkstr1 .= "<span style='color:red;font-size:0.6em;font-weight:900;'><<更多.......>></span>";
        }
        $all[$i]['summary'] = $wkstr1;
        // 從資料庫 日期欄位 抓出來 內容為 2017-12-04 05:49:29
        $wk1                    = strtotime($all[$i]['create_time']); //
        $weekDayNum             = date('w', $wk1); // 得到數字的星期幾 如 1
        $weekday                = '週' . ['日', '一', '二', '三', '四', '五', '六'][$weekDayNum]; // 轉換成中文
        $wkdate                 = date('Y.m.d', $wk1); // 得到 2017.12.04
        $all[$i]['create_time'] = $wkdate . "(" . $weekday . ")";
        $i++;
    }

    $search          = array();
    $search['title'] = $searchTitle;
    $search['bdate'] = $searchBdate;
    $search['edate'] = $searchEdate;

    $smarty->assign('all', $all);
    $smarty->assign('search', $search);
    // $smarty->assign('bar', $bar);
    // $smarty->assign('total', $total);
}
