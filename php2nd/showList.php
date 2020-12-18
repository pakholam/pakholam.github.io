<?php
header('content-type:text/html;charset=utf-8');
$link=mysql_connect('localhost','root','123456');
if(!$link){
	die('连接数据库失败！'.mysql_error());
}
mysql_query('set names utf8');
mysql_query('use itcast');
$sql = 'select * from `emp_info`';
$res = mysql_query($sql,$link);
if(!$res) die(mysql_error());
$emp_info = array();
while($row = mysql_fetch_assoc($res)){
	$emp_info[] = $row;
}
define('APP','itcast');
require './list_html.php';
?>