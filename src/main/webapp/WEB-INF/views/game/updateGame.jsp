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

<title>游戏详情</title>


<link rel="stylesheet" href="../../css/bootstrap.min.css">
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../myjs/myUpdateGame.js"></script>
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>

</head>
<body>
	<div id="container">
		<div class="page-header ">
			<h2>修改游戏</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-8 col-md-offset-2">
				<form class="form-horizontal text-center" action="toUpdate"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${game.id }"> <input
						type="hidden" name="screen" value="${game.screen }">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr>
								<td>游戏名称</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="name"
											value="${game.name }" />
									</div>
									<div class="row">
										<div class="col-xs-3 col-sm-9">
											<span id="codeMsg"></span>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏类型</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<select class="col-sm-12" name="gameType.id" id="AllTypes">
											<option value="" selected="selected">
										</select> <input type="hidden" id="gameType"
											value="${game.gameType.id }">
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏状态</td>
								<td>
									<div class="col-sm-6 col-md-offset-1">

										<label> <input type="radio" value="20"
											checked="checked" name="status" id="online"> 商用
										</label> <label> <input type="radio" value="21" name="status"
											id="offline"> 下线
										</label> <input type="hidden" id="status" value="${game.status }">
									</div>
								</td>
							</tr>

							<tr>
								<td>开发商</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="developers"
											value="${game.developers }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>备案号</td>
								<td>
									<div class=" col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="filing"
											value="${game.filing}" />
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏简介</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<textarea class="form-control" name="introduction" rows="3">${game.introduction }</textarea>
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏详情</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<textarea class="form-control" name="detail" rows="3">${game.detail }</textarea>
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏币价格</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="currency"
											value="${game.currency }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>话费价格</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<input type="text" class="col-sm-12" name="tariffe"
											value="${game.tariffe }" />
									</div>
								</td>
							</tr>

							<tr>
								<td>游戏封面</td>
								<td>
									<div class="col-sm-6  col-md-offset-3">
										<div class="thumbnail">
											<img class="img-responsive img-rounded " width="80"
												src="../../images/cover/${game.cover}" />
										</div>
										<div class="caption">
											<p>
												<input type="file" value="" name="coverfile" />
											</p>
										</div>

									</div>
								</td>
							</tr>

							<tr>
								<td>游戏截图</td>
								<td><c:forEach items="${screens }" var="screen"
										varStatus="st">
										<div class="col-sm-4 col-md-2 col-md-offset-1">
											<div class="thumbnail">
												<img class="img-rounded " width="150"
													src="../../images/screen/${screen }">
											</div>
											<div class="caption">
												<p>
													<input type="file" value="" name="screenfile${st.count }" />
												</p>
											</div>
										</div>
									</c:forEach></td>
							</tr>
							<tr>
								<td>创建时间</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<fmt:formatDate value="${game.createTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
								</td>
							</tr>

							<tr>
								<td>修改时间</td>
								<td>
									<div class="col-sm-6 col-md-offset-3">
										<fmt:formatDate value="${game.updateTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-10">
							<div class="form-group">
								<div class="col-xs-6 col-sm-4 col-md-offset-3">
									<input type="submit" class="btn btn-info" value="提交修改" />
								</div>
								<div class="col-xs-6 col-sm-4">
									<a class="btn btn-warning" href="../../manager/game">返回上一页</a>
								</div>
							</div>
						</div>
					</div>
				</form>

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
