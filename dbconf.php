<?php
require_once "setup.php";
//DATABASE CONNECTION VARIABLES
$host     = _DB_HOST; // Host name
$username = _DB_USER; // Mysql username
$password = _DB_PASS; // Mysql password
$db_name  = _DB_NAME; // Database name

//DO NOT CHANGE BELOW THIS LINE UNLESS YOU CHANGE THE NAMES OF THE MEMBERS AND LOGINATTEMPTS TABLES

$tbl_prefix   = ""; //***PLANNED FEATURE, LEAVE VALUE BLANK FOR NOW*** Prefix for all database tables
$tbl_members  = $tbl_prefix . "members";
$tbl_attempts = $tbl_prefix . "loginAttempts";
