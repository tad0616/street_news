<!doctype html>
<html lang="zh-Hant-TW">

<head>
    {include file="header.tpl"}
</head>

<body>

    {include file="nav.tpl"}

    <div class="img-container">
        <div class="container py-4">            
            <form class="form-signup" id="usersignup" name="usersignup" method="post" action="createuser.php">
                <h2 class="form-signup-heading">註冊</h2>
                <input name="newuser" id="newuser" type="text" class="form-control" placeholder="輸入帳號" autofocus>
                <input name="email" id="email" type="text" class="form-control" placeholder="輸入Email" value="">
                <br>
                <input name="password1" id="password1" type="password" class="form-control" placeholder="請輸入密碼">
                <input name="password2" id="password2" type="password" class="form-control" placeholder="請再次輸入相同密碼">

                <button name="Submit" id="submit" class="btn btn-lg btn-primary btn-block" type="submit">註冊</button>

                <div id="message"></div>
            </form>
        </div>
    </div>


    {include file="footer.tpl"}
    
    <script src="js/signup.js">
    </script>


    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
    <script>
        $("#usersignup").validate({
            rules: {
                email: {
                    email: true,
                    required: true
                },
                password1: {
                    required: true,
                    minlength: 4
                },
                password2: {
                    equalTo: "#password1"
                }
            }
        });

    </script>
</body>

</html>