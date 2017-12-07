
<div class="container article">
    <h1>{$article.title}</h1>
    <div class="row">
        <div class="col-8">
            <span class="article-meta">作者：{$article.username}&nbsp;/&nbsp;發佈時間：{$article.update_time}</span>
        </div>
        <div class="col-4"><div class="fontResizer">
            <a class="" style="font-size:16px;border:0;width:5em;cursor:default;">文字大小：</a>
            <a href="javascript:void(0);" class="smallFont">小</a>
            <a href="javascript:void(0);" class="medFont">中</a>
            <a href="javascript:void(0);" class="largeFont">大</a>
        </div>
        </div>
    </div>
    <div class="fontsizebox article-content">{$article.content}</div>

    <!-- AddToAny BEGIN -->
    <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
        <!-- <a class="a2a_dd" href="https://www.addtoany.com/share"></a> -->

        <a class="a2a_button_printfriendly"></a>
        <a class="a2a_button_facebook"></a>
        <a class="a2a_button_twitter"></a>
        <a class="a2a_button_line"></a>
    </div>
    
    <div style="clear: both"></div>
    
    {if isset($previous.sn) or isset($next.sn)}
        <div class="row my-5">
            <div class="col-6 text-left">
                {if $previous.sn}
                    <a href="index.php?sn={$previous.sn}" class="btn btn-info btn-block">
                        <i class="fa fa-chevron-circle-left" aria-hidden="true"></i>
                        {$previous.title}
                    </a>
                {/if}
            </div>
            <div class="col-6 text-right">        
                {if $next.sn}
                    <a href="index.php?sn={$next.sn}" class="btn btn-info btn-block">
                        {$next.title}
                        <i class="fa fa-chevron-circle-right" aria-hidden="true"></i>
                    </a>
                {/if}
            </div>
        </div>
    {/if}


    {if isset($article) and isset($smarty.session.username) and $smarty.session.username == $article.username}
        <div class="alert alert-info text-center">
            <div class="row">
                <div class="col-6 text-left">

                    {if $article.focus == 0}
                    <a href="admin.php?op=add_focus&sn={$article.sn}" class="btn btn-warning">
                        <i class="fa fa-star" aria-hidden="true"></i>&nbsp;加入精選</a>
                    {else}
                    <a href="admin.php?op=remove_focus&sn={$article.sn}" class="btn btn-warning">
                        <i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;移除精選</a>
                    {/if}
                </div>
                <div class="col-6 text-right">
                    <a href="admin.php?op=modify_article&sn={$article.sn}" class="btn btn-success">
                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;編輯</a>
                    <a href="admin.php?op=delete_article&sn={$article.sn}" class="btn btn-danger">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>&nbsp;刪除</a>
                </div>
            </div>
        </div>
    {/if}
</div>

<!-- 內文文字大小script -->
<script type="text/javascript" src="js/fontsize.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        fontResizer('1rem', '1.4rem', '1.6rem');
    });
</script>

<!--分享-->
<script>
    var a2a_config = a2a_config || {};
    a2a_config.locale = "zh-TW";
</script>
<script async src="https://static.addtoany.com/menu/page.js"></script>
<!-- AddToAny END-->