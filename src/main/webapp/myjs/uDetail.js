$(function(){
	$("#pwdBtn").click(function(){
		$("#oldMsg").html("");
		$("#newMsg").html("");
		if(checkPwd()){
			$.ajax({
				type:"post",
				url:"updatePwd",
				data:{
					oldPwd:$("#oldPwd").val(),
					newPwd:$("#newPwd").val()
				},
				dataType:"json",
				success:function(result){
					if(result.code == "200"){
						alert("success");
						location.href = "../user/login";
					}
					else if (result.code == "201"){
						$("#oldMsg").html("<font style='color: red'>"+result.msg+"</font>");
					}
				}
			})
		}
	});
});

function checkPwd(){
	var pwd = $("#newPwd").val().trim();
	if(pwd.length < 6){
		$("#newMsg").html("<font style='color: red'>密码长度不能小于6</font>");
		return false;
	}
	else if(pwd.length > 16){
		$("#newMsg").html("<font style='color: red'>密码长度不能大于16</font>");
		return false;
	}
	else{
		return true;
	}
}