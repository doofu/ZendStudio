<?php
require_once 'pdo/PdoHelper.class.php';

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo '<html>';
echo '<head>';
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
echo '<link rel="stylesheet" type="text/css" href="../css/common.css" />';
echo '</head>';
echo '<body><div class=div1>';
echo '<a href="../index.html">首页</a><br/><br/>';

try {
	$pdoHelper = new PdoHelper('mysql', 'localhost', 'test', 'root', 'root');
	
	/* 增删改 */
	$pdoHelper->beginTransaction();
	
	/* for ($i = 0; $i < 100; $i++) {
	$sql="INSERT INTO nametable (name, age, salary, phonenumber, email, password) VALUES ('add$i', $i, ".(5678.91+$i).", '13300056789', 'new@163.com', '123345')";
	
	//$sql='delete from nametable where name="newqwe"';
	$b = $pdoHelper->execDml($sql);
	} */
	
	$sql="INSERT INTO nametable (name, age, salary, phonenumber, email, password) VALUES ('add', 20, 5678.88, '13300056789', 'add@163.com', '123345')";
	//$sql='delete from nametable where name="newqwe"';
	$sql = "update nametable set age=52, email='add52@163.com' where name='add1323'";
	$b = $pdoHelper->execDml($sql);
	if ($b > 0) {
		echo "数据库操作成功！<br/>";
		$pdoHelper->commit();
	} else if ($b == 0) {
		echo "没有可操作的记录！<br/>";
		$pdoHelper->rollBack();
	}
	
	/* nametable的总记录数 */
	echo "nametable的中记录数为：".$pdoHelper->getRecordsCount('nametable')."<br/>";


	/* 查询数据库表 */
	$data = $pdoHelper->execDql('select * from nametable');
	
	echo "查询返回结果的记录数为: ".count($data)."<br/>";
	
	$j=1;
	echo "data:  <br/>";
	foreach ($data as $rec) {
		echo $j++.':';
	
		print_r($rec);
		echo "<br/>";
	}

} catch (pdoexception $e) {
	die(iconv('GB2312', 'UTF-8', $e->getmessage())); 	// 将出错信息有GBK转为UTF8
} catch (Exception $e) {
	echo "数据库操作出错！\n";
	echo iconv('GB2312', 'UTF-8', $e->getmessage());
	
	$pdoHelper->rollBack();
}

echo '</div></body></html>';
