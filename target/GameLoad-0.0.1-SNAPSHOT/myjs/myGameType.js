$(function(){

	
	initLoad();
	allSelect();
	
	$("#query").click(function(){
		var name = $.trim($("#name").val());
		var status =  $("#status").val() == 0 ? "" :  $("#status").val();
		window.location.href = "gametype/queryByCondition?name=" + name + "&status=" + status;
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
			alert("未选中需要删除的游戏类型，请选中后删除");
		}
		else{
			var groups = ids.join(",");
		    var flag = confirm("确定删除id为" + groups + "的游戏类型吗?");
			if(flag == true){
				$.ajax({
					type:"post",
					url:"gametype/delete",
					data:{
						ids:groups
					},
					dataType:"json",
					success:function(result){
						if(result.code == "200"){
							alert("删除成功");
							location.href="../../manager/gametype";
						}
						else if(result.code == "201"){
							alert("此游戏类型下有游戏存在，请先删除该类型下的游戏后再删除此类型");
						}
					}
				})
			}
		}
	    
	});
	
	$("input[name='name']").blur(function(){
		var name = $(this).val();
		$.ajax({
			type:"post",
			url:"gametype/checkName",
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
	
});

function initLoad() {
	if($("#selector").val() == "" ){
		$("#status").val("0");
	}
	else{
		$("#status").val($("#selector").val());
	}
	
	var name = $("#name").val().trim();
	var status = $("#selector").val();

	var	pageNo = parseFloat($("#pageNo").text().trim());
	var totalPage = parseFloat($("#totalPage").val().trim());
	
	var preNo = pageNo - 1;
	var nextNo =pageNo + 1;

	if(preNo != 0){
		$("#firstPage").prop("href","/manager/gametype?pageNo=1&name="+name+"&status="+status);
		$("#prePage").prop("href","/manager/gametype?pageNo="+preNo+"&name="+name+"&status="+status);
	}
	else{
		$("#firstPage").prop('href',"#");
		$("#prePage").prop('href',"#");
	}
	
	if(nextNo != totalPage + 1){
		$("#nextPage").prop("href","/manager/gametype?pageNo="+nextNo+"&name="+name+"&status="+status);
		$("#lastPage").prop("href","/manager/gametype?pageNo="+totalPage+"&name="+name+"&status="+status);
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