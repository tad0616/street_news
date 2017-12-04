<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>
    {include file="nav.tpl"}
    <!-- 開始 -->
    <div class="container">
     {if $op=="add_topic" }
         {include file="op_add_topic.tpl"}
     {elseif $op=="modify_topic" } 
        {include file="op_modify_topic.tpl"}
     {else}    
         {include file="op_list_topic.tpl"}        
     {/if}
    </div>
    <!-- 結束 -->
    {include file="footer.tpl"}
</body>

</html>