<?php
include_once 'pdo/PdoPage.class.php';

///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////example///////////////////////////////////////
/*step1: 建立分页对象
 *new pdo_page;
*/
$page = new pdo_page;

/*step2: 设置分页参数
 *
*⑴设置数据库信息
*pdo_page->set($db_driver,
		*        $db_host,
		*        $db_user,
		*        $db_password,
		*        $db_name,
		*        $db_table,
		*        $db_table_field,
		*        $page_size,
		*        $link_num);
*参数说明：
*$db_driver--db驱动
*$db_host--dbms地址
*$db_user--dbms帐户
*$db_password--dbms密码
*$db_name--db名称
*$db_table--表名
*$db_table_field--字段数组，将要显示的字段名称写入该数组
*
*⑵设置分页信息
*$page_size--每页显示记录的数目
*$link_num--显示翻页链接的数目
*/
$db_driver = 'mysql';
$db_host = 'localhost';
$db_user = 'root';
$db_password = 'root';
$db_name = 'test';
$db_table = 'nametable';
$db_table_field = array('name','age','salary','phonenumber','email','password');
$page_size = 5;
$link_num = 3;

$page->set($db_driver,
		$db_host,
		$db_user,
		$db_password,
		$db_name,
		$db_table,
		$db_table_field,
		$page_size,
		$link_num);

/*step3: 生成分页
 *pdo_page->create_page();
*/
$page->create_page();

/*step4: 获取分页数据
 *pdo_page->get();
*page_data[0]: 表中记录的总数
*page_data[1]: 总页数
*page_data[2]: 当前页码
*page_data[3]: pagestring,'首页'、'上一页'、'下一页'、'尾页'－－链接样式
*page_data[4]: page_link,[1]、[2]、[3]－－链接样式
*page_data[5]: page_select,表单翻页样式
*page_data[6]: page_jump,跳转的指定页
*page_data[7]: page_page_data,数据库中的数据，
*二维数组(page_data[7][$i][$j]--行$i、列$j)
*/
$page_data = $page->get();

/*step5: 输出页码跳转信息
 *page_data[0]--page_data[6]
*翻页链接显示输出,可根据具体情况选择使用
*/
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo '<html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
echo '<link rel="stylesheet" type="text/css" href="../css/common.css" />';
echo '</head>';
echo '<body><div class=div1>';
echo '<H2>演示PDO<br>';
echo '目录：php、php/pdo<br/>';
echo '文件：pdoPage.Demo.php、PdoPage.class.php<br/><br/></H2>';

echo '共有'.$page_data[0].'条记录';    //表中记录的总数
echo '&nbsp;';
echo '第'.$page_data[2].'页/';
echo '共'.$page_data[1].'页';        //总页数
echo '<br>';

echo $page_data[3];            //'首页'、'上一页'、
//'下一页'、'尾页'
//－－链接样式
echo '<br>';

echo $page_data[4];            //[1]、[2]、[3]
//－－链接样式

echo $page_data[5];    //表单翻页样式
echo $page_data[6];    //跳转的指定页
echo '<br>';

/*step6：输出当前页数据
 *page_data[7]
*数据的输出，输出方式可根据具体情况制定
*$i:记录数(行)，$j:字段(列)
*/

echo '<table>';
for($i=0;$i<count($db_table_field);$i++){
	echo '<td>';
	echo $db_table_field[$i];
	echo '</td>';
}

//for($i=0;$i<$page_size;$i++){
for($i=0;$i<count($page_data[7]);$i++){
	echo '<tr>';
	for($j=0;$j<count($db_table_field);$j++){
		echo '<td>';
		echo $page_data[7][$i][$j];
		echo '</td>';
	}
	echo '</tr>';
}
echo '</table><br/><br/>';
echo '<a href="../index.html">首页</a>';

echo '</div></body>';
