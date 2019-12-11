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

<title>游币游戏详情</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/index.css" />
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/jquery.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../myjs/uTop.js"></script>
<script type="text/javascript" src="../../myjs/uDetail.js"></script>

<style type="text/css">
#time {
	color: #000;
	text-align: center;
	position: absolute;
	top: 15px;
	left: 220px;
}
</style>
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
			<a class="navbar-brand" href="../user">游币手机下载门户网站</a> <a id="time"></a>
		</div>
		<script>
			document.getElementById('time').innerHTML = new Date()
					.toLocaleString()
					+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
			setInterval(
					"document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
					1000);
		</script>
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
	<div class="modal fade" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="myModalLabel">密保卡充值</h4>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="background-color: #CCC; overflow: hidden;"
		onLoad="init()">
		<div class="col-md-12">
			<ul class="nav nav-pills col-md-offset-3">
				<li class=><a href="../user" class="btn btn-primary">首页</a></li>
				<li><a href="../user/index/queryByCondition?typeId=1&pageNo=1"
					class="btn btn-primary">棋牌桌游</a></li>
				<li><a href="../user/index/queryByCondition?typeId=2&pageNo=1"
					class="btn btn-primary">动作射击</a></li>
				<li><a href="../user/index/queryByCondition?typeId=3&pageNo=1"
					class="btn btn-primary">体育竞技</a></li>
				<li><a href="../user/index/queryByCondition?typeId=4&pageNo=1"
					class="btn btn-primary">角色扮演</a></li>
				<li><a href="../user/index/queryByCondition?typeId=5&pageNo=1"
					class="btn btn-primary">休闲益智</a></li>
				<li><a href="../user/index/queryByCondition?typeId=6&pageNo=1"
					class="btn btn-primary">MOBA</a></li>
				<li><a href="../user/index/queryByCondition?typeId=8&pageNo=1"
					class="btn btn-primary">经营养成</a></li>
			</ul>
		</div>
	</div>


	<div class="row">&nbsp;</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="table-responsive">
					<table class="table table-striped table-hover">
						<caption>账户详情</caption>
						<tbody>
							<tr>
								<td><strong>用户名:</strong>${user.account }</td>
							</tr>
							<tr>
								<td><strong>密码:</strong>${user.password }</td>
							</tr>
							<tr>
								<c:set value="${user.sex}" var="index" />
								<td><strong>性别:</strong>${sexMap[index]}</td>
							</tr>
							<tr>
								<td><strong>生日:</strong> <fmt:formatDate
										value="${user.birth}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td><strong>邮箱:</strong>${user.mail }</td>
							</tr>
							<tr>
								<td><strong>话费余额:</strong>${user.tariffe == null ? '0' : user.tariffe}</td>
							</tr>
							<tr>
								<td><strong>游币余额:</strong>${user.currency == null ? '0' : user.currency}</td>
							</tr>
							<tr>
								<td><strong>密保额度:</strong>${user.amount == null ? '0' : user.amount}</td>
							</tr>
							<c:choose>
								<c:when test="${endTime != null}">
									<tr>
										<td><strong>密保额度有效结束时间:</strong> <fmt:formatDate
												value="${endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:when>
							</c:choose>


						</tbody>
					</table>

					<a class="btn btn-warning" href="../user">返回上页</a> <a
						class="btn btn-primary" data-toggle="modal"
						data-target="#pwdModal">修改密码</a> <a class="btn btn-primary"
						data-toggle="modal" data-target="#phoneModal">绑定手机 </a>
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
	<div class="modal fade" id="pwdModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">原密码：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="oldPwd"
									placeholder="请输入原密码">
								<div class="row">
									<div class="col-xs-3 col-sm-5">
										<span id="oldMsg"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">新密码：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="请输入新密码"
									id="newPwd" />
								<div class="row">
									<div class="col-xs-3 col-sm-5">
										<span id="newMsg"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default" id="pwdBtn">确认修改</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="phoneModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">绑定手机</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">手机号：</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="oldPwd"
									placeholder="请输入手机号">
								<div class="row">
									<div class="col-xs-3 col-sm-5">
										<span id="numberMsg"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default" id="phoneBtn">绑定手机</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

</html>