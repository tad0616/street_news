<script src="js/languages/jquery.validationEngine-zh_TW.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">



<script src="ckeditor/ckeditor.js"></script>

    <form action="admin.php" method="post" enctype="multipart/form-data" class="my-4" id ="myform">
        <div class="form-group">類別/主題，請擇一
            <select name="topic_sn"> 
　              {foreach $all as $topic}
                    <option value={$topic.topic_sn}  
                     {if $topic.topic_sn==$article.classify} selected="selected" {/if}
                    >{$topic.topic_type}-{$topic.topic_title}</option>
                {foreachelse}
                    <option value="">尚無內容</option>
                {/foreach}
        </select>
        </div>
        <div class="form-group">
            <label for="title" class="col-form-label sr-only"></label>
            <input type="text" class="form-control validate[required]" name="title" id="title" placeholder="請輸入文章標題" value="{$article.title}" >
        </div>
        <div class="form-group">
            <label for="content" class="col-form-label sr-only"></label>
            <textarea name="content" id="content" rows="20" class="form-control validate[required, minSize[4], maxSize[50]]" placeholder="請輸入文章內容">{$article.content}</textarea>
        </div>
        <div class="form-group">
            <label for="title" class="col-form-label sr-only">封面圖</label>
            <input type="file" class="form-control" name="pic" id="pic" placeholder="請上傳一張封面圖">
        </div>
        <div class="text-center">
            <input type="hidden" name="sn" value="{$article.sn}">
            <input type="hidden" name="op" value="update">
            <input type="hidden" name="username" value="{$smarty.session.username}">
             <button type="submit" class="btn btn-primary">儲存</button>
        </div>
    </form>

<script>
    CKEDITOR.replace('content');
    $(document).ready(function () {
        $('#myform').validationEngine();
    });
</script>