<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=div1>
<font size=9 color=red>页面出错！</font><br/><br/>
<?php 
echo (empty($_GET['err'])) ? '' : $_GET['err']."<br/>";
echo (empty($_GET['message'])) ? '' : $_GET['message']."<br/>";
?>
<br/><br/>
<a href="../index.html">首页</a>
</div>
</body>
</html>