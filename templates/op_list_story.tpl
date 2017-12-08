<div class="container">
    <h1 class="my-3 text-center">街巷故事</h1>
    <div class="row">
        {foreach $all as $article}
        <div class="col-sm-4">
            <a href="index.php?sn={$article.sn}" style="text-decoration:none;">
                <div class="new-article top-shadow bottom-shadow">
                    {assign var="cover" value="uploads/thumb_`$article.sn`.png"} 
                    {if file_exists($cover)}
                        <img src="{$cover}" alt="{$article.title}" class="rounded cover"> 
                    {else}
                        <img src="https://picsum.photos/400/300?image={$article@index}" alt="{$article.title}" class="rounded cover"> 
                    {/if}
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
    {$bar}
</div>