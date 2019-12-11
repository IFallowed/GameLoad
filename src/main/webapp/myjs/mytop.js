$(function(){
	if("" == $("#loginName a").text().trim() || null == $("#loginName a").text().trim()){
		$("#loginName").addClass("hidden");
	}
	else {
		$("#loginName").removeClass("hidden");
		$("#loginName").prev().addClass("hidden");
		$("#quit_btn").removeClass("hidden");
	}
});