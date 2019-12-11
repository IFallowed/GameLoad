$(function(){
	//渲染select选择框
	initSelect();
	//渲染分页
	initLoad();
	
	$("#search").click(function(){
		var number = $("#number").val();
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		var provId =  $("#AllProvinces").val() == 0 ? "" :  $("#AllProvinces").val();
		window.location.href = "card/queryByCondition?number="+ number +"&startTime=" + startTime +"&endTime=" + endTime +"&provId=" + provId;
	});
});

function initSelect(){
	$.ajax({
		type:"post",
		url:"card/getAllProvinces",
		data:{},
		dataType:"json",
		success:function(result){
			if(result.code == "200"){
				var arr = result.typeNames;
				var type = $("#selector").val();
				for(var i=0;i<result.typeNames.length;i++){
					var id = arr[i].id;
					var name = arr[i].name;
					if(type != "" && type == id){
						$("#AllProvinces").append("<option selected='selected' value='"+id+"'>"+name+"</option>");
					}
					else{
						$("#AllProvinces").append("<option value='"+id+"'>"+name+"</option>");
					}
				}
			}
		}
	})
}

function initLoad() {
	var number = $("#number").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var provId =  $("#AllProvinces").val() == 0 ? "" :  $("#AllProvinces").val();

	var	pageNo = parseFloat($("#pageNo").text().trim());
	var totalPage = parseFloat($("#totalPage").val().trim());
	
	var preNo = pageNo - 1;
	var nextNo =pageNo + 1;

	if(preNo != 0){
		$("#firstPage").prop("href","/manager/card?pageNo=1&number="+ number +"&startTime=" + startTime +"&endTime=" + endTime +"&provId=" + provId);
		$("#prePage").prop("href","/manager/card?pageNo="+preNo+"&number="+ number +"&startTime=" + startTime +"&endTime=" + endTime +"&provId=" + provId);
	}
	else{
		$("#firstPage").prop('href',"#");
		$("#prePage").prop('href',"#");
	}
	
	if(nextNo != totalPage + 1){
		$("#nextPage").prop("href","/manager/card?pageNo="+nextNo+"&number="+ number +"&startTime=" + startTime +"&endTime=" + endTime +"&provId=" + provId);
		$("#lastPage").prop("href","/manager/card?pageNo="+totalPage+"&number="+ number +"&startTime=" + startTime +"&endTime=" + endTime +"&provId=" + provId);
	}
	else{
		$("#nextPage").prop('href',"#");
		$("#lastPage").prop('href',"#");
	}
}