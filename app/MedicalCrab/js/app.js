/*
 * app
 */

(function(win) {

	win.app = {};

    app.log=function(obj){
    	if(typeof(obj) =="object"){
    		for (var p in obj) {
    			console.log(p);
                app.log(obj[p]);
			}
    	}
    	else if(typeof(obj) =="string" || typeof(obj) =="boolean" || typeof(obj) =="number")
    	{
    		console.log(obj);
    	}
    	else if(typeof(obj) =="function"){
    		console.log(obj);
    	}
    }
	//api服务器地址
	app.RomateUrl = "http://192.168.0.111/api/";

	app.open = function(url, params) {
		var page = plus.webview.getWebviewById(url);
		if (page) {
			page.show();
			return;
		}

		mui.openWindow({
			id: url,
			url: url,
			waiting: {
				autoShow: true
			},
			show: {
				duration: 100,
				aniShow: "pop-in"
			}
		});
	}

	app.getToken = function() {
		return plus.storage.getItem("user-token");
	}

	app.setToken = function(token) {
		plus.storage.setItem("user-token", token);
	}

	app.checkToken = function() {
		var token = app.getToken();
		if (!token) {
			app.open("/pages/user/login.html");
		}
	}

})(window);


(function(mui, win) {

	win.app.network = {
		post: function(url, data, success, error) {
			console.log(url);
			$.ajax({
				type: "post",
				url: url,
				data: data,
				success: function(data) {
					if (data.result) {
						if (success) {
							success(data);
						} else {
							mui.toast(data.message);
						}
					} else {
						mui.toast(data.message);
						if (error) {
							error(data.message);
						}
					}
				},
				error: function(err) {
					mui.toast("网络连接错误！");
					if (error) {
						error(err);
					}
				}
			});
			//mui.post(url, data, success, "json");
		},
		get: function(url, data, success, error) {
			//mui.getJSON(url, data, success);
			$.ajax({
				type: "get",
				url: url,
				data: data,
				success: function(data) {
					if (data.result) {
						if (success) {
							success(data);
						} else {
							mui.toast(data.message);
						}
					} else {
						mui.toast(data.message);
						if (error) {
							error(data.message);
						}
					}
				},
				error: function(err) {
					mui.toast("网络连接错误！");
					if (error) {
						error(err);
					}
				}
			});
		}
	};


	win.app.page = {
		open: function(url, params) {
			console.log(url + "page.open")
			var page = plus.webview.getWebviewById(url);
			if (page) {
				page.show();
				return;
			}

			mui.openWindow({
				id: url,
				url: url,
				waiting: {
					autoShow: true
				},
				show: {
					duration: 100,
					aniShow: "pop-in"
				}
			});
		}
	};

})(mui, window);


//api
(function(mui, win) {

	win.app.api = {};

	win.app.api.get = function(api, data, success, error) {
		var apiurl = app.RomateUrl + api;
		app.network.get(apiurl, data, success, error);
	};

	win.app.api.post = function(api, data, success, error) {
		var apiurl = app.RomateUrl + api;
		app.network.post(apiurl, data, success, error);
	};

})(mui,window);


///tools
mui.ready(function() {

	/*
	 * a 标签跳转
	 */
	mui(document).on('tap', 'a', function() {
		var url = this.getAttribute("href");
		if (!url) return;
		var container = this.getAttribute("data-container"); ///框架id
		if (!container) {
			window.app.open(url);
			return;
		}

	});


	/*
	 * 提交form
	 *
	 */
	function getJson(str) {
		var parms = str.split('&');
		var jsonobj = {};
		parms.forEach(function(s, i) {
			console.log(i);
			var p = s.split('=');
			if (p.length == 2) {
				jsonobj[p[0]] = p[1];
			}
		});
		return jsonobj;
	}

	mui(document).on('tap', 'submit', function() {
		var target = this.getAttribute("target-id");

		var str = ($("#" + target).serialize());
		console.log(str);
		var json = getJson(str);
		var api = $("#" + target).attr("data-api");
		var event = $("#" + target).attr("data-success-event");

		var spinner = $("<i class='fa fa-spinner fa-spin'></i>").appendTo($(this));
		app.network.post(app.RomateUrl + api, json, function(data) {
			spinner.remove();
			var evalJs = event + "(data.data);";
			try {
				eval(evalJs);
			} catch (e) {
				//TODO handle the exception
				//salert("ww");
			}
		}, function() {
			spinner.remove();
		});
	});
});