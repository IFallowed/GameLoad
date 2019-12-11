<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>游币充值记录</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/index.css" />
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../myjs/uTop.js"></script>


</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="../user">游币手机下载门户网站</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="../user/login">登录</a></li>
				<li class="dropdown"><a href="../user/regist">注册</a></li>
				<li class="dropdown" id="loginName"><a href="#">${user.account }</a>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle "
					data-toggle="dropdown">个人中心<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="../user/prepaid?id=${user.id }">充值记录</a></li>
						<li><a href="../user/userDetail?id=${user.id }">账户信息</a></li>
						<li><a href="../user/expense?id=${user.id }">消费记录</a></li>
						<li class="divider"></li>
						<li><a href="../user/quit">退出</a></li>
					</ul></li>

			</ul>
		</div>
		</nav>
	</div>

	<div class="row" style="background-color: #CCC; overflow: hidden;"
		onLoad="init()">
		<div class="col-md-12">
			<ul class="nav nav-pills col-md-offset-3">
				<li class=><a href="../user" class="btn btn-primary">首页</a></li>
				<li><a href="../user/index/queryByCondition?typeId=1&pageNo=1" class="btn btn-primary">棋牌桌游</a></li>
				<li><a href="../user/index/queryByCondition?typeId=2&pageNo=1" class="btn btn-primary">动作射击</a></li>
				<li><a href="../user/index/queryByCondition?typeId=3&pageNo=1" class="btn btn-primary">体育竞技</a></li>
				<li><a href="../user/index/queryByCondition?typeId=4&pageNo=1" class="btn btn-primary">角色扮演</a></li>
				<li><a href="../user/index/queryByCondition?typeId=5&pageNo=1" class="btn btn-primary">休闲益智</a></li>
				<li><a href="../user/index/queryByCondition?typeId=6&pageNo=1" class="btn btn-primary">MOBA</a></li>
				<li><a href="../user/index/queryByCondition?typeId=8&pageNo=1" class="btn btn-primary">经营养成</a></li>
			</ul>
		</div>
	</div>

	<div class="row">&nbsp;</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="table-responsive">

					<table class="table table-striped table-hover">
						<caption>充值记录</caption>
						<tbody>
							<c:choose>
								<c:when
									test="${null == prepaid or prepaid.card.status == '14' }">
									<tr>
										<td>该用户尚未充值</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td><strong>用户名:</strong>${prepaid.user.account }</td>
									</tr>
									<tr>
										<td><strong>卡号:</strong>${prepaid.card.number }</td>
									</tr>
									<tr>
										<td><strong>密码:</strong>${prepaid.card.password }</td>
									</tr>
									<tr>
										<td><strong>密保额度:</strong>${prepaid.card.amount }</td>
									</tr>
									<tr>
										<td><strong>密保额度有效结束时间:</strong> <fmt:formatDate
												value="${prepaid.card.endTime }"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<a class="btn btn-warning" href="../user">返回上页</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="container">
			<hr />
			<div class="col-md-4 col-md-offset-5">&copy;2016-2017
				portal.com 版权所有</div>
		</div>
	</div>
</body>

</html>
