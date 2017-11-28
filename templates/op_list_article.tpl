
{include file="op_slider.tpl"}
<div class="container">
    <h1 class="my-3 text-center">最新文章</h1>
    <div class="row">
    {foreach $all as $article}
        <div class="col-sm-4">
            {assign var="cover" value="uploads/thumb_`$article.sn`.png"}
            {if file_exists($cover)}
                <img src="{$cover}" alt="{$article.title}" class="rounded cover">
            {else}
                <img src="https://picsum.photos/400/300?image={$article@index}" alt="{$article.title}" class="rounded cover">
            {/if}
            <h3><a href="index.php?sn={$article.sn}">{$article.title}</a></h3>
            <p>{$article.summary}</p>
        </div>
    {foreachelse}
        <h1>尚無內容</h1>
    {/foreach}
    </div>
</div>