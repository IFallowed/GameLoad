$(function(){
	//渲染select选择
	initSelect();
	//初始化多选下拉框
	$("#AllProvinces").multipleSelect();
	
	$("#startTime").blur(function(){
		var date = $(this).val();
		if('' != date){
			date = date.slice(0,19);
			date = date.replace(/-/g,'/');
			var time = new Date(date).getTime();
			var now = parseInt(new Date().getTime());
			if(now > time){
				alert("有效期开始时间不能为过去时间");
				$("#submitBtn").prop("disabled",true);
			}
			else{
				$("#submitBtn").prop("disabled",false);
			}
		}else{
			alert("此处不能为空");
			$("#submitBtn").prop("disabled",true);
		}
	});
	
	$("#endTime").blur(function(){
		var date = $(this).val();
		var startDate = $("#startTime").val();
		if('' != date){
			date = date.slice(0,19);
			startDate = startDate.slice(0,19);
			date = date.replace(/-/g,'/');
			startDate = startDate.replace(/-/g,'/');
			var time = new Date(date).getTime();
			var start = new Date(startDate).getTime();
			if(start > time){
				alert("有效期结束时间时间不能早于开始时间");
				$("#submitBtn").prop("disabled",true);
			}
			else{
				$("#submitBtn").prop("disabled",false);
			}
		}else{
			alert("此处不能为空");
			$("#submitBtn").prop("disabled",true);
		}
	});
	
	
	$("#submitBtn").click(function(){
		var proIds = $("#AllProvinces").multipleSelect("getSelects");
		$.ajax({
			type:"post",
			url:"save",
			data:{
				proIds:proIds.toString(),
				count:$("#count").val(),
				amount:$("#amount").val(),
				startTime:$("#startTime").val(),
				endTime:$("#endTime").val()
			},
			dateType:"json",
			success:function(result){
				if("200" == result){
					alert("添加成功");
					location.href = "../../manager/card";
				}
			}
			
		})
	});
});

function initSelect(){
	$.ajax({
		type:"post",
		url:"getAllProvinces",
		data:{},
		dataType:"json",
		async: false,
		success:function(result){
			if(result.code == "200"){
				var arr = result.typeNames;
				for(var i=0;i<result.typeNames.length;i++){
					var id = arr[i].id;
					var name = arr[i].name;
					$("#AllProvinces").append("<option value='"+id+"'>"+name+"</option>");
				}
			}
		}
	})
}


//正整数
function checkInt(e) {
  var re = new RegExp("^[0-9]*[1-9][0-9]*$");
  if (e.value != "") {
      if (!re.test(e.value)) {
    	  $("#submitBtn").prop("disabled",true);
          alert("请输入整数");
          e.value = "";
          e.focus();
      }
      else{
    	  $("#submitBtn").prop("disabled",false);
      }
  }
  else{
	  $("#submitBtn").prop("disabled",true);
	  alert("此处不能为空");
	  e.focus();
  }
}