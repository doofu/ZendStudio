<?php
require_once 'PdoHelper.class.php';

class NametableManage {
	private $pdoHelper;
	
	public function __construct() {
		$this->pdoHelper = new PdoHelper('mysql', 'localhost', 'test', 'root', 'root');
	}
	
	public function beginTransaction() {
		$this->pdoHelper->beginTransaction();
	}
	
	public function commit() {
		$this->pdoHelper->commit();
	}
	
	public function rollBack() {
		$this->pdoHelper->rollBack();
	}
	
	public function queryByName($name) {
		try {
			$sql = "select * from nametable where name='".$name."'";
			return $this->pdoHelper->execDql($sql);
		} catch (Exception $e) {
			throw $e;
		}
	}
}