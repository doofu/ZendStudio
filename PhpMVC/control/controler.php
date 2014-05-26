<?php
require_once '../model/NametableManage.class.php';
require_once '../model/PagingToolbar.class.php';
require_once '../smarty/libs/Smarty.class.php';

if (!empty($_GET['fn'])) {
	$fn = $_GET['fn'];
	try {
		$nametableManage = new NametableManage();

		switch ($fn) {
			case 'phpMySql':
				fnPhpMySql($nametableManage);
				exit();
				
			case 'phpMySqlUseSmarty':
				fnPhpMySqlUseSmarty();
				exit();
				
			case 'getUser':
				fnGetUser();
				exit();
				
			case 'addUser':
				fnAddUser();
				exit();
				
			case 'deleteUser':
				fnDeleteUser();
				exit();
				
			case 'modifyUser':
				fnModifyUser();
				exit();
				
			case 'getPhonenumber':
				fnGetPhonenumber();
				exit();
			
			case 'getPagingData':
				fnGetPagingDataXML();
				exit();
				
			case 'getPagingToolBar':
				fnGetPagingToolBar();
				exit();
				
			default:
				header("Location: ../view/error.php?err=调用参数错");
				exit();
		}
 	} catch (pdoexception $e) {
 		header("Location: ../view/error.php?err=连接数据库错&message=".iconv('GB2312', 'UTF-8', $e->getmessage()));
 		exit();
/* 		die($e->getmessage());		// echo(iconv('GB2312', 'UTF-8', $e->getmessage())); 	// 将出错信息有GBK转为UTF8 */
	} catch (Exception $e) {
		$nametableManage->rollBack();
		header("Location: ../view/error.php?err=数据库操作错&message=".iconv('GB2312', 'UTF-8', $e->getmessage()));
		exit();
/* 		echo $e->getmessage();		//echo iconv('GB2312', 'UTF-8', $e->getmessage()); */
	}

	header("Location: ../view/error.php?err=调用参数错");
	exit();
}

function fnPhpMySql() {
	try{
		$nametableManage = new NametableManage();
		$res = $nametableManage->queryByName($_POST['username']);
		
		$header = "Location: ../view/phpMySql.php?res='1'&name=".$res[0]['name']."&age=".$res[0]['age']."&salary=".$res[0]['salary'].
		"&phonenumber=".$res[0]['phonenumber']."&email=".$res[0]['email']."&password=".$res[0]['password'];
		header($header);
	} catch (Exception $e){
		throw $e;
	}
}

function fnPhpMySqlUseSmarty() {
	try{
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

		$nametableManage = new NametableManage();
		$res = $nametableManage->queryByName($name);
		
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
	} catch (Exception $e){
		throw $e;
	}
}

function fnGetPhonenumber() {
	try{
		if ($_SERVER['REQUEST_METHOD']=="POST") {
			// 以POST方式取上送数据
			$name = $_POST["username"];
		} else {
			$name = $_GET["username"];
			$name = urldecode($name);	// 进行url解码，否则中文为乱码
		}
		
		$nametableManage = new NametableManage();
		$res = $nametableManage->queryByName($name);
		
		echo (empty($res)) ? '无此记录！' : $res[0]['phonenumber'];
	} catch (Exception $e) {
		throw $e;
	}
}

function fnGetUser() {
	try{
		if ($_SERVER['REQUEST_METHOD']=="POST") {
			// 以POST方式取上送数据
			$name = $_POST["username"];
		} else {
			$name = $_GET["username"];
			$name = urldecode($name);	// 进行url解码，否则中文为乱码
		}
		
		$nametableManage = new NametableManage();
		$res = $nametableManage->queryByName($name);
		
		echo "<?xml version='1.0' encoding='UTF-8'?>";
		if ($res) {
			echo "<users><user><name>".$res[0]['name']."</name><age>".$res[0]['age']."</age><salary>".$res[0]['salary']."</salary>";
			echo "<phonenumber>".$res[0]['phonenumber']."</phonenumber><email>".$res[0]['email']."</email>";
			echo "<password>".$res[0]['password']."</password></user></users>";
		}
		else {
			echo "<users><user><name></name><age></age><salary></salary>";
			echo "<phonenumber></phonenumber><email></email>";
			echo "<password></password></user></users>";
		}
		
		/* echo "<users><user><name>zhangsan</name><age>20</age><salary>3333</salary><phonenumber>314234</phonenumber>";
		 echo "<email>faddsfdsa</email><password>324324</password></user></users>"; */
	} catch (Exception $e){
		throw $e;
	}
}

function fnAddUser() {
	try{
		// 以POST方式取上送数据
		$rec['name'] = $_POST["username"];
		$rec['age'] = $_POST["age"];
		$rec['salary'] = $_POST["salary"];
		$rec['phonenumber'] = $_POST["phonenumber"];
		$rec['email'] = $_POST["email"];
		$rec['password'] = $_POST["password"];
	
		$nametableManage = new NametableManage();
		
		$nametableManage->beginTransaction();
		$nametableManage->addRecord($rec);
		$nametableManage->commit();
		
	} catch (Exception $e){
		throw $e;
	}
}

function fnDeleteUser() {
	try {
		if ($_SERVER['REQUEST_METHOD']=="POST") {
			// 以POST方式取上送数据
			$name = $_POST["username"];
		} else {
			$name = $_GET["username"];
			$name = urldecode($name);	// 进行url解码，否则中文为乱码
		}
		
		$nametableManage = new NametableManage();
		
		$nametableManage->beginTransaction();
		$nametableManage->deleteByName($name);
		$nametableManage->commit();
	} catch (Exception $e){
		throw $e;
	}
}

function fnModifyUser() {
	try{
		// 以POST方式取上送数据
		$name = $_POST["username"];
		$rec['age'] = $_POST["age"];
		$rec['salary'] = $_POST["salary"];
		$rec['phonenumber'] = $_POST["phonenumber"];
		$rec['email'] = $_POST["email"];
		$rec['password'] = $_POST["password"];
	
		$nametableManage = new NametableManage();
	
		$nametableManage->beginTransaction();
		$nametableManage->modifyRecord('name', $name, $rec);
		$nametableManage->commit();
	
	} catch (Exception $e){
		throw $e;
	}
}

function fnGetPagingDataXML() {
	try{
		$nametableManage = new NametableManage();
		$pageNow = $_POST['pageNow'];
		$listRows = $_POST['listRows'];
		$data = $nametableManage->getPagingData($pageNow,  $listRows);

/* 		if (empty($data))
			return ''; */
		
		$xml = "<users>";
		foreach ($data as $rec) {
			$xml .= "<user>";
			$xml .= "<name>".$rec['name']."</name><age>".$rec['age']."</age><salary>".$rec['salary']."</salary><phonenumber>".$rec['phonenumber']."</phonenumber>";
			$xml .= "<email>".$rec['email']."</email><password>".$rec['password']."</password>";
			
			$xml .= "</user>";
			}
		$xml .= "</users>";

		echo $xml;
	} catch (Exception $e){
		throw $e;
	}
}

function fnGetPagingToolBar() {
	$totalRows = $_POST['totalRows'];
	$pageNow = $_POST['pageNow'];
	$listRows = $_POST['listRows'];
	
	// 初始化导航条对象
	$params = array(
			'total_rows'		=>$totalRows,		// 总行数
			'method'    		=>'ajax',			// 导航方式：Ajax
			'ajax_func_name'	=>'getPagingData',	// ajax的调用方法 getPagingData(当前页, 参数);
			'now_page'  		=>$pageNow,
			#'parameter'			=>$listRows,
			'parameter'			=>"$listRows,$totalRows",
			'list_rows' 		=>$listRows,				// 每页显示的行数，默认为15
	);
	$page = new PagingToolbar($params);
	
	echo $page->show(1);
}


