<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>
    {include file="nav.tpl"}
    <!-- 開始 -->
<!-- {debug} -->
    <!-- 當期市井觀點區塊 -->
    <!-- 顯示當期市井觀點文章區塊 -->
    {if $op=='list_point'} 
    {include file="op_list_point.tpl"} 
    {elseif $op=='show_point'} 
    {include file="op_show_point.tpl"} 
    {else}
    {include file="op_show_article.tpl"}
     {/if}


    {include file="footer.tpl"}
</body>

</html>