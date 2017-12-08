<!-- 當期市井觀點區塊 -->

{assign var="cover" value="uploads/topic_thumb_`$topic_sn`.png"} 
{if file_exists($cover)}
    <section class="jumbotron text-center" style="background: url({$cover}) bottom right/ cover no-repeat fixed #000;">
{else}
    <section class="jumbotron text-center" style="background: url(https://picsum.photos/400/300?image={$topic@index}) bottom right/ cover no-repeat fixed #000;">
{/if}
    {if file_exists($cover)}
      <img src="{$cover}" alt="{$topic.title}" class="rounded cover">
    {/if}
    <div class="container">
        {foreach $topic_list as $topic}
          <h1>{$topic.topic_title}</h1>
          <p>{$topic.topic_description}</p>
          <hr>
          <!-- <p>更新日期：</p> -->
        {foreachelse}
          <h1>尚無內容</h1>
        {/foreach}
    </div>
    </section>
    <!--   //當期市井觀點區塊 -->
    <!-- 顯示當期市井觀點文章區塊 -->
    <section>
        <div class="album text-muted">
            <div class="container">
                <div class="row">
                    {foreach $topic_list_three as $topic}
                   
                    <div class="card col-sm top-shadow bottom-shadow">
                        <a href="point.php?sn={$topic.topic_sn}" style="text-decoration:none;">
                            {assign var="cover" value="uploads/thumb_`$topic.sn`.png"} {if file_exists($cover)}
                            <img src="{$cover}" alt="{$topic.topic_title}" class="rounded cover" data-holder-rendered="true"> {else}
                            <img src="https://picsum.photos/400/300?image={$topic@index}" alt="{$topic.title}" class="rounded cover" data-holder-rendered="true"> {/if}
                        </a>
                        <h4>{$topic.title}</h4>
                    </div>
                    {foreachelse}
                    <h1>尚無內容</h1>
                    {/foreach}
                </div>

                {if $have_more > 0}
                <div class=" col-lg ">
                    <div>
                        <a href="point.php?sn={$topic.topic_sn} " class="btn btn-secondary btn-lg btn-block " role="button ">
                            更多專題文章</a>
                    </div>
                </div>
                {/if}
            </div>
        </div>

    </section>
    <!-- //顯示當期市井觀點文章區塊 -->
    <section id="history">
        <div class="container">
            <div class="row">
                {foreach $topic_history as $article}
                <div class="col-sm-4">
                    <a href="index.php?sn={$article.sn}" style="text-decoration:none;">
                        <div class="new-article top-shadow bottom-shadow">
                            {assign var="cover" value="uploads/topic_thumb_`$article.topic_sn`.png"} {if file_exists($cover)}
                            <img src="{$cover}" alt="{$article.title}" class="rounded cover"> {else}
                            <img src="https://picsum.photos/400/300?image={$article@index}" alt="{$article.title}" class="rounded cover">                    {/if}
                        </div>
                            <div class="latest-post">
                                <h4>{$article.title}</h4>
                            </div>
                            <p>{$article.summary}</p>
                    </a>
                </div>
                {foreachelse}
                <h1>尚無內容</h1>
                {/foreach}
            </div>
            {$bar}
        </div>
    </section>