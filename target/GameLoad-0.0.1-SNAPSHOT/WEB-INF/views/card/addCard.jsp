<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>游币比例管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/My97DatePicker/WdatePicker.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<script src="../../js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">
<script
	src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>
<script type="text/javascript" src="../../myjs/myAddCard.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<link href="../../css/doubleDate.css" rel="stylesheet" type="text/css" />

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

a, img {
	border: 0;
}

body {
	font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";
}

.iptgroup {
	width: 620px;
	height: 60px;
	margin: 20px auto 0 auto;
}

.iptgroup li {
	float: left;
	height: 30px;
	line-height: 30px;
	padding: 5px;
}

.iptgroup li .ipticon {
	background: url(blue/date_icon.gif) 98% 50% no-repeat;
	border: 1px #CFCFCF solid;
	padding: 3px;
}
</style>
</head>
<body>
	<div>
		<div id="container">
			<div class="page-header ">
				<h2>密保卡生成</h2>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-4">
					<div class="modal-body">
						<form class="form-horizontal">
							<table class="table table-bordered table-hover table-condensed  ">
								<tbody>
									<tr>
										<td>数量(张)</td>
										<td><input type="text" name="count" placeholder="必须输入整数"
										id="count"	onkeyup="checkInt(this)" /></td>
									</tr>
									<tr>
										<td>选择需要生成卡的省份</td>
										<td><select class="selectpicker bla bla bli"
											multiple="multiple" name="proIds" id="AllProvinces">
										</select></td>
									</tr>
									<tr>
										<td>金额(游币数量)</td>
										<td><input type="text" name="amount" id="amount" /></td>
									</tr>
									<tr class="iptgroup">
										<td>有效期开始时间<input type="text" class="doubledate ipticon"
											name="startTime" id="startTime" /></td>
										<td>有效期结束时间<input type="text" class="doubledate ipticon"
											name="endTime" id="endTime" /></td>
									</tr>
								</tbody>
							</table>


							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="button" class="btn btn-primary" id="submitBtn">生成密保卡</button>

									<button class="btn btn-warning">返回上一页</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
