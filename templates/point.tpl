<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>
    {include file="nav.tpl"}
    <!-- 開始 -->
    <!-- 市井觀點頁面 -->
    {if $op=='list_point'} {include file="op_list_point.tpl"}
    <!-- 主題頁面 -->
    {elseif $op=='show_point'} {include file="op_show_point.tpl"} {else}
    <!-- 文章頁面 -->
    {include file="op_show_article.tpl"} {/if}

    <!-- //結束 -->
    {include file="footer.tpl"}
</body>

</html>