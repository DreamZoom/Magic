(function(win){
	
	
	win.user={};
	
	//登录处理
	win.user.logined=function(data){
		if(data.token){
			app.setToken(data.token);
			app.setUser(data.user);			
			var self =plus.webview.currentWebview();
			
			app.open("center.html");
			self.close();
		}
		else{ 
			mui.toast("token 无效");
		}
	}
	
})(window);
