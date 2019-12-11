$(function(){
	//渲染select选择框
	initSelect();
	//初始化添加表单里的下拉框
	initSaveSelect();
	//渲染分页
	initLoad();
	//全选/全不选
	allSelect();
	
	
	$("#search").click(function(){
		var provId =  $("#AllProvinces").val() == 0 ? "" :  $("#AllProvinces").val();
		window.location.href = "exchange/queryByCondition?provId=" + provId;
	});
	
	$("#submitBtn").click(function(){
		var form = document.getElementById('saveform');
        form.submit();
        $("#myModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
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
		    var flag = confirm("确定删除id为" + groups + "的兑换比例吗?");
			if(flag == true){
				$.ajax({
					type:"post",
					url:"exchange/delete",
					data:{
						ids:groups
					},
					dataType:"json",
					success:function(result){
						if(result.code == "200"){
							alert("删除成功");
							location.href="../../manager/exchange";
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
		url:"exchange/getAllProvinces",
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

function initSaveSelect(){
	$.ajax({
		type:"post",
		url:"exchange/getNoSaveExchange",
		data:{},
		dataType:"json",
		success:function(result){
			if(result.code == "200"){
				var arr = result.typeNames;
				if(result.typeNames.length > 0){
					$("#save").removeClass("invalid");
					for(var i=0;i<result.typeNames.length;i++){
						var id = arr[i].id;
						var name = arr[i].name;
						$("#noSaveExchange").append("<option value='"+id+"'>"+name+"</option>");
					}
				}
				else{
					$("#save").addClass("invalid");
				}
			}
		}
	})
}

function initLoad() {
	var provId = $("#selector").val();

	var	pageNo = parseFloat($("#pageNo").text().trim());
	var totalPage = parseFloat($("#totalPage").val().trim());
	
	var preNo = pageNo - 1;
	var nextNo =pageNo + 1;

	if(preNo != 0){
		$("#firstPage").prop("href","/manager/exchange?pageNo=1&provId=" + provId);
		$("#prePage").prop("href","/manager/exchange?pageNo="+preNo+"&provId=" + provId);
	}
	else{
		$("#firstPage").prop('href',"#");
		$("#prePage").prop('href',"#");
	}
	
	if(nextNo != totalPage + 1){
		$("#nextPage").prop("href","/manager/exchange?pageNo="+nextNo+"&provId=" + provId);
		$("#lastPage").prop("href","/manager/exchange?pageNo="+totalPage+"&provId=" + provId);
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
