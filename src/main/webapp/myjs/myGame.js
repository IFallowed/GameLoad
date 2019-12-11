$(function(){
	//渲染select选择框
	initSelect();
	//渲染分页
	initLoad();
	//全选/全不选
	allSelect();
	
	$("#search").click(function(){
		var name = $.trim($("#name").val());
		var typeId =  $("#Alltypes").val() == 0 ? "" :  $("#Alltypes").val();
		window.location.href = "user/queryByCondition?name=" + name + "&typeId=" + typeId;
	});
	
	$("#submitBtn").click(function(){
		var form = document.getElementById('saveform');
        form.submit();
        $("#myModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
	});
	
	$("input[name='name']").blur(function(){
		var name = $(this).val();
		$.ajax({
			type:"post",
			url:"game/checkName",
			data:{
				name:name
			},
			dataType:"json",
			success:function(result){
				if(result == "201"){
					$("#codeMsg").html("<font style='color: red'>已有相同的类型名称</font>");
					$("#submitBtn").prop("disabled",true);
				}
				else{
					$("#codeMsg").html("");
					$("#submitBtn").prop("disabled",false);
				}
			}
		})
	});
	
	$("#delete").click(function(){
		var ids = [];
		$('input[name="opt"]:checked').each(function(){
			ids.push($(this).parent().next().text().trim());
		});
		if(ids == false){
			alert("未选中需要删除的游戏，请选中后删除");
		}
		else{
			var groups = ids.join(",");
		    var flag = confirm("确定删除id为" + groups + "的游戏吗?");
			if(flag == true){
				$.ajax({
					type:"post",
					url:"game/delete",
					data:{
						ids:groups
					},
					dataType:"json",
					success:function(result){
						if(result.code == "200"){
							alert("删除成功");
							location.href="../../manager/game";
						}
					}
				})
			}
		}
	    
	});
});

function initSelect(){
	$.ajax({
		type:"post",
		url:"game/getAllTypes",
		data:{},
		dataType:"json",
		success:function(result){
			if(result.code == "200"){
				var arr = result.typeNames;
				var type = $("#selector").val();
				for(var i=0;i<result.typeNames.length;i++){
					var id = arr[i].gt_id;
					var name = arr[i].gt_name;
					if(type != "" && type == id){
						$("#Alltypes").append("<option selected='selected' value='"+id+"'>"+name+"</option>");
						$("#Alltype").append("<option selected='selected' value='"+id+"'>"+name+"</option>");
					}
					else{
						$("#Alltypes").append("<option value='"+id+"'>"+name+"</option>");
						$("#Alltype").append("<option value='"+id+"'>"+name+"</option>");
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
		$("#firstPage").prop("href","/manager/game?pageNo=1&name="+name+"&typeId="+typeId);
		$("#prePage").prop("href","/manager/game?pageNo="+preNo+"&name="+name+"&typeId="+typeId);
	}
	else{
		$("#firstPage").prop('href',"#");
		$("#prePage").prop('href',"#");
	}
	
	if(nextNo != totalPage + 1){
		$("#nextPage").prop("href","/manager/game?pageNo="+nextNo+"&name="+name+"&typeId="+typeId);
		$("#lastPage").prop("href","/manager/game?pageNo="+totalPage+"&name="+name+"&typeId="+typeId);
	}
	else{
		$("#nextPage").prop('href',"#");
		$("#lastPage").prop('href',"#");
	}
}

function allSelect(){
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
}
