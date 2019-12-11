<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="注册界面" />
<title>注册界面</title>
<link rel="stylesheet" href="../../css/jq22.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap.css">
<style type="text/css">
.red {
	color: red;
}

.green {
	color: green;
}
#valid_btn {
	margin-left:50px;
	padding: 10px !important;
}
</style>
</head>
<body>
	<!-- begin -->
	<div id="login">
		<div class="wrapper">
			<div class="login">
				<form class="container offset1 loginform">
					<div id="owl-login">
						<div class="hand"></div>
						<div class="hand hand-r"></div>
						<div class="arms">
							<div class="arm"></div>
							<div class="arm arm-r"></div>
						</div>
					</div>
					<div class="pad">
						<div class="control-group">
							<div class="controls text-center">
								<h4>游币用户注册</h4>
							</div>
						</div>
						<div class="control-group">&nbsp;</div>

						<div class="control-group">
							<div class="controls">
								<label for="userName" id="userNameMsg"
									class="glyphicon glyphicon-user"></label> <input id="account"
									type="text" name="account" placeholder="用户名(超过两个字符)"
									autofocus="autofocus" required="required" tabindex="1"
									class="form-control input-medium">
							</div>
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="accountMsg"></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<label for="password" id="userPwdMsg"
									class="glyphicon glyphicon-th"></label> <input id="password"
									type="password" name="password" placeholder="密码(6-16个字符)"
									required="required" tabindex="2"
									class="form-control input-medium">
							</div>
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="pwdMsg"></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<label for="password" id="userPwdMsg2"
									class="glyphicon glyphicon-th"></label> <input id="checkPwd"
									type="password" placeholder="确认密码" required="required"
									tabindex="3" class="form-control input-medium">
							</div>
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="checkPwdMsg"></span>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<input type="radio" name="sex" value="1" tabindex="5"
									checked="checked" />男 <input type="radio" name="sex" value="2"
									tabindex="6" />女
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<label for="birthday" id="birthdayMsg"
									class="glyphicon glyphicon-user"></label> <input id="birthday"
									name="birth" type="text" placeholder="生日 " required="required"
									tabindex="7" class="form-control input-medium">
							</div>
							<div class="row">
								<div class="birthMsg">
									</span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<label for="Number" class="glyphicon glyphicon-user"></label> <input
									id="mail" name="mail" type="text" placeholder="邮箱 "
									required="required" tabindex="4"
									class="form-control input-medium">
							</div>
							<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="mailMsg"></span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<label for="inputverificationcode">验证码 </label>
								<div class="row">
									<div class="col-xs-8 col-sm-8">
										<input type="text" id="validCode" required="required"
											class="form-control" />
									</div>
									<div class="col-xs-2 col-sm-2">
										<input class="btn btn-warning" type="button" id="valid_btn"
											value="获取验证码" />
									</div>
									<div class="col-xs-3 col-sm-5">
										<span id="codeMsg"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-actions">
						<a href="login" tabindex="9" class="btn btn-link text-muted "
							style="color: red">返回登录</a>
						<button type="button" tabindex="8" class="btn btn-primary"
							id="registBtn">点击注册</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="../../js/jquery.min.js"></script>
	<script src="../../js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="../../js/canvas-particle.js"></script>
	<script type="text/javascript" src="../../myjs/uRegist.js"></script>
	<script type="text/javascript">
		$(function() {

			$('#login #userPwd,#login #userPwd2').focus(function() {
				$('#owl-login').addClass('password');
			}).blur(function() {
				$('#owl-login').removeClass('password');
			});
			var config = {
				vx : 4,
				vy : 4,
				height : 2,
				width : 2,
				count : 300,
				color : "121, 162, 185",
				stroke : "100,200,180",
				dist : 8000,
				e_dist : 60000,
				max_conn : 10
			};
			CanvasParticle(config);

		});
	</script>

	<!-- end -->
</body>
</html>
