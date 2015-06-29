mui.plusReady(function(){
	
	var user=app.getUser();
	
	template.helper("imageFormat",function(image){
		return app.Request.ServerUrl+image;
	});
	
	var html = template("usercard-template",{user:user});
    $("#card-content").html(html);
	
});