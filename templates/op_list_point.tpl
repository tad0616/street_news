<!-- 當期市井觀點區塊 -->
{$topic=$topic_list[0]}{assign var="cover" value="uploads/cover_`$topic.topic_sn`.png"} {if file_exists($cover)}
<section class="jumbotron text-center" style="background: url({$cover}) bottom right/ cover no-repeat fixed #000;">
    {else}
    <section class="jumbotron text-center" style="background: url(https://picsum.photos/400/300?image={$topic@index}) bottom right/ cover no-repeat fixed #000;">
        {/if} {if $topic}
        <div class="container">
            <h1>{$topic.topic_title}</h1>
            <p>{$topic.topic_description}</p>
            <hr>
            <p>更新日期：{$article.update_time}</p>
            <a href="point.php?sn={$topic.topic_sn}" class="btn btn-lg btn-block btn-light bottom-shadow" role="button">進入本期主題焦點</a>
        </div>
        {else}
        <h1>尚無內容</h1>
        {/if}
    </section>
    <!-- //當期市井觀點區塊 -->
    <!-- 顯示當期市井觀點文章區塊 -->

    <section>
        <div class="album text-muted">
            <div class="container">
                <div class="row">
                    {foreach $all as $article}
                    <div class="card col-sm-4 top-shadow bottom-shadow">
                        <a href="point.php?sn={$article.sn}" style="text-decoration:none;">
                            {assign var="cover" value="uploads/thumb_`$article.sn`.png"} {if file_exists($cover)}
                            <img src="{$cover}" alt="{$article.title}" class="rounded cover" data-holder-rendered="true"> {else}
                            <img src="https://picsum.photos/400/300?image={$topic@index}" alt="{$article.title}" class="rounded cover" data-holder-rendered="true"> {/if}
                            <div class="latest-post">
                                <h4>{$article.title}</h4>
                            </div>
                            <p class="card-text jumbotron-heading">{$article.summary}</p>
                        </a>
                    </div>
                    {foreachelse}
                    <h1>尚無內容</h1>
                    {/foreach}
                </div>

                <div class=" col-lg ">
                    <div>
                        <a href="point.php?sn={$topic.topic.sn} " class="btn btn-secondary btn-lg btn-block " role="button ">
                            更多專題文章</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //顯示當期市井觀點文章區塊 -->

    <!-- 歷史主題區塊 -->
    <section id="history">
        <div class="container">
            <div class="row">
                <!-- 歷史主題1 -->
                <div class="media">
                    <img class="align-self-center mr-3 cover" src="https://picsum.photos/200/150?image={$article@index}" style="width: 200px; height: 150px;"
                        alt="Generic placeholder image">
                    <span class="badge badge-pill badge-danger">
                        最後更新：&nbsp;{$article.update_time}</span>
                    <div class="media-body col-sm">
                        <h1 class="mt-0">我是歷史主題</h1>
                        <p>Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus
                            et magnis dis parturient montes, nascetur ridiculus mus.</p>
                    </div>
                </div>
                <!-- //歷史主題 -->
            </div>
        </div>
    </section>
    <!-- //歷史主題區塊 -->

    <!-- 頁碼 -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <span class="page-link">«</span>
            </li>
            <li class="page-item active">
                <span class="page-link">1
                    <!-- 當前位置 -->
                    <span class="sr-only">(current)</span>
                </span>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">2</a>
            </li>

            <li class="page-item">
                <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">»</a>
            </li>
        </ul>
    </nav>
    <!-- //頁碼 -->