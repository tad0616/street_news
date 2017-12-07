<!-- 當期市井觀點區塊 -->
{assign var="cover" value="uploads/thumb_`$topic.topic_sn`.png"} {if file_exists($cover)}
<section class="jumbotron text-center" style="background: url({$cover}) bottom right/ cover no-repeat fixed #000;">
    {else}
    <section class="jumbotron text-center" style="background: url(https://picsum.photos/400/300?image={$topic@index}) bottom right/ cover no-repeat fixed #000;">
        {/if}

        <div class="container">
            {foreach $all as $topic}
            <h1>{$topic.topic_title}}</h1>
            <p>{$topic.topic_type}</p>
            <hr>
            <p>更新日期：</p>
            <a href="#" class="btn btn-lg btn-block btn-light bottom-shadow" role="button">進入專題</a>
        </div>
        {foreachelse}
        <h1>尚無內容</h1>
        {/foreach}
    </section>
    <!-- //當期市井觀點區塊 -->
    <!-- 顯示當期市井觀點文章區塊 -->
    <section>
        <div class="album text-muted">
            <div class="container">
                <div class="row">
                    {foreach $all as $topic}
                    <div class="card col-sm top-shadow bottom-shadow">
                        <a href="point.php?sn={$topic.topic_sn}" style="text-decoration:none;">
                            {assign var="cover" value="uploads/thumb_`$topic.topic_sn`.png"} {if file_exists($cover)}
                            <img src="{$cover}" alt="{$topic.topic_title}" class="rounded cover" data-holder-rendered="true"> {else}
                            <img src="https://picsum.photos/400/300?image={$topic@index}" alt="{$topic.topic_title}" class="rounded cover" data-holder-rendered="true"> {/if}
                            <div class="latest-post">
                                <h4>{$topic.topic_title}}</h4>
                            </div>
                            <p class="card-text jumbotron-heading">{$topic.topic_type}</p>
                        </a>
                    </div>
                    {foreachelse}
                    <h1>尚無內容</h1>
                    {/foreach}
                </div>

                <div class=" col-lg ">
                    <div>
                        <a href="point.php?sn={$topic.topic_sn} " class="btn btn-secondary btn-lg btn-block " role="button ">
                            更多專題文章</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //顯示當期市井觀點文章區塊 -->