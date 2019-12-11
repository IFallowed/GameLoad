$(function(){
	$("#registBtn").click(function(){
		$("#accountMsg").html("");
		$("#pwdMsg").html("");
		$("#checkPwdMsg").html("");
		$("#mailMsg").html("");
		if(checkAccount() && checkPwd() && checkCheckPwd() && checkMail()){
			$.ajax({
				type:"post",
				url:"/user/regist/toRegist",
				data:{
					account:$("#account").val(),
					password:$("#password").val(),
					sex:$("input[name='sex']").val(),
					birth:$("#birthday").val(),
					mail:$("#mail").val(),
					validCode:$("#validCode").val()
				},
				dataType:"json",
				success:function(result){
					if(result.code == "200"){
						alert("success");
						location.href = "/user/login";
					}
					else if(result.code == "204"){
						$("#accountMsg").html("<font style='color: red'>" + result.msg + "</font>");
					}
					else if(result.code == "203"){
						$("#codeMsg").html("<font style='color: red'>" + result.msg + "</font>");
					}
				}
			})
		}
	});
	
	//获取验证码
	$("#valid_btn").click(function(){
		$.ajax({
			type:"post",
			url:"/user/regist/getValidCode",
			data:{
				mail:$("#mail").val()
			},
			success:function(result){
			}
		});
		 var time = 60;
		 var timer = setInterval(function(){
			 time--;
		     $("#valid_btn").val("（"+time+"秒）重发");
		     $("#valid_btn").attr("disabled","disabled");
		     if(time==0){
		         clearInterval(timer);
		         $("#valid_btn").val("获取验证码");
		         $("#valid_btn").removeAttr("disabled");
		     }
		 },1000);
	});
});

function checkAccount(){
	var account = $("#account").val().trim();
	if(account.length <= 2){
		$("#accountMsg").html("<font style='color: red'>用户名长度要大于2</font>");
		return false;
	}
	else{
		return true;
	}
}

function checkPwd(){
	var pwd = $("#password").val().trim();
	if(pwd.length < 6){
		$("#pwdMsg").html("<font style='color: red'>密码长度不能小于6</font>");
		return false;
	}
	else if(pwd.length > 16){
		$("#pwdMsg").html("<font style='color: red'>密码长度不能大于16</font>");
		return false;
	}
	else{
		return true;
	}
}

function checkCheckPwd(){
	var pwd = $("#password").val().trim();
	var checkPwd = $("#checkPwd").val().trim();
	if(pwd != checkPwd){
		$("#checkPwdMsg").html("<font style='color: red'>两次输入的密码不一致</font>");
		return false;
	}
	else{
		return true;
	}
}

function checkMail(){
	var mail = $("#mail").val().trim();
	if(mail.match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)){
		return true;
	}
	else{
		$("#mailMsg").html("<font style='color: red'>邮箱格式不正确</font>");
		return false;
	}
}

function checkBirth(){
	var birthday = $("#birthday").val().trim();
	if(birthday.match(/^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/)){
		return true;
	}
	else{
		$("#birthMsg").html("<font style='color: red'>生日格式不正确</font>");
		return false;
	}
}
//(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29) 
