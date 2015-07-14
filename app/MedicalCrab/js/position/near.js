mui.plusReady(function(){
	
	var pos = app.storage.getItem("position");
	template.helper("imageFormat",function(image){
		return app.Request.ServerUrl+image;
	});
	var historydata=app.storage.getItem("user-position-history");
	if(historydata){
		var html = template("near-list",{data:historydata});
		$("#list").html(html);
	}
	
	var loading = plus.nativeUI.showWaiting();
	app.api.get("Position/GetNearUser",{Latitude:pos.Latitude,Longitude:pos.Longitude},function(response){	
		app.storage.setItem("user-position-history",response.data);
		var html = template("near-list",{data:response.data});
		$("#list").html(html);
		loading.close(); 
	},function(error){
		loading.close(); 
	});

	//点击附近的人
	mui(document).on("tap","a[user]",function(){
		//app.open("../user/showuser.html");
		var username=this.getAttribute("data-username");
		app.open("../message/chat.html",{username:username});
	});
	
});