<?php if(!defined('APP')) die('error!');?>
<!doctype html>
<html>
 <head>
  <meta charset="utf-8">
  <title>员工信息列表</title>
  <style>
	.box{margin:20px;}
	.box .title{font-size:22px;font-weight:bold;text-align:center;}
	.box table{width:100%;margin-top:15px;border-collapse:collapse;font-size:12px;border:1px solid #B5D6E6;min-width:460px;}
	.box table th,.box table td{height:20px;border:1px solid #B5D6E6;}
	.box table th{background-color:#E8F6FC;font-weight:normal;}
	.box table td{text-align:center;}
  </style>
</head>
<body>
	<div class="box">
		<div class="title">员工信息列表</div>
		<table border="1">
			<tr>
				<th width="5%">ID</th><th>姓名</th><th>所属部门</th><th>出生日期</th><th>入职时间</th><th width="25%">相关操作</th>
			</tr>
			<?php  if(!empty($emp_info)) { ?>
			<?php foreach($emp_info as $row){ ?>
			<tr>
				 <td><?php echo $row['e_id']; ?></td>
				 <td><?php echo $row['e_name']; ?></td>
				 <td><?php echo $row['e_dept']; ?></td>
				 <td><?php echo $row['date_of_birth']; ?></td>
				 <td><?php echo $row['date_of_entry']; ?></td>
				 <td><div align="center"><span><img src="images/edt.gif" width="16" height="16" />编辑&nbsp; &nbsp;<img src="images/del.gif" width="16" height="16" />删除</span></div></td>
			</tr>
			<?php } ?>
			<?php  }else{   ?>
					<tr><td colspan="6">暂无员工数据！</td></tr>
			<?php } ?>
		</table>
	</div>
</body>
</html>
