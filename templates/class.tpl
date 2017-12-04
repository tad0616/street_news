<!doctype html>
<html lang="zh-Hant-TW">

<head>
  {include file="header.tpl"}
</head>

<body>
  {if $op == "list_class"}
   {include file="nav.tpl"}
  <h1 class="my-3 text-center">{$Title}</h1>
  <div class="container">
    <form action="class.php" method="post">
      <div class="row">
          <div class="col-sm-3">
            <div class="form-group">
              <label for="searchTitle">文章標題</label>
              <input type="text" class="form-control" id="searchTitle" name="searchTitle" value="{$search.title}">
            </div>
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="searchBdate">文章日期</label>
              <input type="text" class="form-control" id="searchBdate" name="searchBdate" value="{$search.bdate}" onClick="WdatePicker()">
            </div>
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="searchEdate">至</label>
              <input type="text" class="form-control" id="searchEdate" name="searchEdate" value="{$search.edate}" onClick="WdatePicker()">
            </div>
          </div>
          <div class="col-sm-1">
            <br>
            <button type="submit" class="btn btn-primary btn-block">搜尋</button>
            <input type="hidden" value="search" name="op">
          </div>
      </div>
    </form>

    <div class="row">
      <table id="myTable" class="table table-striped">
        <thead>
          <tr>
            <th>建立時間</th>
            <th>文章標題</th>
          </tr>
        </thead>
        <tbody>
          {foreach $all as $article}
          <tr>
            <td>{$article.create_time}</td>
            <td>
              <a href="class.php?op=show_class&sn={$article.sn}" target=_blank>{$article.title}</a>
            </td>
          </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  </div>
  {/if}

  {if $op == "show_class"}
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