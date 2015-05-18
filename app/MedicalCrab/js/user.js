(function(win){
	
	
	win.user={};
	
	//登录处理
	win.user.logined=function(data){
		if(data.token){
			app.setToken(data.token);
			app.open("center.html");
		}
		else{ 
			mui.toast("token 无效");
		}
	}
	
})(window);
