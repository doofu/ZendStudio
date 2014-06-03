<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<!-- meta HTTP-EQUIV="pragma" CONTENT="no-cache">
< meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<meta HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT" -->
<title>Insert title here</title>
</head>
<body>
<div class=div1>
	<form name="MVC" Method="Post" action="../control/controler.php">
		<H2>MVC PHP范例程序（返回数据通过Get方式传递）<br>
		目录：view control model<br/>
		文件：[V]phpMySql.php、[C]controler.php、[M]PdoHelper.class.php<br/><br/></H2>
		用户姓名：<input type='text' name='username' id="username" size="30" value=<?php if (!empty($_GET["res"])) echo $_GET['name'] ?>> 
		<!-- input type="button" onclick="getUserByGet();" value="Get访问方式" class=button>  -->
		<font color="red" size="2"><span id="myres" >
		<?php if (!empty($_GET["res"])) echo $_GET["name"]."的电话是:".$_GET["phonenumber"];?>
		
		</span></font><br>
		<!-- div style="border-width: 0; color: red" type="text" id="myres"></div><br -->
		<!-- input style="border-width: 0; color: red" type="text" id="myres" size=50><br -->
		用户年龄：<input type="text" name="age" id="age" value=<?php if (!empty($_GET["res"])) echo $_GET['age'] ?>><br> 
		用户薪水：<input type="text" name="salary" id="salary" value=<?php if (!empty($_GET["res"])) echo $_GET['salary'] ?>><br> 
		电话号码：<input type="text" name="phonenumber" id="phonenumber" value=<?php if (!empty($_GET["res"])) echo $_GET['phonenumber'] ?>><br> 
		电子邮件：<input	type="text" name="email" id="email" value=<?php if (!empty($_GET["res"])) echo $_GET['email'] ?>><br>
		用户密码：<input type="password" name="password" id="password" value=<?php if (!empty($_GET["res"])) echo $_GET['password'] ?>><br><br>
		<!-- input type="button" onclick="addUserByPost();" value="增加" class=button>  -->
		<input type="hidden" name="fn" value="phpMySql">
		<input type="submit" value="查询" class=button>
		<input type="reset" value="清除" class=button><br>
		<br><br>
	</form>
	<br><br>
	<a href="../index.html">首页</a>
</div>
</body>
</html>