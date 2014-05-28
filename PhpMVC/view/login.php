<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/login.css" />
<title>用户登陆</title>
</head>
<body>
<div id="divLogin">
<form Method="Post" action="../control/controler.php?fn=login">
<table>
<tr><td width=30%>用户名</td><td colspan="2"><input type="text" name="username" class="inputText" /></td></tr>
<tr><td>密码</td><td colspan="2"><input type="password" name="password" class="inputText" /></td></tr>
<tr><td>验证码</td><td width="35%"><input type="text" name ="checkNum" class="inputText" size="6"/></td><td><img src="../model/checkNum.php" /></td></tr>
<tr><td colspan="3" align="center"><input type="submit" value="登陆" class="inputButton" />
<input type="reset" value="重填" class="inputButton" /></td><tr>
</table>
</form>
<?php 
	if (!empty($_GET['err'])) {
		switch ($_GET['err']) {
			case '1':
				echo "<span style='color:white;background-color:red'>验证码不对</span>";
				break;
				
			case '2':
				echo "<span style='color:white;background-color:red'>用户名为空</span>";
				break;
				
			case '3':
				echo "<span style='color:white;background-color:red'>用户不存在</span>";
				break;
				;
			case '4':
				echo "<span style='color:white;background-color:red'>密码错</span>";
				break;
				
			default:
				break;
		}
	}
?>
</div>

</body>
</html>