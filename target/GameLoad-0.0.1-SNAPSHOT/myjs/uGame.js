$(function(){
	
	$("#payBtn").click(function() {
		$.ajax({
			type:"post",
			url:"downGame",
			data:{
				gameId:$("#gameId").val(),
				payType:$("#payType").val(),
				tariffe:$("#tariffe").val(),
				currency:$("#currency").val()
			},
			dateType:"json",
			success:function(result){
				if(result.code == "200") {
					alert("下载成功");
				}
				else if(result.code == "202"){
					alert(result.msg);
				}
				else if(result.code == "205"){
					alert(result.msg);
				}
			}
		})
	});
});