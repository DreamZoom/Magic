mui.plusReady(function(){
	window.app.api.get("User/UserInfo",{username:"wxllzf"},function(data){
		app.log(data);
	})
	
});