<?php /* Smarty version Smarty-3.1.18, created on 2014-07-11 07:08:38
         compiled from "../view/phpMySqlUseSmarty.tpl" */ ?>
<?php /*%%SmartyHeaderCode:45236751853bf715677bc27-04643857%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1fc8f2cd494ee85ac2bc7b85aeb004e113ccd919' => 
    array (
      0 => '../view/phpMySqlUseSmarty.tpl',
      1 => 1405054065,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '45236751853bf715677bc27-04643857',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'name' => 0,
    'phonenumber' => 0,
    'age' => 0,
    'salary' => 0,
    'email' => 0,
    'password' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.18',
  'unifunc' => 'content_53bf71567baa82_22099556',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53bf71567baa82_22099556')) {function content_53bf71567baa82_22099556($_smarty_tpl) {?><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<title>Insert title here</title>
</head>
<body>
<div class=div1>
<form name="MVC" Method="Post" action="../control/controler.php">
<H2>MVC PHP Smarty范例程序<br/>
目录：view、control、model、smarty,templates,templates_c<br/>
文件：[V]phpMySqlUseSmarty.tpl、[C]controler.php、[M]NametableManage.class.php、[M]PdoHelper.class.php</H2><br>
用户姓名：<input type='text' name='username' id="username" size="30" value=<?php echo $_smarty_tpl->tpl_vars['name']->value;?>
> 
<!-- input type="button" onclick="getUserByGet();" value="Get访问方式" class=button>  -->
<font color="red" size="2"><span id="myres" ><?php echo $_smarty_tpl->tpl_vars['name']->value;?>
的电话是:<?php echo $_smarty_tpl->tpl_vars['phonenumber']->value;?>

</span></font><br>
用户年龄：<input type="text" name="age" id="age" value=<?php echo $_smarty_tpl->tpl_vars['age']->value;?>
><br> 
用户薪水：<input type="text" name="salary" id="salary" value=<?php echo $_smarty_tpl->tpl_vars['salary']->value;?>
><br> 
电话号码：<input type="text" name="phonenumber" id="phonenumber" value=<?php echo $_smarty_tpl->tpl_vars['phonenumber']->value;?>
><br> 
电子邮件：<input type="text" name="email" id="email" value=<?php echo $_smarty_tpl->tpl_vars['email']->value;?>
><br>
用户密码：<input type="password" name="password" id="password" value=<?php echo $_smarty_tpl->tpl_vars['password']->value;?>
><br><br>
<input type="hidden" name="fn" value="phpMySqlUseSmarty">
<input type="submit" value="查询" class=button>
<input type="reset" value="清除" class=button><br>
<br><br>
</form>
<br><br>
<a href="../index.html">首页</a>
</div>
</body>
</html><?php }} ?>
