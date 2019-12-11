<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="description" content="登录界面" />
<title>登录界面</title>
<link rel="stylesheet" href="../../css/jq22.css">
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/bootstrap.css">
<style type="text/css">
	#msg2{
		color:red;
	}
</style>
<!-- 控制粒子 -->
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
                            <h4>游币客户登录</h4>
                        </div>
                    </div>
                    <div class="control-group">
                        &nbsp;
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="name" id="nameMsg" class="glyphicon glyphicon-user"></label>
                            <input type="text" id="account" name="account" placeholder="用户名" tabindex="1" class="form-control input-medium">
                        	<div class="row">
								<div class="col-xs-3 col-sm-5">
									<span id="accountMsg"></span>
								</div>
							</div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="userPwd" id="userPwdMsg" class="glyphicon glyphicon-th"></label>
                            <input type="password" id="password" name="password" placeholder="密码(6-16个字符)" tabindex="2" class="form-control input-medium">
                        </div>
                        <div class="row">
							<div class="col-xs-3 col-sm-5">
								<span id="pwdMsg"></span>
							</div>
						</div>
                    </div>
                </div>
                <div class="form-actions">
                	<a href="#" tabindex="5" class="btn pull-left btn-link text-muted"  style="color:red">忘记密码?</a>
                	<a href="regist" tabindex="4" class="btn btn-link text-muted"  style="color:red">新用户注册</a>
                    <button type="button" tabindex="3"  class="btn btn-primary" id="submitBtn">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../../js/canvas-particle.js"></script>
<script type="text/javascript" src="../../myjs/uLogin.js"></script>
    <script type="text/javascript">
		window.onload = function(){
			var config = {
				vx: 4,
				vy:  4,
				height: 2,
				width: 2,
				count: 300,
				color: "121, 162, 185",
				stroke: "100,200,180",
				dist: 6000,
				e_dist: 20000,
				max_conn: 10
			};
			CanvasParticle(config);
		};
		
		 
		
		
	</script>
    <script>
    $(function() {

        $('#login #userPwd').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
    </script>
<!-- end -->
</body>
</html>
