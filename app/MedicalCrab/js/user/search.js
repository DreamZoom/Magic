mui.plusReady(function() {

	var user = app.getUser();

	template.helper("imageFormat", function(image) {
		return app.Request.ServerUrl + image;
	});



	mui(document).on("tap", ".btn-search", function() {
		
		var username = $("#username").val();
		
		if(!username){
		   plus.nativeUI.alert("请输入用户名!");
		   return; 
		}
		
		app.api.get("user/SearchUser", {
			username: username
		}, function(result) {
			var html = template("template-result-list", {
				users: result.data
			});
			$("#user-search-list").html(html);
		});
	});

});