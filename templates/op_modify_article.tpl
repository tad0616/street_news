<script src="js/languages/jquery.validationEngine-zh_TW.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css">

<script src="ckeditor/ckeditor.js"></script>

    <form action="admin.php" method="post" enctype="multipart/form-data" class="my-4" id="myform" onsubmit="return validate(this);">
        <div class="form-group">
            <label for="title" class="col-form-label sr-only">文章標題</label>
            <input type="text" class="form-control validate[required]" name="title" id="title" placeholder="請輸入文章標題" value="{$article.title}">
        </div>
        <div class="form-group">
            <label for="content" class="col-form-label sr-only">文章內容</label>
            <textarea name="content" id="content" rows="20" class="form-control validate[required, minSize[10]]" placeholder="請輸入文章內容">{$article.content}</textarea>
        </div>
        <div class="form-group">
            <div class="row">
                <label class="col-12" for="pic">上傳特色圖片</label>
                <div class="col-12">
                    {assign var="cover" value="uploads/thumb_{$article.sn}.png"}
                    <!-- 指派和上傳圖檔相同的路徑給$cover -->
                    {if file_exists($cover)}
                    <!-- 如果$cover有得到值 -->
                    <img src="{$cover}" alt="{$post.title}" style="width:200px;"> 
                    {else}
                    <img src="http://fakeimg.pl/200x120/aaaaaa/EAE0D0/?text=REPORTER" alt="{$post.title}">                                        
                    {/if}
                    <small class="form-text text-muted" style="font-size:1rem;">目前圖片，上傳新的圖片將會替換此圖</small>
                    <input type="file" class="form-control" name="pic" id="pic" placeholder="上傳文章封面照片" aria-describedby="fileHelpId" style="font-size:1rem;">
                    <small id="fileHelpId" class="form-text text-muted" style="font-size:1rem;">建議尺寸：1200x630</small>
                </div>
            </div>
        </div>
        <div class="text-center">
            <input type="hidden" name="sn" value="{$article.sn}">
            <input type="hidden" name="op" value="update">
            <input type="hidden" name="username" value="{$smarty.session.username}">
            <button type="submit" class="btn btn-primary">更新</button>
        </div>
    </form>

<script>
    CKEDITOR.replace('content');
    $(document).ready(function () {
        $('#myform').validationEngine({ promptPosition: "bottomLeft" });
    });

    function validate(form) {
        CKEDITOR.instances.content.updateElement();
        $('#content').toggle();
        validated = $(form).validationEngine('validate');
        $('#content').toggle();

        return validated;
    }

</script>