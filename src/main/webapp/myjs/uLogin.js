$(function(){
	
	$("#submitBtn").click(function(){
		$("#accountMsg").html("");
		$("#pwdMsg").html("");
		if(checkAccount() && checkPwd()){
			$.ajax({
				type:"post",
				url:"/user/login/toLogin",
				data:{
					account:$("#account").val(),
					password:$("#password").val()
				},
				dataType:"json",
				success:function(result) {
					if(result.code == "200"){
						alert("success");
						location.href = "/user";
					}
					else if(result.code == "202"){
						$("#accountMsg").html("<font style='color: red'>" + result.msg + "</font>");
					}
					else if(result.code == "201"){
						$("#pwdMsg").html("<font style='color: red'>" + result.msg + "</font>");
					}
					else{
						$("#accountMsg").html("<font style='color: red'>此用户已被" + result.msg + "</font>");
					}
				}
			})
		}
	});
	
});

function checkAccount(){
	if('' != $("#account").val()){
		return true;
	}
	else{
		$("#accountMsg").html("<font style='color: red'>账号不能为空</font>");
		return false;
	}
}

function checkPwd(){
	if('' != $("#password").val()){
		return true;
	}
	else{
		$("#pwdMsg").html("<font style='color: red'>密码不能为空</font>");
		return false;
	}
}
