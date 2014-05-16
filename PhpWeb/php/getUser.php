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

// 以XML格式，返回查询到的数据
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
echo "<users>";
echo "<user>";
echo "<name>$name</name>";
echo "<age>$age</age>";
echo "<salary>$salary</salary>";
echo "<phonenumber>$phonenumber</phonenumber>";
echo "<email>$email</email>";
echo "<password>$password</password>";
echo "</user>";
echo "</users>";
