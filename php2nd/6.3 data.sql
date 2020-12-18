#1、创建数据库 itcast
create database `itcast`;     
use itcast;
#2、创建员工信息表 emp_info
CREATE TABLE `emp_info` (
  `e_id` int unsigned PRIMARY KEY AUTO_INCREMENT,
  `e_name` varchar(20) NOT NULL,
  `e_dept` varchar(20) NOT NULL,
  `date_of_birth` timestamp NOT NULL,
  `date_of_entry` timestamp NOT NULL
)CHARSET=utf8;

#3、向员工信息表添加数据
insert into `emp_info` values
(1, '张三', '市场部', '2008-4-3 13:33:00', '2014-9-22 17:53:00'),
(2, '李四', '开发部', '2008-4-3 13:33:00', '2013-10-24 17:53:00'),
(3, '王五', '媒体部', '2008-4-3 13:33:00', '2015-4-21 13:33:00'),
(4, '赵六', '销售部', '2008-4-3 13:33:00', '2015-3-20 17:54:00'),
(5, '黄毅', '开发部', '2008-4-3 13:33:00', '2015-3-25 19:57:00'),
(6, '毅炜', '市场部', '2008-4-3 13:33:00', '2015-3-10 15:55:00'),
(7, '郭嘉', '销售部', '2008-4-3 13:33:00', '2015-3-27 14:10:00');