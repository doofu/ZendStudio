<?php

require '../smarty/libs/Smarty.class.php';

$smarty = new Smarty;

//$smarty->force_compile = true;
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 120;

// 查询数据库
if (isset($_POST["username"])) {
// 以POST方式取上送数据
	$name = $_POST["username"];
} else {
	$name = "";
}
	
// 连接数据库
$con = mysqli_connect("localhost","root","root","test");
// $con = mysql_connect("localhost", "root", "root");
if (!$con) {
	die('Could not connect: '.mysql_error());
}
mysqli_query($con, "set names utf8") or die(mysql_error());

// 查询数据
$result = mysqli_query($con, "SELECT * FROM nametable where name='$name'");
$row = mysqli_fetch_array($result);
if ($row) {
	$age = $row["age"];
	$salary = $row["salary"];
	$phonenumber = $row["phonenumber"];
	$email = $row["email"];
	$password = $row["password"];
} else {
	$age = "";
	$salary = "";
	$phonenumber = "";
	$email = "";
	$password = "";
}

// 释放连接资源
mysqli_free_result($result);
mysqli_close($con);

// smarty操作
$smarty->assign("name", $name);
$smarty->assign("age", $age);
$smarty->assign("salary", $salary);
$smarty->assign("phonenumber", $phonenumber);
$smarty->assign("email", $email);
$smarty->assign("password", $password);

$smarty->display('MyPagePhp.tpl');

