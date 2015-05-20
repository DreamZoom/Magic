(function(win){
	
	
	win.user={};
	
	//登录处理
	win.user.logined=function(data){
		if(data.token){
			app.setToken(data.token);
			app.setUser(data.user);
			
			var self =plus.webview.currentWebview();
			app.open("center.html");
//			setTimeout(function(){
//				self.close();
//			},1000);
			app.log(app.getUser());
		}
		else{ 
			mui.toast("token 无效");
		}
	}
	
})(window);
