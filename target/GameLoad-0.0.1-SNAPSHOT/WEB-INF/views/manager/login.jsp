<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>游币管理员后台登录页面</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<!-- MAIN EFFECT -->
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../myjs/mlogin.js"></script>
<style type="text/css">
#zhong {
	margin-top: 200px;
}

#yzmsj {
	display: none;
}

#1 {
	color: green;
}
#login_form {
	text-align:left !important; 
}
#valid_btn {
	width:120px !important; 
}
.input_width {
	width:300px !important;
}
.validate {
	width: 80px;
	height: 40px;
	border: 1px solid #999;
	text-align: center;
	line-height: 40px;
	margin-bottom: 10px;
}
.hidden{
	visibility: hidden;
}
</style>
</head>
<body>
	<div id="preloader"></div>
	<div class="container">
		<div id="zhong">
			<div class="" id="login-wrapper">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div id="logo-login">
							<h1>游币后台登录页面</h1>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="account-box">
							<form id="login_form">
								<div class="row">
									<div class="col-sm-9">
										<label for="inputUsername">用户名</label>
										<input type="text" id="account" required="required" class="form-control input_width">
									</div>
									<div class="col-xs-3 col-sm-5">
										<span id="accountMsg"></span>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-9">
										<label for="pwd">密码</label> 
										<input type="password" id="password" required="required" class="form-control input_width">
									</div>
									<div class="col-xs-3 col-sm-5">
										<span id="pwdMsg"></span>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-9">
										<label for="inputverificationcode">验证码 </label>
										<div class="row">
											<div class="col-xs-8 col-sm-8">
												<input type="text" id="validCode" required="required"  class="form-control" />
											</div>
											<div class="col-xs-2 col-sm-2">
												<input class="btn btn-warning" type="button" id="valid_btn" value="获取验证码" />
											</div>
											<div class="col-xs-3 col-sm-5">
												<span id="codeMsg" ></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-9">
										<div class="validate hidden">
										</div>
									</div>
								</div>
								<button id="start" class="btn btn btn-primary " type="button">登 录</button>
							</form>
							<a class="forgotLnk" href="/manager"><span></span></a>
							<div class="row-block">
								<div class="row"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>