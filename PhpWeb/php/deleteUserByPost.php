<?php
// 以POST方式取上送数据
$name = $_POST["username"];

// 连接数据库
$con = mysql_connect("localhost","root","root");
if (!$con) {
	die('Could not connect: ' . mysql_error());
}
mysql_select_db("test", $con);

$sql="delete from nametable where name='$name'";
if (!mysql_query($sql, $con)) {
	echo $name." 删除失败！";
}
else {
	echo $name." 删除成功！";
}

// 释放连接资源
mysql_close($con);