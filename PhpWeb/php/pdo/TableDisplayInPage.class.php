<?php
include_once 'CoreLibPage.class.php';
/** 文件: pdo_page.class.php
 ** 版本: 3.0
 ** 功能: 使用php数据对象(pdo)实现数据的分页显示
 ** 运行环境:
 **        ① php版本--5.1以上(包括5.1)
 **        ② 打开pdo扩展(默认为关闭)
 **        ③ 打开与所使用db相应对应的pdo扩展(默认为关闭)
 **
 ** DISCLAIMER:
 ** Distributed "as is", fell free to modify any part of this code.
 ** You can use this for any projects you want, commercial or not.
 ** It would be very kind to email me any suggestions you have or bugs you 
 ** might find.
 **
 ** 完成时间: 2006-10-18
 ** Power By 刘胜蛟 (Email: liushengjiao@163.com/liushengjiao@gmail.com)
 **/
class TableDisplayInPage extends CoreLibPage {
/* 变量定义部分 begin */

    /* pdo数据源 */
    private $db_driver = '';		// db驱动
    private $db_host = '';			// dbms地址
    private $db_user = '';			// dbms帐户
    private $db_password = '';		// dbms密码
    private $db_char = 'utf8';		// db使用的字符集
    private $db_name = '';        	// db名称
    private $db_table = '';			// 表名
    private $db_table_field = '';	// 要显示的数据库中的字段
    private $db = '';				// 数据库连接句柄，PDO
    private $records = 0;			// 数据库表的记录数

    /* 获取的数据 */
    private $page_data = '';    	// 从数据库中获取的数据，
                    				// $page_data为二维数组接收
    
    private $page;					// CoreLibPage对象

/* 变量定义部分 end */

/* 函数定义(类方法) begin */

    function __construct(){

    }
    
    /* 建立分页 begin */
    public function create_page(
    // 数据库访问参数
    		$db_driver,
            $db_host,
            $db_user,
            $db_password,
            $db_name,
            $db_table,
            $db_table_field,
	// 分页参数
    		$params) {
    	/* db参数设置 begin */
    	$this->setDbTable($db_driver, $db_host, $db_user, $db_password, $db_name, $db_table, $db_table_field);
    	/* db参数设置 end */
    	   
    	$this->db_conn();			// 连接数据库
    	$this->get_records();		// 得到该数据库表的总记录数


    	/* 分页参数设置 begin */
    	$params['total_rows'] = $this->records;
    	$this->page = new CoreLibPage($params);

		$this->fetch_data();
    	
    	/* 分页参数设置 end */
    }
    /* 建立分页 end */

    public function getPage() {
    	return $this->page;
    }
    
    public function getData() {
    	return $this->page_data;
    }
    
    /* 设置访问数据库表的基本信息 begin */
    private function setDBTable(
    		$db_driver,
            $db_host,
            $db_user,
            $db_password,
            $db_name,
            $db_table,
            $db_table_field){
        /* db参数设置 begin */
        $this->db_driver = $db_driver;        		//db驱动
        $this->db_host = $db_host;        			//dbms地址
        $this->db_user = $db_user;        			//dbms帐户
        $this->db_password = $db_password;    		//dbms密码
        $this->db_name = $db_name;        			//db名称
        $this->db_table = $db_table;        		//表名
        $this->db_table_field = $db_table_field;	//字段数组，
                           							//将要显示的字段名称写入该数组
    }
    /* 设置访问数据库表的基本信息 end*/
    
    /* 连接数据库 begin */
    private function db_conn(){
        try{
            $this->db = new pdo(
                "$this->db_driver:dbname=$this->db_name;
                host=$this->db_host;charset=$this->db_char",
                "$this->db_user",
                "$this->db_password"
            );
            return $this->db;
        } catch(pdoexception $e) {
            die($e->getmessage());
        }
    }
    /* 连接数据库 end */

    /* 获取db中记录的数目 begin */
    private function get_records(){
        $sql = "select count(*) from $this->db_table";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();
        while ($f = $stmt->fetch()) {
            $this->records = $f[0];
        }
    }
    /* 获取db中记录的数目 end */

    /* 获取数据 begin */
    private function fetch_data(){
        if ($this->records) {
        	$start_row = ($this->page->now_page-1) * $this->page->list_rows;
        	$end_row = $this->page->list_rows;
            $sql = "select * from $this->db_table limit $start_row, $end_row"; // now_page、list_rows由CoreLibPage继承而来
            $stmt = $this->db->prepare($sql);
            $stmt->execute();
            $field_count = count($this->db_table_field);
            
            /* 获取数据 begin */
            $j = 0;
            while($f = $stmt->fetch()){
                for($i = 0;$i < $field_count;$i++){
                    $field_name = $this->db_table_field[$i];
                    $field_value[$j][$i] = $f["$field_name"];
                }
                $j++;
            }
            /* 获取数据 end */

            $this->page_data = $field_value;
        }
    }
    /* 获取数据 end */
    
    function __destruct(){
    }

/* 函数定义(类方法) end */

}
?>
