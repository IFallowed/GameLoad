$(function(){

	//管理员的点击登录事件
	$("#start").click(function(){
		$("#accountMsg").html("");
		$("#pwdMsg").html("");
		$("#validCode").html("");
		$.ajax({
			type:"post",
			url:"/manager/login/toLogin",
			data:{
				account:$("#account").val(),
				password:$("#password").val(),
				validCode:$("#validCode").val()
			},
			dataType:"json",
			success:function(result) {
				if(result.code == "200"){
					alert("success");
					$(".forgotLnk span").click();
				}
				else if(result.code == "202"){
					$("#accountMsg").html("<font style='color: red'>" + result.msg + "</font>");
				}
				else if(result.code == "201"){
					$("#pwdMsg").html("<font style='color: red'>" + result.msg + "</font>");
				}
				else if(result.code == "203"){
					$("#codeMsg").html("<font style='color: red'>" + result.msg + "</font>");
				}
			}
		});
	});
	
	//获取验证码
	$("#valid_btn").click(function(){
		$.ajax({
			type:"post",
			url:"/manager/login/getValidCode",
			success:function(result){
				$(".validate").text(result.validCode);
				$(".validate").removeClass("hidden");
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