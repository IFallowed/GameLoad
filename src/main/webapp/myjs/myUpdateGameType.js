$(function() {
	var value = $("#selector").val();
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
	
})