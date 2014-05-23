<?php
require_once '../model/PagingToolbar.class.php';
require_once '../model/NametableManage.class.php';

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo '<html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
echo '<link rel="stylesheet" type="text/css" href="../css/common.css" />';
echo '<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>';
echo '<script type="text/javascript" src="../js/phpPagingDisplayJQuery.js"></script>';
echo '</head>';
echo '<body><div class=div1>';
echo '<H2>演示数据库表分页演示 JQuery<br>';
echo '目录：view、model<br/>';
echo '文件：[V]phpPagingDisplay.php、[M]PagingToolbar.class.php、[M]PdoHelper.class.php<br/><br/></H2>';

echo '<div id="page">';

// 初始化数据对象
$nametableManage = new NametableManage();
$totalRows = $nametableManage->getTotalRows();	// 得到数据总条数

// 初始化导航条对象
$params = array(
	'total_rows'		=>$totalRows,		// 总行数
	'method'    		=>'ajax',			// 导航方式：Ajax
	'ajax_func_name'	=>'getPagingData',	// ajax的调用方法 getPagingData(当前页, 参数);
	'list_rows' 		=>10,				// 每页显示的行数，默认为15
);
$page = new PagingToolbar($params);

// 取当前页
$pageNow = isset($_GET['p']) ? $_GET['p'] : 1;

// 开始按表格显示数据
// 显示表头
$db_table_field = array('姓名', '年龄', '薪水', '电话', '电子邮件', '密码');
echo '<table>';
for($i=0;$i<count($db_table_field);$i++){
	echo '<th>';
	echo $db_table_field[$i];
	echo '</th>';
}

// 取当前页的表数据
$pagingData = $nametableManage->getPagingData(($pageNow -1) * $params['list_rows'], $params['list_rows']);

// 显示当前页的表体
for($i=0; $i < count($pagingData); $i++) {			// 行
	echo '<tr>';
	for($j=0;$j<count($db_table_field);$j++){		// 列
		echo '<td>';
#		echo $pagingData[$i][$j];
		echo '<span id='.'"data'.$i.'_'.$j.'"></span></td>';
	}
	echo '</tr>';
}
echo '</table>';

// 以方式一显示导航条
echo  $page->show(1);

echo '</div>';
echo '<div class=.div1><br/><br/></div>';
echo '<div class=.div1><br/><br/></div>';
echo '<a href="../index.html">首页</a>';

echo '</div></body>';