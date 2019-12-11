$(function(){
	//渲染select选择框
	initSelect();
	//渲染分页
	initLoad();
	
	$("#search").click(function(){
		var name = $.trim($("#name").val());
		var typeId =  $("#Alltypes").val() == 0 ? "" :  $("#Alltypes").val();
		window.location.href = "user/queryByCondition?name=" + name + "&typeId=" + typeId;
	});
	
	$("#chargeBtn").click(function(){
		$("#numberMsg").html("");
		$("#pwdMsg").html("");
		$.ajax({
			type:"post",
			url:"user/cardCharge",
			data:{
				number:$("#cardNumber").val().trim(),
				password:$("#cardPwd").val().trim()
			},
			dataType:"json",
			success:function(result){
				if(result.code == "200"){
					alert("success");
				}
				else if(result.code == "201"){
					$("#pwdMsg").html("<font style='color: red'>" + result.msg + "</font>");
				}
				else if(result.code == "202"){
					$("#numberMsg").html("<font style='color: red'>" + result.msg + "</font>");
				}
				else{
					$("#numberMsg").html("<font style='color: red'>" + result.msg + "</font>");
				}
			}
		})
	});
});

function initSelect(){
	$.ajax({
		type:"post",
		url:"user/index/getAllTypes",
		data:{},
		dataType:"json",
		success:function(result){
			if(result.code == "200"){
				var arr = result.typeNames;
				var type = $("#selector").val();
				for(var i=0;i<result.typeNames.length;i++){
					var id = arr[i].gt_id;
					var name = arr[i].gt_name;
					var pic = arr[i].gt_picture;
					if(type != "" && type == id){
						$("#Alltypes").append("<option selected='selected' value='"+id+"'>"+name+"</option>");
					}
					else{
						$("#Alltypes").append("<option value='"+id+"'>"+name+"</option>");
						if(i >= 5){
							$("#leftUl").append("<li><a href='user/queryByCondition?pageNo=1&typeId="+id+"'><img width='50px' src='../images/cover/"+pic+"'/>"+name+"</a></li>");
						}
					}
					
				}
			}
		}
	})
}

function initLoad() {
	var name = $("#name").val().trim();
	var typeId = $("#selector").val();

	var	pageNo = parseFloat($("#pageNo").text().trim());
	var totalPage = parseFloat($("#totalPage").val().trim());
	
	var preNo = pageNo - 1;
	var nextNo =pageNo + 1;

	if(preNo != 0){
		$("#firstPage").prop("href","/user?pageNo=1&name="+name+"&typeId="+typeId);
		$("#prePage").prop("href","/user?pageNo="+preNo+"&name="+name+"&typeId="+typeId);
	}
	else{
		$("#firstPage").prop('href',"#");
		$("#prePage").prop('href',"#");
	}
	
	if(nextNo != totalPage + 1){
		$("#nextPage").prop("href","/user?pageNo="+nextNo+"&name="+name+"&typeId="+typeId);
		$("#lastPage").prop("href","/user?pageNo="+totalPage+"&name="+name+"&typeId="+typeId);
	}
	else{
		$("#nextPage").prop('href',"#");
		$("#lastPage").prop('href',"#");
	}
}