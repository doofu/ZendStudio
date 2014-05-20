<?php
include_once 'pdo/TableDisplayInPage.class.php';

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo '<html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
echo '<link rel="stylesheet" type="text/css" href="../css/common.css" />';
echo '</head>';
echo '<body><div class=div1>';
echo '<H2>演示将以上两个类进行整合，实现查询数据库表的分页<br>';
echo '目录：php、php/pdo<br/>';
echo '文件：tableDisplayInPage.php、CoreLibPage.class.php、TableDisplayInPage.class.php<br/><br/></H2>';

###处理get方式分页的情况###
# method 处理环境 设置为 get
# parameter 为静态页面参数  xxx.com/20-0-0-0-40.html
# ?问号的位置会自动替换为去向页码
# now_page 当前页面(静态页面获取不到当前页面所以只有你传入)
$db_driver = 'mysql';
$db_host = 'localhost';
$db_user = 'root';
$db_password = 'root';
$db_name = 'test';
$db_table = 'nametable';
$db_table_field = array('name','age','salary','phonenumber','email','password');

$params = array(
	'method'    =>'get', #(必须)
	'parameter' =>'/PhpWeb/php/TableDisplayInPage.Demo.php',  #(必须)
	#'now_page'  =>4,  #(可选)
	'list_rows' =>3, #(可选) 默认为15
);

$page = new TableDisplayInPage();

$page->create_page(
	$db_driver,
	$db_host,
	$db_user,
	$db_password,
	$db_name,
	$db_table,
	$db_table_field,
	$params
);

// 显示表头
echo '<table>';
for($i=0;$i<count($db_table_field);$i++){
	echo '<td>';
	echo $db_table_field[$i];
	echo '</td>';
}

// 取当前页的表数据
unset($page_data);
$page_data = $page->getData();

// 显示当前页的表体
for($i=0; $i < count($page_data); $i++) {			// 行
	echo '<tr>';
	for($j=0;$j<count($db_table_field);$j++){		// 列
		echo '<td>';
		echo $page_data[$i][$j];
		echo '</td>';
	}
	echo '</tr>';
}
echo '</table>';

// 显示分页
echo '<div id="page">';
echo  $page->getPage()->show(1);
echo '</div>';
#<a href="xxx.com/20-0-0-0-40.html?p=2">2</a>


echo '<div class="div1"><br/><br/>';
echo '<a href="../index.html">首页</a></div>';

echo '</div></body>';