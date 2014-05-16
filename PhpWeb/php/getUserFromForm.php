<?php
if ($_SERVER['REQUEST_METHOD']=="POST") {
	// 以POST方式取上送数据
	$name = $_POST["username"];
} else {
	$name = $_GET["username"];
	$name = iconv("GBK","UTF-8//ignore",$name);
}
	
// 连接数据库
$con = mysql_connect("localhost", "root", "root");
if (!$con) {
	die('Could not connect: '.mysql_error());
}
mysql_query("set names utf8", $con) or die(mysql_error());

mysql_select_db("test", $con) or die(mysql_error());


// 查询数据
$result = mysql_query("SELECT * FROM nametable where name='$name'");
$row = mysql_fetch_array($result);
if ($row) {
	$age = $row["age"];
	$salary = $row["salary"];
	$phonenumber = $row["phonenumber"];
	$email = $row["email"];
	$password = $row["password"];
}

// 释放连接资源
mysql_free_result($result);
mysql_close($con);

// 重定向页面，通过Get方式，返回查询到的数据
header("location:MyPagePhp.php?res='1'&name=$name&age=$age&salary=$salary&phonenumber=$phonenumber&email=$email&password=$password");
exit();
