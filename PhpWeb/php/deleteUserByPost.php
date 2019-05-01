<?php
// 以POST方式取上送数据
$name = $_POST["username"];

// 连接数据库
$con = mysqli_connect("localhost","root","root","test");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}

$sql="delete from nametable where name='$name'";
if (!mysqli_query($con, $sql)) {
	echo $name." 删除失败！";
}
else {
	echo $name." 删除成功！";
}

// 释放连接资源
mysqli_close($con);