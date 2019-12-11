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
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="../../css/jquery-accordion-menu.css" rel="stylesheet"
	type="text/css" />
<link href="../../css/font-awesome.css" rel="stylesheet" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/particles.js"></script>
<script src="../../js/app.js"></script>
<script type="text/javascript" src="../../myjs/uGame.js"></script>
<script type="text/javascript" src="../../myjs/uTop.js"></script>
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
				<li class="dropdown"><a href="../uesr/login">登录</a></li>
				<li class="dropdown"><a href="../user/regist">注册</a></li>
				<li class="dropdown" id="loginName"><a href="#">${user.account}</a>
				</li>


				<li class="dropdown logined"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">个人中心<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="prepaid?id=${user.id }">充值记录</a></li>
						<li><a href="userDetail?id=${user.id }">账户信息</a></li>
						<li><a href="expense?id=${user.id }">消费记录</a></li>
						<li class="divider"></li>
						<li><a href="user/quit">退出</a></li>
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
		<form>
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<img src="/images/cover/${game.cover }" width="450px" alt="" />
				</div>
				<div class="col-md-6 col-md-offset-1">
					<input type="hidden" id="gameId" value="${game.id }">
					<p>
						<strong>游戏名称:</strong>${game.name }
					</p>
					<p>
						<strong>游戏类型:</strong>${game.gameType.name }
					</p>
					<p>
						<strong>话费价格:</strong>${game.tariffe }元 <input type="hidden"
							id="tariffe" value="${game.tariffe }">
					</p>
					<p>
						<strong>游币价格:</strong>${game.currency }(单位:游币) <input
							type="hidden" id="currency" value="${game.currency }">
					</p>
					<p>
						<strong>开发商:</strong>${game.developers }
					</p>
					<p>
						<strong>备案号:</strong>${game.filing }
					</p>
					<p>
						<strong>游戏简介:</strong>${game.introduction }
					</p>
					<p>
						<c:set value="${game.status }" var="index" />
						<strong>游戏状态:</strong>${gameMap[index] }

					</p>
					<p>
						<strong>最新发布时间:</strong>
						<fmt:formatDate value="${game.updateTime }"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</p>
					<p>
						<strong>支付方式:</strong><select id="payType">
							<option value="30" selected="selected">话费支付</option>
							<option value="31">游币支付</option>
						</select>
					</p>
					<p>
						<input type="button" class="btn btn-success" id="payBtn"
							value="确认购买"> <a class="btn btn-warning" href="../user">返回首页</a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">游戏详情</h3>
						</div>
						<div class="panel-body">${game.detail }</div>
					</div>
				</div>

			</div>
			<div class="row col-md-12">
				<div class="panel panel-warning ">
					<div class="panel-heading">
						<h3 class="panel-title">游戏画面截图</h3>
					</div>
					<div class="panel-body">
						<div class="carousel content-main">
							<div id="slidershow" class="carousel slide" data-ride="carousel"
								style="width: 50%; height: 50%; margin-left: auto; margin-right: auto;">
								<ol class="carousel-indicators">
									<li class="active" data-target="#slidershow" data-slide-to="0"></li>
									<li data-target="#slidershow" data-slide-to="1"></li>
									<li data-target="#slidershow" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner">
									<div class="item active">
										<a href="##"><img width="800px" height="420px"
											src="/images/cover/${game.cover }"></a>
									</div>
									<c:forEach items="${screens }" var="screen">
										<div class="item">
											<a href="##"><img width="800px" height="420px"
												src="/images/screen/${screen }"></a>
										</div>
									</c:forEach>
								</div>
								<a class="left carousel-control" href="#slidershow"
									role="button" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span>
								</a> <a class="right carousel-control" href="#slidershow"
									role="button" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</div>


						</div>

					</div>
				</div>
			</div>
		</form>
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
