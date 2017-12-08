<div class="container article">
    <h1>{$article.title}</h1>
    <div class="row">
        <div class="col-8">
            <span class="article-meta">作者：{$article.username}&nbsp;/&nbsp;發佈時間：{$article.update_time}</span>
        </div>
        <div class="col-4">
            <div class="fontResizer">
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
        <a class="a2a_button_facebook"></a>
        <a class="a2a_button_twitter"></a>
        <a class="a2a_button_line"></a>
    </div>
    <div style="clear: both"></div>
</div>