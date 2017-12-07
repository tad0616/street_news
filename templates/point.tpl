<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>
    {include file="nav.tpl"}
    <!-- 開始 -->

    <!-- 當期市井觀點區塊 -->
    <section class="jumbotron text-center" style="background: url(uploads/cover_4.png) bottom right/ cover no-repeat fixed #000;">
        <div class="container">
            <h1>我是當期主題</h1>
            <p>主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述主題描述</p>
            <hr>
            <p>更新日期：</p>
            <button type="button" class="btn btn-lg btn-block btn-light bottom-shadow">進入專題</button>
        </div>
    </section>
    <!-- //當期市井觀點區塊 -->


    <!-- 顯示當期市井觀點文章區塊 -->
    <section>
        <div class="album text-muted ">
            <div class="container">
                <div class="row">
                    <!-- 抓取文章1 -->
                    <div class="card col-sm top-shadow bottom-shadow">
                        <img src="https://picsum.photos/400/300?image={$article@index}" data-holder-rendered="true">
                        <p class="card-text jumbotron-heading">文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容</p>
                    </div>
                    <!-- 抓取文章2 -->
                    <div class="card col-sm top-shadow bottom-shadow">
                        <img src="https://picsum.photos/400/300?image={$article@index}" data-holder-rendered="true">
                        <p class="card-text jumbotron-heading">文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容</p>
                    </div>
                    <!-- 抓取文章3 -->
                    <div class="card col-sm top-shadow bottom-shadow">
                        <img src="https://picsum.photos/400/300?image={$article@index}" data-holder-rendered="true">
                        <p class="card-text jumbotron-heading">文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容文章內容</p>
                    </div>
                </div>
                <div class="col-lg">
                    <div>
                        <button type="button" class="btn btn-secondary btn-lg btn-block">
                            更多專題文章</button>
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
                        最後更新：2017.11.11</span>
                    <div class="media-body col-sm">
                        <h1 class="mt-0">我是歷史主題</h1>
                        <p>Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus
                            et magnis dis parturient montes, nascetur ridiculus mus.</p>
                    </div>
                </div>
                <!-- //歷史主題 -->
                <!-- 歷史主題2 -->
                <div class="media">
                    <img class="align-self-center mr-3 cover" src="https://picsum.photos/200/150?image={$article@index}" style="width: 200px; height: 150px;"
                        alt="Generic placeholder image">
                    <span class="badge badge-pill badge-danger">
                        最後更新：2017.11.11</span>
                    <div class="media-body col-sm">
                        <h1 class="mt-0">我是歷史主題</h1>
                        <p>Donec sed odio dui. Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus
                            et magnis dis parturient montes, nascetur ridiculus mus.</p>
                    </div>
                </div>
                <!-- //歷史主題 -->
                <!-- 歷史主題3 -->
                <div class="media">
                    <img class="align-self-center mr-3 cover" src="https://picsum.photos/200/150?image={$article@index}" style="width: 200px; height: 150px;"
                        alt="Generic placeholder image">
                    <span class="badge badge-pill badge-danger">
                        最後更新：2017.11.11</span>
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