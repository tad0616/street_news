<nav id="news" class="navbar navbar-expand-md navbar-dark sticky-top bg-dark py-0">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#menu">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="index.php">
        <img alt="Brand" src="images/logo.png" class="img-fluid">
    </a>

    <div class="collapse navbar-collapse" id="menu">
        <div class="navbar-nav mr-auto">
            <a href="index.php" class="nav-link text-white">首頁</a>
            <a href="focus.php" class="nav-link text-white">編輯精選</a>
            <a href="story.php" class="nav-link text-white">街巷故事</a>
            <a href="point.php" class="nav-link text-white">市井觀點</a>
            <a href="class.php" class="nav-link text-white">私房知識塾</a>
        </div>

        <div class="navbar-nav">
        {include file="op_search_form.tpl"}
        {if isset($smarty.session.username)}
            <a href="admin.php?op=article_form" class="nav-link text-white">發布</a>
            <a href="picked.php" class="nav-link text-white">精選管理</a>
            <a href="topic.php"  class="nav-link text-white">專題設定</a>
            <a href="logout.php" class="nav-link text-white">登出</a>
        {else} 
            <a href="index.php?op=submission" class="nav-link text-white">投稿</a>
            <a href="signup.php" class="nav-link text-white">註冊</a>
            <a href="main_login.php" class="nav-link text-white">登入</a>
        {/if}
        </div>
    </div>
</nav>