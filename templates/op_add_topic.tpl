<script src="js/languages/jquery.validationEngine-zh_TW.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">

<script src="ckeditor/ckeditor.js"></script>
<form action="topic.php" method="post" enctype="multipart/form-data" class="my-4" id="myform">

    <div class="form-group">
        <label for="topic_title" class="col-form-label sr-only">類別或主題名稱</label>
        <input type="text" class="form-control validate[required]" name="topic_title" id="topic_title" placeholder="類別或主題名稱">
    </div>
    <div class="form-group">請擇一
        <select name="topic_type">
        
            <option value="類別">類別</option>
            <option value="主題">主題</option>
        </select>
    </div>
    <div class="form-group">
        <label for="topic_description" class="col-form-label sr-only">說明</label>
        <textarea name="topic_description" id="topic_description" rows="20" class="form-control " placeholder="請輸入專題說明"></textarea>
    </div>
    <div class="form-group">主題狀態:
        <!--  {foreach $status as $key => $topic_status}
        <input type="radio" id="topic_status{$key}" name="topic_status" value="{$key}">
        <label for="topic_status{$key}">{$topic_status.topic_status}</label> 
        {/foreach} -->
        <input type="radio" id="topic_status1" name="topic_status" value="0">
        <label for="topic_status1">開始投稿</label>
        <input type="radio" id="topic_status2" name="topic_status" value="1">
        <label for="topic_status2">當期</label>
        <input type="radio" id="topic_status3" name="topic_status" value="2" checked="checked">
        <label for="topic_status3">一般</label>
        <input type="radio" id="topic_status4" name="topic_status" value="3">
        <label for="topic_status4">關閉</label>
    </div>
    <div class="form-group">
        <label for="pic" class="col-form-label sr-only">封面圖</label>
        <input type="file" class="form-control" name="pic" id="pic" placeholder="請上傳一張封面圖">
    </div>
    <div class="text-center">
        <input type="hidden" name="op" value="insert">
        <input type="hidden" name="username" value="{$smarty.session.username}">
        <button type="submit" class="btn btn-primary">儲存</button>
    </div>
</form>

<script>
    CKEDITOR.replace('topic_description');
    $(document).ready(function () {
        $('#myform').validationEngine({ promptPosition: "bottomLeft" });
    });

</script>