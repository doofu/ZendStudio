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
	
	public function getTotalRows() {
		return $this->pdoHelper->getTotalRows('nametable');
	}
	
	public function getPagingData($pageNow, $rows) {
		return $this->pdoHelper->getPagingData('nametable', ($pageNow - 1) * $rows, $rows);
	}
	
	public function queryByName($name) {
		try {
			return $this->pdoHelper->queryByKey('nametable', 'name', $name);
		} catch (Exception $e) {
			throw $e;
		}
	}
	
	public function addRecord($rec) {
		try {
			$ret = $this->pdoHelper->addRecord("nametable", $rec);
			
			echo ($ret > 0) ? $rec['name'].'增加成功！' : $rec['name'].'增加失败!';
		} catch (Exception $e) {
			echo $rec['name'].'增加失败！！';
		}
	}
	
	public function deleteByName($name) {
		try {
			$ret = $this->pdoHelper->deleteByKey('nametable', 'name', $name);
			echo ($ret > 0) ? $name.'删除成功！' : $name.'删除失败!';
		} catch (Exception $e) {
			echo $name.'删除失败！！';
		}
	}
	
	public function modifyRecord($keyName, $keyValue, $rec) {
		try {
			$ret = $this->pdoHelper->modifyRecord("nametable", $keyName, $keyValue, $rec);
			
			echo $keyValue.'修改成功！';
		} catch (Exception $e) {
			echo $keyValue.'修改失败！！';
		}
	}
}