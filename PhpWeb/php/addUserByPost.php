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

$sql='INSERT INTO nametable (name, age, salary, phonenumber, email, password) VALUES ("'.$name.'", "'.$age.'", "'.$salary.'", "'.$phonenumber.'", "'.$email.'", "'.$password.'")';

if (!mysqli_query($con,$sql))
{
	echo $name." 增加失败！";
}
else {
	echo $name." 增加成功！";
}

// 释放连接资源
mysqli_close($con);