<?php
// 以POST方式取上送数据
$name = $_POST["username"];
$age = $_POST["age"];
$salary = $_POST["salary"];
$phonenumber = $_POST["phonenumber"];
$email = $_POST["email"];
$password = $_POST["password"];

// 连接数据库
$con = mysqli_connect("localhost","root","root","test");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}

$sql = "update nametable set age=$age, salary=$salary , phonenumber='$phonenumber', email='$email', password='$password' where name='$name'"; 

if (!mysqli_query($con,$sql))
{
	echo $name." 修改失败！";
}
else {
	echo $name." 修改成功！";
}

// 释放连接资源
mysqli_close($con);