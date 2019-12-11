$(function(){
	if("" == $("#loginName a").text().trim() || null == $("#loginName a").text().trim()){
		$("#loginName").addClass("hidden");
		$("#loginName").next().addClass("hidden");
		$("#loginName").prevAll().removeClass("hidden");
	}
	else {
		$("#loginName").removeClass("hidden");
		$("#loginName").next().removeClass("hidden");
		$("#loginName").prevAll().addClass("hidden");
	}
});