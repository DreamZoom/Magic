/*
 * app
 */

(function(win) {

	win.app = {};

	//api服务器地址
	app.RomateUrl = "http://192.168.0.111/api/";



})(window);


(function(mui,win) {

	win.app.network = {
		post: function(url,data,success) {
			console.log(url);
		    $.ajax({
		    	type:"post",
		    	url:url,
		    	data:data,
		    	success:function(data){
		    		if(data.result){
		    			if(success){
		    				success(data);
		    			}
		    			else{
		    				mui.toast(data.message);
		    			}
		    		}
		    		else{
		    			mui.toast(data.message);
		    		}
		    	},
		    	error:function(){
		    		mui.toast("网络连接错误！");
		    	}
		    });
            //mui.post(url, data, success, "json");
		},
		get:function(url,data,success){
			//mui.getJSON(url, data, success);
		}
	};

})(mui,window);