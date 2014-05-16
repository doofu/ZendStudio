<?php
// 以POST方式取上送数据
$name = $_POST["username"];
$age = $_POST["age"];
$salary = $_POST["salary"];
$phonenumber = $_POST["phonenumber"];
$email = $_POST["email"];
$password = $_POST["password"];

// 连接数据库
$con = mysql_connect("localhost","root","root");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("test", $con);

$sql = "update nametable set age=$age, salary=$salary , phonenumber='$phonenumber', email='$email', password='$password' where name='$name'"; 

if (!mysql_query($sql,$con))
{
	echo $name." 修改失败！";
}
else {
	echo $name." 修改成功！";
}

// 释放连接资源
mysql_close($con);