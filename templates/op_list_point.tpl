<!-- 抓主題底圖來當作封面 -->
{assign var="cover" value="uploads/topic_cover_`$topic.topic_sn`.png"} {if !file_exists($cover)} {$cover = "https://picsum.photos/400/300?random"}
{/if}

<section class="jumbotron text-center" style="background: url({$cover}) bottom right/ cover no-repeat fixed #000;">
    {if $topic}
    <div class="container">
        <h1>{$topic.topic_title}</h1>
        <p>{$topic.topic_description}</p>
        <hr>
        <p>更新日期：{$all[0].update_time}</p>
        <a href="point.php?topic_sn={$topic.topic_sn}" class="btn btn-lg btn-block btn-light bottom-shadow" role="button">進入本期主題焦點</a>
    </div>
    {else}
    <h1>尚無內容</h1>
    {/if}
</section>

<!-- //當期市井觀點區塊 -->
<!-- 顯示當期市井觀點文章區塊 -->

<section class="point-list">
    <div class="container">
        <div class="row">
            <div class="card-deck">
                {foreach $all as $article}
                <div class="card col-sm-4 top-shadow bottom-shadow">
                    <a href="point.php?sn={$article.sn}" style="text-decoration:none;">
                        {assign var="cover" value="uploads/thumb_`$article.sn`.png"} {if file_exists($cover)}
                        <img src="{$cover}" alt="{$article.title}" class="card-img-top" data-holder-rendered="true"> {else}
                        <img src="https://picsum.photos/400/300?image={$topic@index}" alt="{$article.title}" class="card-img-top" data-holder-rendered="true"> {/if}
                        <div class="card-body">
                            <h4>{$article.title}</h4>
                            <p class="card-text">{$article.summary}</p>
                        </div>
                    </a>
                    <h4>{$topic.title}</h4>
                </div>
                {foreachelse}
                <h1>尚無內容</h1>
                {/foreach}
            </div>
        </div>
        {if $have_more > 0}
        <div class=" col-lg ">
            <div>
                <a href="point.php?sn={$topic.topic.sn} " class="btn btn-secondary btn-lg btn-block " role="button ">
                    更多專題文章</a>
            </div>
        </div>
        {/if}
    </div>
    </div>

</section>
<!-- //顯示當期市井觀點文章區塊 -->

<!-- 歷史主題區塊 -->
<section id="history">
    <div class="container">
        <div class="row">
            {foreach $history_topics as $topic} {assign var="cover" value="uploads/topic_cover_`$topic.topic_sn`.png"} {if !file_exists($cover)}
            {$cover = "https://picsum.photos/400/300?random"} {/if}
            <div class="media">
                <img class="align-self-center mr-3 cover" src="{$cover}" style="width: 200px; height: 150px;" alt="Generic placeholder image">
                <div class="media-body col-sm">
                    <h1 class="mt-0">{$topic.topic_title}</h1>
                    {$topic.topic_description}
                </div>
            </div>
            {/foreach}
            <!-- //歷史主題 -->
            <!-- 歷史主題區塊 -->
            <section id="history">
                <div class="container">
                    <div class="row">
                        {foreach $history_topics as $topic} {assign var="cover" value="uploads/topic_cover_`$topic.topic_sn`.png"} {if !file_exists($cover)}
                        {$cover = "https://picsum.photos/400/300?random"} {/if}
                        <div class="media">
                            <img class="align-self-center mr-3 cover" src="{$cover}" style="width: 200px; height: 150px;" alt="Generic placeholder image">
                            <span class="badge badge-pill badge-danger">
                                最後更新：&nbsp;{$all[0].update_time}</span>
                            <div class="media-body col-sm">
                                <h1 class="mt-0">{$topic.topic_title}</h1>
                                {$topic.topic_description}
                            </div>
                        </div>
                        {/foreach}
                        <!-- //歷史主題 -->
                    </div>
                </div>
            </section>
            <!-- //歷史主題區塊 -->