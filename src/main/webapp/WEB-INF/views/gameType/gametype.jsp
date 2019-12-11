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

<title>Bootstrap后台管理系统</title>


<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../myjs/myGameType.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>

</head>
<body>
	<div id="container" class="col-sm-12">
		<div class="page-header">
			<h2>游戏类型</h2>
		</div>
		<form action="">
			<div class="row">
				<div class="col-xs-6 col-sm-3">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">类型名称</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<input type="text" class="form-control" id="name"
								value="${name }" />
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-2">
					<div class="row">
						<div class="col-xs-8 col-sm-3">
							<span class="btn btn-default">状态</span>
						</div>
						<div class="col-xs-3 col-sm-8">
							<select class="form-control" id="status">
								<option value="0">全部</option>
								<option value="20">商用</option>
								<option value="21">下线</option>
							</select> <input type="hidden" id="selector" value="${status }">
						</div>
					</div>

				</div>
				<div class="col-xs-6 col-sm-4">
					<input type="button" class="btn btn-primary" value="查询" id="query" />
				</div>
			</div>
		</form>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a class="btn btn-primary" data-toggle="modal"
					data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span>
					新增
				</a>
				<a class="btn btn-danger" id="delete"> <span
					class="glyphicon glyphicon-trash"></span> 删除
				</a>
			</div>
		</div>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-11">
				<div class="table-responsive "
					style="vertical-align: middle; text-align: center;">
					<table id="searchTable"
						class="table table-bordered table-condensed ">
						<tr>
							<td><input type="checkbox" id="all" value="全选" /> 全选</td>
							<td>ID</td>
							<td>类型图片</td>
							<td>类型名称</td>
							<td>状态</td>
							<td>创建时间</td>
							<td>修改时间</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${gameTypes }" var="gameType">
							<tr>
								<td><input type='checkbox' name='opt' /></td>
								<td>${gameType.id }</td>
								<td>
									<div class="col-xs-6  col-md-offset-4">
										<img class="img-responsive" width="33" height="30"
											src="/images/cover/${gameType.picture }" />
									</div>
								</td>
								<td>${gameType.name }</td>
								<c:set var="index" value="${gameType.status}" />
								<td>${gameMap[index]}</td>
								<td><fmt:formatDate value="${gameType.createTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${gameType.updateTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a class="btn btn-info" href="gametype/update?id=${gameType.id }">
										<span class="glyphicon glyphicon-pencil"></span>修改
								</a></td>
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
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加游戏类型</h4>
				</div>
				<div class="modal-body">
					<form id="saveform" action="gametype/save" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="loginname" class="control-label">类型名称:</label> <input
								type="text" class="form-control" name="name">
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="codeMsg" ></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">状态:</label>
							<div class="radio">
								<label class="radio-inline"> <input type="radio"
									name="status" value="20">商用
								</label> <label class="radio-inline"> <input type="radio"
									name="status" value="21">下线
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="loginname" class="control-label">类型图片:</label> <input
								type="file" name="pic">
						</div>
						<div class="text-right">
							<span id="returnMessage" class="glyphicon"> </span>
							<button type="button" class="btn btn-default right"
								data-dismiss="modal">关闭</button>
							<button id="submitBtn" type="button" class="btn btn-primary">添加</button>
						</div>
					</form>
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