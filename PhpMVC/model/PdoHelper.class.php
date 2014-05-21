<?php
/**
 * 数据库操作的工具类（使用PDO）
 * 2014年5月20日
 */
class PdoHelper {
	private $pdo;					// PDO对象
	
	private $dbDriver;
	private $dbHost;
	private $dbChar;
	private $dbName;
	private $dbUser;
	private $dbPassword;

	/**
	 * 构造函数：完成数据连接
	 * @param unknown $dbDriver		// 数据库驱动
	 * @param unknown $dbHost		// 数据库主机地址
	 * @param unknown $dbName		// 数据库名
	 * @param unknown $dbUser		// 数据库用户名称
	 * @param unknown $dbPassword	// 数据库用户密码
	 * @param string $dbChar		// 数据库使用的字符集
	 */
	public function __construct(
			$dbDriver,
			$dbHost,
			$dbName,
			$dbUser,
			$dbPassword,
			$dbChar = "utf8") {
		$this->dbDriver = $dbDriver;
		$this->dbHost = $dbHost;
		$this->dbName = $dbName;
		$this->dbUser = $dbUser;
		$this->dbPassword = $dbPassword;
		$this->dbChar = $dbChar;
	
		$this->connectDb();
	}
	
	/* 连接数据库 */
	private function connectDB(){
		try{
			$this->pdo = new PDO(
					"$this->dbDriver:dbname=$this->dbName;host=$this->dbHost;charset=$this->dbChar",
					"$this->dbUser",
					"$this->dbPassword"
			);
			
			$this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch(pdoexception $e) {
			throw $e;
//			die($e->getmessage());
		}
	}
	
	/**
	 * 事务开始
	 */
	public function beginTransaction() {
		$this->pdo->beginTransaction();
	}
	
	/**
	 * 事务提交
	 */
	public function commit() {
		$this->pdo->commit();
	}
	
	/**
	 * 事务回滚
	 */
	public function rollBack() {
		if ($this->pdo->inTransaction())
			$this->pdo->rollBack();
	}
	
	public function getRecordsCount($tableName) {
		try {
			$sql = "select count(*) from $tableName";
			$res = $this->execDql($sql);
			if ($res)
				return $res[0][0];
			else
				return 0;
		} catch (Exception $e) {
			throw($e);
		}
	}
	
	/**
	 *  执行数据库查询语句
	 *  返回：二维数组，存放有查询到的数据；失败抛出异常，有调用者处理
	 */
	public function execDql($sql) {
		try {
			$stmt = $this->pdo->prepare($sql);
			$stmt->execute();
	
			/* 获取数据 begin */
			return $stmt->fetchAll();
		} catch (Exception $e) {
			throw($e);
		}
	}
	
	/**
	 * 执行数据库增删改操作
	 * 返回：整型变量，成功为受影响的行数；失败抛出异常，有调用者处理
	 */
	public function execDml($sql) {
		try {
			$stmt = $this->pdo->prepare($sql);
			$stmt->execute();
			return $stmt->rowCount();

		} catch (Exception $e) {
			throw($e);
		}
	}

	/**
	 * 析构函数：pdo对象是否要主动释放？
	 */
	public function __destruct() {
		unset($this->pdo);
	}
}

?>