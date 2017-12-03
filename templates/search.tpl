<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>

    {include file="nav.tpl"}
    <div class="container">       

        <!-- 自動載入 $op 對應的樣板檔 -->
        {if $op}
            {include file="op_`$op`.tpl"}
        {/if}
    </div>
    {include file="footer.tpl"}

</body>

</html>