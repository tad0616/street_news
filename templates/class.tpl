<!doctype html>
<html lang="zh-Hant-TW">

<head>
  {include file="header.tpl"}
</head>

<body>
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
          <div class="col-sm-3">
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
            <td>{$article.title}</td>
          </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  </div>

  {include file="footer.tpl"}

</body>
  <script src="My97DatePicker/WdatePicker.js"></script>
</html>