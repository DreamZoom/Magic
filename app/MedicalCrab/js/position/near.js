mui.plusReady(function(){
	
	var pos = app.storage.getItem("position");
	
	app.api.get("Position/GetNearUser",{Latitude:pos.Latitude,Longitude:pos.Longitude},function(response){
		app.log("附近的人有:--------------------------S");
		app.log(response);
	},function(){
		
	});
	
});