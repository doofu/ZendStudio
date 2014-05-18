<?php
include_once 'pdo/CoreLibPage.Class.php';

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo '<html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
echo '<link rel="stylesheet" type="text/css" href="../css/common.css" />';
echo '</head>';
echo '<body><div class=div1>';

###处理html静态化页面分页的情况###
# method 处理环境 设置为 html
# parameter 为静态页面参数  xxx.com/20-0-0-0-40-?.html 注意问号
# ?问号的位置会自动替换为去向页码
# now_page 当前页面(静态页面获取不到当前页面所以只有你传入)

$params = array(
            'total_rows'=>100, #(必须)
            'method'    =>'html', #(必须)
            'parameter' =>'/PhpWeb/php/CoreLibPage.Demo.php?p=*',  #(必须)
            'now_page'  =>$_GET['p'],  #(必须)
            'list_rows' =>10, #(可选) 默认为15
);
$page = new CoreLibPage($params);
echo  $page->show(1);
#<a href="xxx.com/20-0-0-0-40-2.html">2</a>

echo '<br/><br/>';

###处理ajax分页的情况###
# method 处理环境 设置为 ajax
# ajax_func_name ajax分页跳转页面的javascript方法
# parameter    ajax_func_name后面的附带参数 默认为空
# now_page 不到当前页面所以只有你传入
$params = array(
            'total_rows'=>100,
            'method'    =>'ajax',
            'ajax_func_name' =>'goToPage',
            'now_page'  =>1,
            #'parameter' =>"'jiong','username'",
);
$page = new CoreLibPage($params);
echo  $page->show(3);       
#<a href="javascript:void(0)" onclick="goToPage('7')">7</a>
#添加了parameter<a href="javascript:void(0)" onclick="goToPage('6','jiong','username')">6</a>

echo '<br/><br/>';
echo '<a href="../index.html">首页</a>';

echo '</div></body>';