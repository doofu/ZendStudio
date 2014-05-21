<?php
require_once '../model/PdoHelper.class.php';
require '../smarty/libs/Smarty.class.php';

if (!empty($_GET['fn'])) {
	$fn = $_GET['fn'];
	try {
		$pdoHelper = new PdoHelper('mysql', 'localhost', 'test', 'root', 'root');

		switch ($fn) {
			case 'phpMySql':
				$sql = "select * from nametable where name='".$_POST['username']."'";
				$res = $pdoHelper->execDql($sql);

 				$header = "Location: ../view/phpMySql.php?res='1'&name=".$res[0]['name']."&age=".$res[0]['age']."&salary=".$res[0]['salary'].
					"&phonenumber=".$res[0]['phonenumber']."&email=".$res[0]['email']."&password=".$res[0]['password']; 
				header($header);
				
				exit();
				
			case 'phpMySqlUseSmarty':

				$smarty = new Smarty;
				
				//$smarty->force_compile = true;
				$smarty->debugging = false;
				$smarty->caching = false;
				$smarty->cache_lifetime = 120;
				
 				// 查询数据库
				if (isset($_POST["username"])) {
					// 以POST方式取上送数据
					$name = $_POST["username"];
				} else {
					$name = "";
				}
				
				$sql = "select * from nametable where name='".$name."'";
				$res = $pdoHelper->execDql($sql);
				
				if ($res) {
					$age = $res[0]["age"];
					$salary = $res[0]["salary"];
					$phonenumber = $res[0]["phonenumber"];
					$email = $res[0]["email"];
					$password = $res[0]["password"];
				} else {
					$age = "";
					$salary = "";
					$phonenumber = "";
					$email = "";
					$password = "";
				}
				
				// smarty操作
				$smarty->assign("name", $name);
				$smarty->assign("age", $age);
				$smarty->assign("salary", $salary);
				$smarty->assign("phonenumber", $phonenumber);
				$smarty->assign("email", $email);
				$smarty->assign("password", $password);
		
				$smarty->display('../view/phpMySqlUseSmarty.tpl');
				exit();
				
			default:
				echo "enter2";echo $fn;	
				header("Location: ../view/error.html");
				exit();
		}
	} catch (pdoexception $e) {
		die(iconv('GB2312', 'UTF-8', $e->getmessage())); 	// 将出错信息有GBK转为UTF8
	} catch (Exception $e) {
		echo "数据库操作出错！\n";
		echo iconv('GB2312', 'UTF-8', $e->getmessage());
		$pdoHelper->rollBack();
	}

	header("Location: error.html");
	exit();
}