<?php

require_once '../model/NametableManage.class.php';

// 每页显示的行数
$listRows = 10;
// 得到数据总条数
$nametableManage = new NametableManage();
$totalRows = $nametableManage->getTotalRows();

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo '<html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
echo '<link rel="stylesheet" type="text/css" href="../css/common.css" />';
echo '<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>';
echo '<script type="text/javascript" src="../js/phpPagingDisplayJQuery.js"></script>';
echo '</head>';
echo '<body onload="afterLoad(1, '.$listRows.','.$totalRows.');"><div class=div1>';
echo '<H2>演示数据库表分页演示 JQuery<br>';
echo '目录：view、control、model<br/>';
echo '文件：[V]phpPagingDisplayJQuery.php、[V]phpPagingDisplayJQuery.js、[C]controler.php、[M]PagingToolbar.class.php、[M]PdoHelper.class.php<br/><br/></H2>';

// 开始按表格显示数据
echo '<table>';

// 显示表头
$db_table_field = array('姓名', '年龄', '薪水', '电话', '电子邮件', '密码');
echo '<th width=25%>'.$db_table_field[0].'</th>';
echo '<th width=10%>'.$db_table_field[1].'</th>';
echo '<th width=10%>'.$db_table_field[2].'</th>';
echo '<th width=20%>'.$db_table_field[3].'</th>';
echo '<th width=20%>'.$db_table_field[4].'</th>';
echo '<th>'.$db_table_field[5].'</th>';

// 显示当前页的表体
for($i=0; $i < $listRows; $i++) {			// 行
	echo '<tr>';
	for($j=0;$j<count($db_table_field);$j++){		// 列
		echo '<td>';
		echo '<span id='.'"data'.$i.'_'.$j.'"></span></td>';
	}
	echo '</tr>';
}
echo '</table>';
echo '<div id="pagingToolbar">';
// 此处由Ajax显示分页导航条
echo '</div>';

echo '<div><br/><br/></div>';
echo '<a href="../index.html">首页</a>';

echo '</div></body>';