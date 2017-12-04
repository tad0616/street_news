<!doctype html>
<html lang="zh-Hant-TW">

<head>
  {include file="header.tpl"}
</head>

<body>
  {include file="nav.tpl"}
  {if $op == "list_focus"}
  <div class="container">
      <h1 class="my-3 text-center">{$Title}</h1>
      <div class="row">
        {foreach $all as $article}
        <div class="col-sm-4">
          <a href="index.php?sn={$article.sn}" style="text-decoration:none;">
            <div class="new-article top-shadow bottom-shadow">
              {assign var="cover" value="uploads/thumb_`$article.sn`.png"} {if file_exists($cover)}
              <img src="{$cover}" alt="{$article.title}" class="rounded cover"> {else}
              <img src="https://picsum.photos/400/300?image={$article@index}" alt="{$article.title}" class="rounded cover">            {/if}
              <div class="latest-post">
                <h4>{$article.title}</h4>
              </div>
              <p>{$article.summary}</p>
            </div>
          </a>
        </div>
        {foreachelse}
        <h1>尚無內容</h1>
        {/foreach}
      </div>
  </div>
  {/if}

  {if $op == "show_focus"}
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
  {/if}

  {include file="footer.tpl"}

</body>
  <script src="My97DatePicker/WdatePicker.js"></script>
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
</html>