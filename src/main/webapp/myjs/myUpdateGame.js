$(function(){
	//渲染select选择框
	initSelect();
	
	var value = $("#status").val();
	if (value == "20") {
		$("#online").prop("checked", true);
		$("#offline").prop("checked", false);
	} else {
		$("#online").prop("checked", false);
		$("#offline").prop("checked", true);
	}
	
	var oldName = $("input[name='name']").val();
	$("input[name='name']").blur(function(){
		var newName = $(this).val();
		if(oldName != newName){
			$.ajax({
				type:"post",
				url:"checkName",
				data:{
					name:newName
				},
				dataType:"json",
				success:function(result){
					if(result == "201"){
						$("#codeMsg").html("<font style='color: red'>已有相同的类型名称</font>");
						$("input[type='submit']").prop("disabled",true);
					}
					else{
						$("#codeMsg").html("");
						$("input[type='submit']").prop("disabled",false);
					}
				}
			})
		}
	});

});

function initSelect(){
	$.ajax({
		type:"post",
		url:"getAllTypes",
		data:{},
		dataType:"json",
		success:function(result){
			if(result.code == "200"){
				var arr = result.typeNames;
				var type = $("#gameType").val();
				for(var i=0;i<result.typeNames.length;i++){
					var id = arr[i].gt_id;
					var name = arr[i].gt_name;
					if(id == type){
						$("#AllTypes").append("<option selected='selected' value='"+id+"'>"+name+"</option>");
					}
					else{
						$("#AllTypes").append("<option value='"+id+"'>"+name+"</option>");
					}
				}
			}
		}
	})
}