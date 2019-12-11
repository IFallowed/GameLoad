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

<title>游币门户网站</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link href="../../css/jquery-accordion-menu.css" rel="stylesheet"
	type="text/css" />
<link href="../../css/font-awesome.css" rel="stylesheet" type="text/css" />
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/particles.js"></script>
<script src="../../js/app.js"></script>
<script type="text/javascript" src="../../myjs/uPortal.js"></script>
<script type="text/javascript" src="../../myjs/uTop.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

.content {
	width: 260px;
	margin: 100px auto;
}

.filterinput {
	background-color: rgba(249, 244, 244, 0);
	border-radius: 15px;
	width: 90%;
	height: 30px;
	border: thin solid #FFF;
	text-indent: 0.5em;
	font-weight: bold;
	color: #FFF;
}

#demo-list a {
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
}
</style>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
}

.out {
	width: 350px;
	height: 245px;
	margin: 25px auto;
	position: relative;
}

.img li {
	position: absolute;
	top: 0px;
	left: 0px;
	display: none
}

.out .num {
	position: absolute;
	bottom: 0px;
	left: 0px;
	font-size: 0px;
	text-align: center;
	width: 100%;
}

.num li {
	width: 20px;
	height: 20px;
	background: #666666;
	color: #FFFFFF;
	text-align: center;
	line-height: 20px;
	display: inline-block;
	font-size: 16px;
	border-radius: 50%;
	margin-right: 10px;
	cursor: pointer;
}

.out .btn {
	position: absolute;
	top: 52%;
	margin-top: -30px;
	width: 45px;
	height: 60px;
	background: rgba(0, 0, 0, 0.5);
	color: #FFFFFF;
	text-align: center;
	line-height: 60px;
	font-size: 40px;
	display: none;
	cursor: pointer;
}

.out .num li.active-1 {
	background: #AA0000;
	margin-left: 150px;
}

.out:hover .btn {
	display: block
}

.out .left {
	left: 0px;
}

.out .right {
	right: -150px;
}

#leftNav {
	margin-left: 87px;
}

.page {
	float: right;
	margin-right: 240px;
}

.hidden {
	visibility: hidden;
}
</style>
<script src="../../js/jquery-accordion-menu.js" type="text/javascript"></script>
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
				<li class="dropdown"><a href="user/login">登录</a></li>
				<li class="dropdown"><a href="user/regist">注册</a></li>
				<li class="dropdown" id="loginName"><a href="#">${user.account}</a>
				</li>


				<li class="dropdown logined"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">个人中心<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a data-toggle="modal" data-target="#myModal">密保卡充值</a></li>
						<li><a href="user/prepaid?id=${user.id }">充值记录</a></li>
						<li><a href="user/userDetail?id=${user.id }">账户信息</a></li>
						<li><a href="user/expense?id=${user.id }">消费记录</a></li>
						<li class="divider"></li>
						<li><a href="user/quit">退出</a></li>
					</ul></li>

			</ul>
		</div>
		</nav>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">密保卡充值</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">卡号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="cardNumber"
									name="cardNumber" placeholder="请输入卡号"> <input
									type="hidden" name="userId" value="" />
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="numberMsg"></span>
								</div>
							</div>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="请输入卡密码"
									id="cardPwd" name="cardPwd" />
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="pwdMsg"></span>
								</div>
							</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="btn btn-default" id="chargeBtn">确认充值</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>


	<div class="row" style="background-color: #CCC; overflow: hidden;"
		onLoad="init()">
		<div class="col-md-12">
			<ul class="nav nav-pills col-md-offset-1">
				<li class=><a href="../user" class="btn btn-primary">首页</a></li>
				<li><a href="../user/index/queryByCondition?typeId=1&pageNo=1" class="btn btn-primary">棋牌桌游</a></li>
				<li><a href="../user/index/queryByCondition?typeId=2&pageNo=1" class="btn btn-primary">动作射击</a></li>
				<li><a href="../user/index/queryByCondition?typeId=3&pageNo=1" class="btn btn-primary">体育竞技</a></li>
				<li><a href="../user/index/queryByCondition?typeId=4&pageNo=1" class="btn btn-primary">角色扮演</a></li>
				<li><a href="../user/index/queryByCondition?typeId=5&pageNo=1" class="btn btn-primary">休闲益智</a></li>
				<li><a href="../user/index/queryByCondition?typeId=6&pageNo=1" class="btn btn-primary">MOBA</a></li>
				<li><a href="../user/index/queryByCondition?typeId=8&pageNo=1" class="btn btn-primary">经营养成</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><select class="form-control" id="Alltypes">
						<option value="0">全部</option>
				</select> <input type="hidden" id="selector" value="${typeId }"></li>
				<li><input type="text" class="form-control" id="name"
					value="${name }" /></li>
				<li><a id="search" class="btn btn-primary ">查询</a></li>

			</ul>
		</div>
	</div>


	<div id="nail1" class="container">
		<div class="row">
			<div class="col-md-6 ">
				<div class="out">
					<!--上面-->
					<ul class="img">

						<li><a href=""> <img
								src="../../images/cover/1430727532556.jpg" width="500"
								height="300" alt="" />
						</a></li>
						<li><a href=""> <img
								src="../../images/cover/1480313735992.jpg" width="500"
								height="300" alt="" />
						</a></li>
						<li><a href=""> <img
								src="../../images/cover/9679982870.jpg" width="500" height="300"
								alt="" />
						</a></li>
						<li><a href=""> <img
								src="../../images/cover/1464842544378.jpg" width="500"
								height="300" alt="" />
						</a></li>
					</ul>
					<!--下面-->
					<ul class="num">
					</ul>
					<div class="left btn">&lt;</div>
					<div class="right btn">&gt;</div>
				</div>
			</div>
			<div class="col-md-5 col-md-offset-1">

				<div class="row">&nbsp;</div>
				<table class="table">
					<thead>
						<tr>
							<th>新闻公告</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="#">劳动节优惠先知</a></td>
						</tr>
						<tr>
							<td><a href="#">情人节优惠放送</a></td>
						</tr>
						<tr>
							<td><a href="#">定时充值返现活动</a></td>
						</tr>
						<tr>
							<td><a href="#">体育竞技类游戏更新</a></td>
						</tr>
						<tr>
							<td><a href="#">棋牌类游戏折扣活动</a></td>
						</tr>
						<tr>
							<td><a href="#">直辖市优惠活动</a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><a href="#">更多</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-md-12 ">
				<div id="leftNav" class="col-md-2">
					<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
						<div class="jquery-accordion-menu-header" id="form"></div>
						<ul id="demo-list">
							<li><a href="user/index/queryByCondition?typeId=1&pageNo=1"><img
									width="50px" src="../images/cover/1430727532556.jpg" />棋牌桌游</a></li>
							<li><a href="user/index/queryByCondition?typeId=2&pageNo=1"><img
									width="50px" src="../images/cover/1464839498389.jpg" />动作射击</a></li>
							<li><a href="user/index/queryByCondition?typeId=3&pageNo=1"><img
									width="50px" src="../images/cover/9679982870.jpg" />体育竞技</a></li>
							<li><a href="user/index/queryByCondition?typeId=4&pageNo=1"><img
									width="50px" src="../images/cover/1464919899197.jpg" />角色扮演</a></li>
							<li><a href="user/index/queryByCondition?typeId=5&pageNo=1"><img
									width="50px" src="../images/cover/1475904797130.jpg" />休闲益智</a></li>

							<li><a href="#"><i class="fa fa-suitcase"></i>更多类型 </a>
								<ul class="submenu" id="leftUl">
								</ul></li>


						</ul>

						<div class="jquery-accordion-menu-footer">Footer</div>
					</div>
				</div>
				<div id="nail2" class="col-md-8 col-md-offset-1">
					<c:choose>
						<c:when test="${games == null }">
							<h4>该游戏类型已被下架</h4>
						</c:when>
						<c:otherwise>
							<c:forEach items="${games }" var="game">
						<div class="col-md-6 col-sm-6 ">
							<div class="thumbnail">
								<img src="/images/cover/${game.cover }" width="150"
									height="150px" alt="">
								<div class="caption">
									<h3 style="text-align: center;">${game.name }</h3>
									<p>
										<a href="../user/gameDetail?id=${game.id }" class="btn btn-primary"
											style="margin-left: 120px;">游戏详情</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</div>
				<div class=" page">
					<div>
						<a id="firstPage" class="btn btn-primary">首页</a> <a id="prePage"
							class="btn btn-primary">上一页 </a> &nbsp;&nbsp;&nbsp;&nbsp;<a
							id="pageNo">${pageNo }</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
							id="nextPage" class="btn btn-primary">下一页 </a> <a id="lastPage"
							class="btn btn-primary">尾页 </a> <input type="hidden"
							id="totalPage" value="${totalPage }">
					</div>
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

	<script type="text/javascript">
		$(function() {

			$("#123").click(function() {
				$("#myModal").modal('hide');
			});
		});

		(function($) {
			$.expr[":"].Contains = function(a, i, m) {
				return (a.textContent || a.innerText || "").toUpperCase()
						.indexOf(m[3].toUpperCase()) >= 0;
			};
			function filterList(header, list) {
				//@header 头部元素
				//@list 无需列表
				//创建一个搜素表单
				var form = $("<form>").attr({
					"class" : "filterform",
					action : "#"
				}), input = $("<input>").attr({
					"class" : "filterinput",
					type : "text"
				});
				$(form).append(input).appendTo(header);
				$(input).change(
						function() {
							var filter = $(this).val();
							if (filter) {
								$matches = $(list).find(
										"a:Contains(" + filter + ")").parent();
								$("li", list).not($matches).slideUp();
								$matches.slideDown();
							} else {
								$(list).find("li").slideDown();
							}
							return false;
						}).keyup(function() {
					$(this).change();
				});
			}
			$(function() {
				filterList($("#form"), $("#demo-list"));
			});
		})(jQuery);
		jQuery(document).ready(function() {
			jQuery("#jquery-accordion-menu").jqueryAccordionMenu();

		});

		$(function() {
			//顶部导航切换
			$("#demo-list li").click(function() {
				$("#demo-list li.active").removeClass("active");
				$(this).addClass("active");
			});
		});
		$(".classname img").addClass(
				"carousel-inner img-responsive img-rounded");
	</script>

</body>

</html>
