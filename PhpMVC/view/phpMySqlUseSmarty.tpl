<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<title>Insert title here</title>
</head>
<body>
<div class=div1>
<form name="MVC" Method="Post" action="../control/controler.php?fn=phpMySqlUseSmarty">
<H2>MVC PHP Smarty范例程序<br/>
目录：view、control、model、smarty,templates,templates_c<br/>
文件：[V]phpMySqlUseSmarty.tpl、[C]controler.php、[M]PdoHelper.class.php</H2><br>
用户姓名：<input type='text' name='username' id="username" size="30" value={$name}> 
<!-- input type="button" onclick="getUserByGet();" value="Get访问方式" class=button>  -->
<font color="red" size="2"><span id="myres" >{$name}的电话是:{$phonenumber}
</span></font><br>
用户年龄：<input type="text" name="age" id="age" value={$age}><br> 
用户薪水：<input type="text" name="salary" id="salary" value={$salary}><br> 
电话号码：<input type="text" name="phonenumber" id="phonenumber" value={$phonenumber}><br> 
电子邮件：<input type="text" name="email" id="email" value={$email}><br>
用户密码：<input type="password" name="password" id="password" value={$password}><br><br>
<input type="submit" value="查询" class=button>
<input type="reset" value="清除" class=button><br>
<br><br>
</form>
<br><br>
<a href="../index.html">首页</a>
</div>
</body>
</html>