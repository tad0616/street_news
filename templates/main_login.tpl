<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>

    {include file="nav.tpl"}
    <div class="img-container">
        <div class="container pt-4">
            <form class="form-signin" name="form1" method="post" action="checklogin.php">
                <h2 class="form-signin-heading">編輯群登入</h2>
                <input name="myusername" id="myusername" type="text" class="form-control" placeholder="請輸入帳號" autofocus>
                <input name="mypassword" id="mypassword" type="password" class="form-control" placeholder="請輸入密碼">
                <!-- The checkbox remember me is not implemented yet...
                <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                </label>
                -->
                <button name="Submit" id="submit" class="btn btn-lg btn-primary btn-block" type="submit">登入</button>

                <div id="message"></div>
            </form>
        </div>
    </div>


    {include file="footer.tpl"}
    <!-- The AJAX login script -->
    <script src="js/login.js"></script>

</body>

</html>