<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>游币比例管理页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../myjs/myExchange.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
.invalid{
    color:#DDD;
    cursor:pointer;
    pointer-events: none;
}
</style>

</head>
<body>
	<div id="container">
		<div class="page-header ">
			<h2>游币换算比例</h2>
		</div>
		<form action="">
			<div class="row">
				<div class="col-xs-4 col-sm-3 ">
					<div class="row">
						<div class="col-xs-8 col-sm-2">
							<span class="btn btn-default">省份</span>
						</div>
						<div class="col-xs-3 col-sm-5">
							<select class="form-control" id="AllProvinces" >
								<option value="0">全部</option>
							</select> <input type="hidden" id="selector" value="${provId }">
						</div>
						<div class="col-xs-6 col-sm-4 ">
							<input type="button" class="btn btn-primary" id="search"
								value="查询" />
						</div>
					</div>
				</div>

			</div>
		</form>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<a class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" id="save"> <span class="glyphicon glyphicon-plus"></span>
					新增
				</a> <a class="btn btn-danger" id="delete"> <span
					class="glyphicon glyphicon-trash"></span> 删除
				</a>

			</div>
		</div>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-xs-6 col-sm-11">
				<div class="table-responsive"
					style="vertical-align: middle; text-align: center;">
					<div class="panel-body">消费金额是指对应省份消费1元话费所赠送的游币数量</div>
					<table id="searchTable"
						class="table table-bordered table-hover table-condensed  ">
						<tr>
							<td><input type="checkbox" id="all" value="全选" /> 全选</td>
							<td>省份代码</td>
							<td>省份</td>
							<td>兑换比例</td>
							<td>创建时间</td>
							<td>修改时间</td>
							<td>规则状态</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${exchanges }" var="exchange">
							<tr>
								<td><input type='checkbox' name='opt' value='' /></td>
								<td style="display: none;">${exchange.id }</td>
								<td>${exchange.province.id }</td>
								<td>${exchange.province.name }</td>
								<td>${exchange.charge }</td>
								<td><fmt:formatDate value="${exchange.createTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${exchange.updateTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<c:set var="index" value="${exchange.status}" />
								<td>${gameMap[index]}</td>
								<td><a class="btn btn-info btn-sm"
									href="exchange/update?id=${exchange.id }"> <span
										class="glyphicon glyphicon-pencil"></span>修改
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
						<h4 class="modal-title" id="myModalLabel">添加兑换比例</h4>
					</div>
					<div class="modal-body">
						<form id="saveform" action="exchange/save" method="post">
							<div class="form-group">
								<label for="gameType.id">省份：</label> <select
									class="form-control" name="province.id" id="noSaveExchange">
								</select>
							</div>
							<div class="panel-body">相应省份消费1元话费所赠送的游币数量</div>
							<div class="form-group">
								<label for="developers" class="control-label">兑换比例:</label> <input
									type="text" class="form-control" name="charge"
									 />
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
	</div>
</body>
<style>
td {
	vertical-align: middle !important;
}
</style>
</html>
