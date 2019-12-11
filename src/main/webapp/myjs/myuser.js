$(function(){
	
	//全选/全不选
	$("#all").click(function(){
		if($(this).prop('checked')){
			$("input[name='opt']").prop("checked",true);
		}
		else {
			$("input[name='opt']").prop("checked",false);
		}
	});
	$("input[name='opt']").each(function(){
		$(this).click(function(){
			if($(this).prop('checked')){
				if( $("input[name='opt']").size() ==   $("input[name='opt']:checked").length){//全部被选中
					$("#all").prop("checked",true);
				}
			}else{//取消
				$("#all").prop("checked",false);
			
			}
		});
	});
	
	$("#query").click(function(){
		var account = $.trim($("#account").val());
		var mail =  $.trim($("#mail").val());
		window.location.href = "user/queryByCondition?account=" + account + "&mail=" + mail;
		
	});
	
	$("#allow").click(function(){
		var ids = [];
		$('input[name="opt"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数    
			ids.push($(this).parent().next().text().trim());
		})
		if(ids == false){
			alert("未选中需要恢复使用的用户，请选择用户");
		}
		else{
			 var groups = ids.join(",");
			 $.ajax({
					type:"post",
					url:"user/changeStatus",
					data:{
						ids:groups,
						status:"10"
					},
					dataType:"json",
					success:function(result){
						if(result == "200"){
							alert("修改成功");
							location.href="../../manager/user";
						}
					}
				})
		}
	   
	});
	
	$("#forbid").click(function(){
		var ids = [];
		$('input[name="opt"]:checked').each(function(){//遍历每一个名字为nodes的复选框，其中选中的执行函数    
			ids.push($(this).parent().next().text().trim());
		})
		if(ids == false){
			alert("未选中需要禁用的用户，请选择用户");
		}
		else{
			var groups = ids.join(",");
			$.ajax({
				type:"post",
				url:"user/changeStatus",
				data:{
					ids:groups,
					status:"11"
				},
				dataType:"json",
				success:function(result){
					if(result == "200"){
						alert("修改成功");
						location.href="../../manager/user";
					}
				}
			})
		}
	    
	});
	
	var account = $("#account").val().trim();
	var mail = $("#mail").val().trim();
	var	pageNo = parseFloat($("#pageNo").text().trim());
	var totalPage = parseFloat($("#totalPage").val().trim());
	
	var preNo = pageNo - 1;
	var nextNo =pageNo + 1;

	if(preNo != 0){
		$("#firstPage").prop("href","/manager/user?pageNo=1&account="+account+"&mail="+mail);
		$("#prePage").prop("href","/manager/user?pageNo="+preNo+"&account="+account+"&mail="+mail);
	}
	else{
		$("#firstPage").prop('href',"#");
		$("#prePage").prop('href',"#");
	}
	
	if(nextNo != totalPage + 1){
		$("#nextPage").prop("href","/manager/user?pageNo="+nextNo+"&account="+account+"&mail="+mail);
		$("#lastPage").prop("href","/manager/user?pageNo="+totalPage+"&account="+account+"&mail="+mail);
	}
	else{
		$("#nextPage").prop('href',"#");
		$("#lastPage").prop('href',"#");
	}
});