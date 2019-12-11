<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>用户管理</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../myjs/myuser.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>

</head>
<body>
	<div id="container">
		<div class="page-header">
			<h2>用户列表</h2>
		</div>
		<form action="">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">用户名</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" class="form-control" id="account"
								value="${account }" />
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-2">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<span class="btn btn-default">邮箱</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" class="form-control" id="mail"
								value="${mail }" />
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-4">
					<input type="button" class="btn btn-primary" id="query" value="查询" />
				</div>
			</div>
		</form>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a class="btn btn-success" id="allow"> <span
					class="glyphicon glyphicon-ok-sign"></span> 恢复使用
				</a> <a class="btn btn-danger" id="forbid"> <span
					class="glyphicon glyphicon-trash"></span>禁止使用
				</a>
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
							<td><input type="checkbox" id="all" value="全选" />
								全选</td>
							<td>ID</td>
							<td>用户名</td>
							<td>邮箱账号</td>
							<td>状态</td>
							<td>创建时间</td>
						</tr>
						<c:forEach items="${users}" var="user">
							<tr>
								<td><input type='checkbox' name="opt" /></td>
								<td>${user.id }</td>
								<td>${user.account }</td>
								<td>${user.mail }</td>
								<c:set var="index" value="${user.status}" />
								<td>${statusMap[index]}</td>
								<td><fmt:formatDate value="${user.createTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
							</tr>
						</c:forEach>
					</table>
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
		<div id="otherform"></div>
	</div>
</body>
<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
