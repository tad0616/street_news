<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>
    {include file="nav.tpl"}
    <!-- 開始 -->

    <!-- 當期市井觀點區塊 -->
    <!-- 顯示當期市井觀點文章區塊 -->
    {if $op=='list_point'} {include file="op_list_point.tpl"} {elseif $op=='show_point'} {include file="op_show_point.tpl"} {else}
    {include file="op_show_article.tpl"} {/if}

    <!-- //當期市井觀點區塊 -->
    <!-- //顯示當期市井觀點文章區塊 -->

    <!-- 歷史主題區塊 test -->
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

    <!-- //結束 -->
    {include file="footer.tpl"}
</body>

</html>