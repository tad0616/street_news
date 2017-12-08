<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>
    {include file="nav.tpl"}
    <!-- 開始 -->
    <!-- 自動載入 $op 對應的樣板檔 -->
    {include file="op_$op.tpl"}


    <!-- //結束 -->
    {include file="footer.tpl"}
</body>

</html>