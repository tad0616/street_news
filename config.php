<?php
include_once 'setup.php';
//Pull '$base_url' and '$signin_url' from this file
include 'globalcon.php';
//Pull database configuration from this file
include 'dbconf.php';

//Set this for global site use
$site_name = '巷集談-街道新聞';

//Maximum Login Attempts
$max_attempts = 5;
//Timeout (in seconds) after max attempts are reached
$login_timeout = 300;

//ONLY set this if you want a moderator to verify users and not the users themselves, otherwise leave blank or comment out
$admin_email = _VERIFY_EMAIL;

//EMAIL SETTINGS
//SEND TEST EMAILS THROUGH FORM TO https://www.mail-tester.com GENERATED ADDRESS FOR SPAM SCORE
$from_email = _ADM_EMAIL; //Webmaster email
$from_name = '管理員'; //"From name" displayed on email

//Find specific server settings at https://www.arclab.com/en/kb/email/list-of-smtp-and-pop3-servers-mailserver-list.html
$mailServerType = _USE_SMTP ? 'smtp' : '';
//IF $mailServerType = 'smtp'
$smtp_server = _SMTP_SERVER;
$smtp_user = _SMTP_USER;
$smtp_pw = _SMTP_PASS;
$smtp_port = 587; //465 for ssl, 587 for tls, 25 for other
$smtp_security = 'tls'; //ssl, tls or ''

//HTML Messages shown before URL in emails (the more
$verifymsg = '點擊此連結以驗證您的新帳戶！'; //Verify email message
$active_email = '您的新帳戶現在已經完成啟動！ 請點擊此連結以登錄網站！'; //Active email message
//LOGIN FORM RESPONSE MESSAGES/ERRORS
$signupthanks = '謝謝您註冊！ 您將很快收到一封確認您的帳戶驗證的電子郵件。';
$activemsg = '您的帳戶已通過驗證！ 您現在可以登錄 <br><a href="' . $signin_url . '">' . $signin_url . '</a>';

//DO NOT TOUCH BELOW THIS LINE
//Unsets $admin_email based on various conditions (left blank, not valid email, etc)
if (trim($admin_email, ' ') == '') {
    unset($admin_email);
} elseif (!filter_var($admin_email, FILTER_VALIDATE_EMAIL) == true) {
    $invalid_mod = "$admin_email 不是有效的電子郵件地址";
    unset($admin_email);
    echo $invalid_mod;
}

//Makes readable version of timeout (in minutes). Do not change.
$timeout_minutes = round(($login_timeout / 60), 1);
