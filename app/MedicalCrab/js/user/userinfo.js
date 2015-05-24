/*
 * 编辑资料
 */
mui.plusReady(function() {

	var user = app.getUser();
	app.log("--------------------------------------")
    app.log(user);
    app.forminit("userinfo",user);
    var self = plus.webview.currentWebview();
    var parent = plus.webview.getWebviewById(self.parentid);
    window.OnSuccess=function(data){
    	app.setUser(data);
    	app.forminit("userinfo",data);
    	mui.toast("编辑信息成功");
    	parent.reload();
    	self.close();
    }
	
});