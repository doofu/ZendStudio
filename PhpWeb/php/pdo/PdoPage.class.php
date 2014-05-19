<?php
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
class pdo_page{
/* 变量定义部分 begin */

    /* pdo数据源 */
    private $db_driver = '';
    private $db_host = '';
    private $db_user = '';
    private $db_password = '';
    private $db_char = 'utf8';
    private $db_name = '';
    private $db_table = '';
    private $db_table_field = '';    //要显示的数据库中的字段
    private $db = '';        //数据库连接句柄

    /* 分页显示参数设置 */
    private $page_size = 0;        //每页显示的记录数目
    private $link_num = 0;        //显示页码链接的数目

    private $page = 1;        //页码
    private $records = 0;        //表中记录总数
    private $page_count = 0;    //总页数
    private $pagestring = '';    //前后分页链接字符串
    private $page_link = '';    //页码链接字符串
    private $page_select = '';    //表单跳转页字符串
    private $page_jump = '';    //text筐输入页码跳转

    /* 获取的数据 */
    private $page_data = '';    //从数据库中获取的数据，
                    //$page_data为二维数组接收

/* 变量定义部分 end */

/* 函数定义(类方法) begin */

    function __construct(){

    }

    /* 设置分页信息 begin */
    public function set($db_driver,
            $db_host,
            $db_user,
            $db_password,
            $db_name,
            $db_table,
            $db_table_field,
            $page_size,
            $link_num){
        /* db参数设置 begin */
        $this->db_driver = $db_driver;        //db驱动
        $this->db_host = $db_host;        //dbms地址
        $this->db_user = $db_user;        //dbms帐户
        $this->db_password = $db_password;    //dbms密码
        $this->db_name = $db_name;        //db名称
        $this->db_table = $db_table;        //表名
        $this->db_table_field = $db_table_field;//字段数组，
                            //将要显示的字段名称
                            //写入该数组
        /* db参数设置 end */

        /* 分页参数设置 begin */
        $this->page_size = $page_size;        //每页显示记录的数目
        $this->link_num = $link_num;        //显示翻页链接的数目
        /* 分页参数设置 end */
    }
    /* 设置分页信息 end*/
    
    /* 获取分页链接数据 begin */
    public function get(){
        $page_data[0] = $this->records;        //表中记录的总数
        $page_data[1] = $this->page_count;    //总页数
        $page_data[2] = $this->page;        //当前页码
        $page_data[3] = $this->pagestring;    //'首页'、'上一页'、
                            //'下一页'、//'尾页'
                            //－－链接样式

        $page_data[4] = $this->page_link;    //[1]、[2]、[3]
                            //－－链接样式

        $page_data[5] = $this->page_select;    //表单翻页样式
        $page_data[6] = $this->page_jump;    //跳转的指定页样式
        $page_data[7] = $this->page_data;    //数据库中的数据，
                            //$page_data[7]:二维数组
                            //(page_data[7][$i][$j])
        return $page_data;
    }
    /* 获取分页链接数据 end */

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

    /* 页码处理 begin */
    private function set_page(){
        if (isset($_REQUEST['page'])) {
            $this->page = intval($_REQUEST['page']);
        } else {
            $this->page = 1;
        }
    }
    /* 页码处理 end */

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

    /* 建立翻页链接字符串 begin */
    private function page_link(){
        /* 前后页链接字符串 begin */
        if ($this->page == 1) {
            //首页,无链接
            $this->pagestring .='首页|上一页';
        } else {
            //不为首页，有链接
            $this->pagestring .='<a href=?page=1>首页</a>|
            <a href=?page='.($this->page-1).'>上一页</a>';
            
        }
        if ($this->page==$this->page_count || $this->page_count==0) {
            //末页,无链接
            $this->pagestring .='下一页|尾页';
        } else {
            //非末页，有链接
            $this->pagestring .='<a href=?page='.($this->page+1).'>
            下一页</a>|<a href=?page='.$this->page_count.'>尾页</a>';
        }
        /* 前后页链接字符串 end */

        /* 页码链接字符串 begin */
        for ($i=$this->page;$i<=$this->page+$this->link_num-1;$i++) {
            if ($i<=$this->page_count) {
                $this->page_link .= '<a href=?page='.$i.'>
                ['.$i.']</a> ';
                $last_page = $i;
            }
        }
        if ($i-$this->link_num-1 < 1) {
                $front_page = 1;
        } else {
                $front_page = $i - $this->link_num - 1;
        }
        if ($last_page == $this->page_count) {
                $back_page = $last_page;
        } else {
                $back_page = $last_page+1;
        }
        $this->page_link = '<a href=?page='.$front_page.'><<</a>'.' '.
            $this->page_link.' '.'<a href=?page='.$back_page.'>>>
            </a>';
        /* 页码链接字符串 end */

        /* select页码 begin */
        $this->page_select = "<form action='' method=post>
            <select name=page>";
        for ($i = 1;$i <= $this->page_count;$i++) {
            if ($i == $this->page) {
                $this->page_select .= "<option selected>$i
                </option>";
            } else {
                $this->page_select .= "<option>$i</option>";
            }
        }
        $this->page_select .= "</select><input type=submit value=go>
            </form>";
        /* select页码 end */

        /* input跳转表单begin */
        $this->page_jump = "<form action='' method=post><input 
            type=text size=1 name=page value=$this->page><input 
            type=submit value=go>";
        /* input跳转表单end */

    }
    /* 建立翻页链接字符串 end */

    /* 获取数据 begin */
    private function fetch_data(){
        if ($this->records) {
            $sql = "select * from $this->db_table limit ".($this->page-1)*$this->page_size.",$this->page_size";
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

    /* 建立分页 begin */
    public function create_page(){
        $this->db_conn();
        $this->set_page();
        $this->get_records();
        $this->page_count = ceil($this->records/$this->page_size);
        $this->page_link();
        $this->fetch_data();
    }
    /* 建立分页 end */

    function __destruct(){

    }
/* 函数定义(类方法) end */
}

?>
