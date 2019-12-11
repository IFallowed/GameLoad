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
<style type="text/css">
#container {
	margin-top: -20px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="container">
		<div class="page-header text-center">
			<h2>游戏详情</h2>
		</div>
		<div class="row">
			<div class="col-xs-6 col-sm-4 col-md-offset-4">
				<form class="form-horizontal text-center">
					<table class="table table-bordered table-condensed ">
						<thead></thead>
						<tbody>
							<tr>
								<td>游戏id</td>
								<td>
									<div class="col-sm-10">${game.id }</div>
								</td>
							</tr>
							<tr>
								<td>游戏名称</td>
								<td>
									<div class="col-sm-10">${game.name }</div>
								</td>
							</tr>
							<tr>
								<td>游戏类型</td>
								<td>
									<div class="col-sm-10">${game.gameType.name }</div>
								</td>
							</tr>
							<tr>
								<td>游戏状态</td>
								<c:set var="index" value="${game.status}" />
								<td>
									<div class="col-sm-10">${gameMap[index]}</div>
								</td>
							</tr>
							<tr>
								<td>游戏开发商</td>
								<td>
									<div class="col-sm-10">${game.developers }</div>
								</td>
							</tr>

							<tr>
								<td>游戏备案号</td>
								<td>
									<div class="col-sm-10">${game.filing }</div>
								</td>
							</tr>

							<tr>
								<td>游戏简介</td>
								<td>
									<div class="col-sm-10">${game.introduction }</div>
								</td>
							</tr>

							<tr>
								<td>游戏详情</td>
								<td>
									<div class="col-sm-10">${game.detail }</div>
								</td>
							</tr>

							<tr>
								<td>游戏币价格</td>
								<td>
									<div class="col-sm-10">${game.currency }</div>
								</td>
							</tr>

							<tr>
								<td>话费价格</td>
								<td>
									<div class="col-sm-10">${game.tariffe }</div>
								</td>
							</tr>

							<tr>
								<td>游戏封面</td>
								<td>
									<div class="col-sm-10  col-md-offset-4">
										<img class="img-responsive" width="80"
											src="../../images/cover/${game.cover }" />
									</div>
								</td>
							</tr>
							<tr>
								<td>游戏画面截图</td>
								<td>
									<c:forEach items="${screens }" var="screen"
										varStatus="st">
										<div class="col-sm-5  col-md-4">
											<div class="thumbnail">
												<img class="img-responsive" width="100"
													src="../../images/screen/${screen }" />
											</div>
										</div>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td>创建时间</td>
								<td>
									<div class="col-sm-10">
										<fmt:formatDate value="${game.createTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
								</td>
							</tr>
							<tr>
								<td>修改时间</td>
								<td>
									<div class="col-sm-10">
										<fmt:formatDate value="${game.updateTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="row">
						<div class="col-xs-6 col-sm-4">
							<div class="form-group">
								<div class="col-sm-offset-10 col-sm-11">
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