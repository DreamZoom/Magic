mui.plusReady(function(){
	
	var user = app.getUser();
	
	template.helper("imageFormat",function(image){
		return app.Request.ServerUrl+image;
	});
	
	app.api.get("user/getFriends",{username:user.UserName},function(result){
		var html = template("template-friend-list",{users:result.data});
		$("#friend-list").append(html); 
	});
	
});