<script src="js/languages/jquery.validationEngine-zh_TW.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">

<script src="ckeditor/ckeditor.js"></script>
<form action="admin.php" method="post" enctype="multipart/form-data" class="my-4" id="myform">
    <table class="table">

        <tr>
            <td>
                <div class="form-group">

                    <div class="form-group">類別/主題，請擇一
                        <select name="sel_topic_sn"> 
　              {foreach $all as $topic}
                    <option value={$topic.topic_sn}>{$topic.topic_type}-{$topic.topic_title}</option>
                {foreachelse}
                    <option value="">尚無內容</option>
                {/foreach}
        </select>
                    </div>
            </td>
            <td>
                <div class="form-group row">
                    <label for="sort_num" class="col-sm-1-12 col-form-label">專題文章順序</label>
                    <div class="col-sm-1-12">
                        <input type="number" style="padding:3px;" min="0" class="form-control " name="sort_num " id="sort " placeholder="請輸入序號 ">
                    </div>
                </div>
            </td>

        </tr>

    </table>
    <div class=" form-group ">
        <label for="title" class="col-form-label sr-only ">文章標題</label>
        <input type="text" class="form-control validate[required] " name="title " id="title " placeholder="請輸入文章標題 ">
    </div>
    <div class="form-group">
        <label for="content" class="col-form-label sr-only ">文章內容</label>
        <textarea name="content" id="content" rows="20 " class="form-control " placeholder="請輸入文章內容"></textarea>
    </div>
    <div class="form-group">
        <label for="title" class="col-form-label sr-only ">封面圖</label>
        <input type="file" class="form-control" name="pic " id="pic " placeholder="請上傳一張封面圖 ">
    </div>
    <div class="text-center ">
        <input type="hidden" name="op" value="insert">
        <input type="hidden" name="username" value="{$smarty.session.username} ">
        <input type="hidden" name="topic_sn" value={$topic.topic_sn}>
        <button type="submit" class="btn btn-primary">儲存</button>
    </div>
</form>

<script>
    CKEDITOR.replace('content');
    $(document).ready(function () {
        $('#myform').validationEngine({ promptPosition: "bottomLeft " });
    });

</script>