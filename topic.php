<?php
require "loginheader.php";
require_once 'header.php';
$page_title = '專題設定';

$op = isset($_REQUEST['op']) ? filter_var($_REQUEST['op']) : '';
$sn = isset($_REQUEST['sn']) ? (int) $_REQUEST['sn'] : 0;

switch ($op) {
    case 'add_topic':
        //新增類別
        //$sn = insert_topic();
        //header("location: index.php?sn={$sn}");
        break;
    case 'insert':
        $sn = insert_topic();
        header("location: topic.php");
        exit;
    case 'update':
        update_topic($sn);
        header("location: topic.php");
        exit;

    case 'modify_topic':
        //修改類別
        show_topic($sn);
        break;
    case 'delete_topic':
        //刪除類別
        delete_topic($sn);
        header("location: topic.php");
        exit;
    //預設動作
    default:
        list_topic(); //$action_id
        break;
        /*  if ($sn) {

$op = 'show_topic';
show_topic($sn);
list_topic($sn);
} else {
$op = 'list_topic';
list_topic();
}
break; */
}

require_once 'footer.php';

/*************函數區**************/

//儲存類別
function insert_topic()
{
    global $db;
    $topic_title       = $db->real_escape_string($_POST['topic_title']);
    $topic_type        = $db->real_escape_string($_POST['topic_type']);
    $topic_description = $db->real_escape_string($_POST['topic_description']);
    $topic_status      = $db->real_escape_string($_POST['topic_status']);

    if ($topic_type == "類別") {
        $topic_status = '';
    }

    $sql = "INSERT INTO `topic` (`topic_title`, `topic_type`, `topic_description`, `topic_status`, `username`) VALUES ('{$topic_title}', '{$topic_type}', '{$topic_description}', '{$topic_status}' ,'{$_SESSION['username']}')";
    $db->query($sql) or die($db->error);
    $sn = $db->insert_id;
    upload_pic($sn);
    return $sn;
}
//刪除類別
function delete_topic($sn)
{
    global $db;

    $sql = "DELETE FROM `topic` WHERE topic_sn='{$sn}'";
    $db->query($sql) or die($db->error);

}

//更新類別
function update_topic($sn)
{
    global $db;
    $topic_title       = $db->real_escape_string($_POST['topic_title']);
    $topic_type        = $db->real_escape_string($_POST['topic_type']);
    $topic_description = $db->real_escape_string($_POST['topic_description']);
    $topic_status      = $db->real_escape_string($_POST['topic_status']);

    if ($topic_type == "類別") {
        $topic_status = '';
    }

    $sql = "UPDATE `topic` SET `topic_title`='{$topic_title}', `topic_type`='{$topic_type}', `topic_description`='{$topic_description}',`topic_status`='{$topic_status}'  WHERE `topic_sn`='{$sn}' ";

    $db->query($sql) or die($db->error);
    upload_pic($sn);
}

//讀出單一類別
function show_topic($sn)
{
    global $db, $smarty;

    require_once 'HTMLPurifier/HTMLPurifier.auto.php';
    $config   = HTMLPurifier_Config::createDefault();
    $purifier = new HTMLPurifier($config);

    $sql                       = "SELECT * FROM `topic` WHERE `topic_sn`='$sn'";
    $result                    = $db->query($sql) or die($db->error);
    $data                      = $result->fetch_assoc();
    $data['topic_description'] = $purifier->purify($data['topic_description']);
    $smarty->assign('topic', $data);
}

function upload_pic($sn)
{

    if (isset($_FILES)) {
        require_once 'class.upload.php';
        $foo = new Upload($_FILES['pic']);
        if ($foo->uploaded) {
            // save uploaded image with a new name
            $foo->file_new_name_body = 'topic_cover_' . $sn;
            $foo->file_overwrite     = true;
            $foo->image_resize       = true;
            $foo->image_convert      = png;
            $foo->image_x            = 1200;
            $foo->image_ratio_y      = true;
            $foo->Process('uploads/');
            if ($foo->processed) {
                $foo->file_new_name_body = 'topic_thumb_' . $sn;
                $foo->file_overwrite     = true;
                $foo->image_resize       = true;
                $foo->image_convert      = png;
                $foo->image_x            = 400;
                $foo->image_ratio_y      = true;
                $foo->Process('uploads/');
            }
        }
    }
}
