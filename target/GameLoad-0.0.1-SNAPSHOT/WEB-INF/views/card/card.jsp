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
<script type="text/javascript" src="../../js/bootstrap-select.js"></script>
<script type="text/javascript" src="../../myjs/myCard.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../css/bootstrap-select.css">

<!-- 3.0 -->

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<script src="../../js/bootstrap.min.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>

</head>
<body>
	<div>
		<div id="container">
			<div class="page-header ">
				<h2>密保卡管理</h2>
			</div>
			<form action="">
				<div class="row">
					<div class="col-xs-4 col-sm-12 ">
						<div class="row">
							<div class="col-xs-8 col-sm-2">
								<span class="btn btn-default">卡号 <input type="text"
									id="number" value="${number }" />
								</span>
							</div>
							<div class="col-xs-4 col-sm-3 ">
								<div class="row">
									<div class="col-xs-6 col-sm-4 ">
										<span class="btn btn-default">有效期开始时间 <input
											type="text" id="startTime" value="${startTime }" /> <img
											src="../js/My97DatePicker/skin/datePicker.gif" width="16"
											height="22" />
										</span>
									</div>
								</div>
							</div>

							<div class="col-xs-4 col-sm-3 ">
								<div class="row">
									<div class="col-xs-8 col-sm-4">
										<span class="btn btn-default">有效期结束时间 <input
											type="text" id="endTime" value="${endTime }" /> <img
											src="../js/My97DatePicker/skin/datePicker.gif" width="16"
											height="22" />
										</span>
									</div>
								</div>
							</div>

							<div class="col-xs-4 col-sm-2 ">
								<div class="row">
									<div class="col-xs-8 col-sm-3">
										<span class="btn btn-default"> 省份<select
											id="AllProvinces">
												<option value="0">全部</option>
										</select> <input type="hidden" id="selector" value="${provId }">
										</span>
									</div>
								</div>
							</div>
							<div class="col-xs-4 col-sm-1 ">
								<div class="row">
									<div class="col-xs-6 col-sm-4 ">
										<input type="button" class="btn btn-primary" id="search"
											value="查询" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="row">&nbsp;</div>
			<div class="row">
				<div class="col-xs-6 col-sm-4">
					<a href="card/add" class="btn btn-primary">批量生成密保卡</a>

				</div>
			</div>
			<div class="row">&nbsp;</div>
			<div class="row">
				<div class="col-xs-6 col-sm-11">
					<div class="table-responsive"
						style="vertical-align: middle; text-align: center;">
						<table id="searchTable"
							class="table table-bordered table-hover table-condensed  ">
							<tr>
								<td><input type="checkbox" id="all" value="全选" /> 全选</td>
								<td>ID</td>
								<td>卡号</td>
								<td>密码</td>
								<td>金额</td>
								<td>省份</td>
								<td>有效期开始时间</td>
								<td>有效期结束时间</td>
								<td>使用状态</td>
								<td>创建时间</td>
							</tr>
							<c:forEach items="${cards }" var="card">
								<tr>
									<td><input type='checkbox' name='opt' value='' /></td>
									<td>${card.id }</td>
									<td>${card.number }</td>
									<td>${card.password }</td>
									<td>${card.amount }</td>
									<td>${card.province.name }</td>
									<td><fmt:formatDate value="${card.startTime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><fmt:formatDate value="${card.endTime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<c:set var="index" value="${card.status }" />
									<td>${statusMap[index] }</td>
									<td><fmt:formatDate value="${card.createTime }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a id="firstPage" class="btn btn-primary">首页</a> <a id="prePage"
					class="btn btn-primary">上一页 </a> &nbsp;&nbsp;&nbsp;&nbsp;<a
					id="pageNo">${pageNo }</a>&nbsp;&nbsp;&nbsp;&nbsp; <a id="nextPage"
					class="btn btn-primary">下一页 </a> <a id="lastPage"
					class="btn btn-primary">尾页 </a> <input type="hidden" id="totalPage"
					value="${totalPage }">
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
