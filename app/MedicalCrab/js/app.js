/*
 * app
 */
(function(win) {

	win.app = {};

	/*
	 * 输出对象属性值，以调试app
	 */
	app.log = function(obj, deep) {
		var _str = "";
		if (deep) {
			_str += "|-"
			for (var i = 0; i < deep; i++) _str += "--";
		}
		_str += "   ";
		if (typeof(obj) == "object") {
			for (var p in obj) {
				console.log(_str + p);
				app.log(obj[p], deep + 1);
			}
		} else if (typeof(obj) == "string" || typeof(obj) == "boolean" || typeof(obj) == "number") {
			console.log(_str + obj);
		} else if (typeof(obj) == "function") {
			console.log(_str + obj);
		}
	}

	//api服务器地址
	app.RomateUrl = "http://192.168.0.109:2835/";
	//app.RomateUrl = "http://192.168.1.53:2835/";
	app.ApiUrl = app.RomateUrl + "api/";
	//全局对象
	app.Request = {
		ServerUrl: app.RomateUrl,
		ApiUrl: app.ApiUrl
	};

	/*
	 * 打开一个窗口
	 */
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
				duration: 160,
				aniShow: "pop-in"
			},
			extras: params
		});
	}


	/*
	 *  获取用户
	 */
	app.getUser = function() {
		return app.storage.getItem("user");
	}

	/*
	 *  缓存user
	 */
	app.setUser = function(user) {
		app.storage.setItem("user", user);
	}

	/*
	 * 获取访问令牌
	 */
	app.getToken = function() {
		return app.storage.getItem("user-token");
	}

	/*
	 *  设置访问令牌（登录时设置 ）
	 */
	app.setToken = function(token) {
		app.storage.setItem("user-token", token);
	}

	/*
	 * 检测令牌是否合法
	 */
	app.checkToken = function() {
		var token = app.getToken();
		if (!token) {
			app.open("/pages/user/login.html");
		}
	}

	app.storage = {
		setItem: function(key, value) {
			var s = JSON.stringify(value);
			plus.storage.setItem(key, s);
		},
		getItem: function(key) {
			var s = plus.storage.getItem(key);
			return JSON.parse(s);
		}
	};


	app.serializeform = function(formid) {

		function toJson(str) {
			var parms = str.split('&');
			var jsonobj = {};
			parms.forEach(function(s, i) {
				var p = s.split('=');
				if (p.length == 2) {
					jsonobj[p[0]] = p[1];
				}
			});
			return jsonobj;
		}
		var str = ($("#" + formid).serialize());
		str = decodeURIComponent(str);
		return toJson(str);
	}

	app.forminit = function(id, obj) {
		$("#" + id).find("input").each(function(i, element) {
			var filed = $(this);
			var filedname = filed.attr("name");
			filed.val(obj[filedname]);
		});

		$("#" + id).find("textarea").each(function(i, element) {
			var filed = $(this);
			var filedname = filed.attr("name");
			filed.val(obj[filedname]);
		});
	}

})(window);





(function(mui, win) {

	win.app.network = {
		post: function(url, data, success, error) {
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

})(mui, window);




// api的请求处理
(function(mui, win) {

	win.app.api = {};

	win.app.api.get = function(api, data, success, error) {
		var apiurl = app.ApiUrl + api;
		app.log(apiurl);
		app.network.get(apiurl, data,
			function(data) {
				if (data.data) {
					data.data.request = app.Request;
					if (success) {
						success(data);
					}
				}
			}, error);
	};

	win.app.api.post = function(api, data, success, error) {
		var apiurl = app.ApiUrl + api;
		app.log(apiurl);
		app.network.post(apiurl, data, success, error);
	};



})(mui, window);



mui.plusReady(function() {

	/*
	 * 用户地理位置更新
	 */
	app.updatelocation = function() {
        
		plus.geolocation.getCurrentPosition(function(position) {
			var lasttime = app.storage.getItem("position-datetime");
			if(lasttime){
				var nowtime =new Date();
				var difftime=nowtime-lasttime;
				var days=Math.floor(difftime/(60*1000));
				if(days<30) return;
			}
			var user =app.getUser();
			if(!user)return;
			var result =mui.extend({UserName:user.UserName},position.coords);
			app.api.post("user/UpdateLocation",result,function(response){
				if(response.result){
					//alert(response.data);
				     app.storage.setItem("position",response.data);
				     app.storage.setItem("position-datetime",new Date());
				}
			},function(){
				 
			});	
		}, function() {
			mui.toast("获取地理位置失败");
		})

	}
    app.updatelocation();
	/*
	 * 初始化app.request
	 */

	app.Request.User = app.getUser();

	/*
	 * a 标签处理
	 */

	mui(document).on('tap', 'a', function() {

		var url = this.getAttribute("href");
		if (!url || url.indexOf("#") >= 0) return;
		var container = this.getAttribute("data-target"); ///框架id
		if (!container) {
			window.app.open(url);
			return;
		} else {
			app.log(container);
			app.log(url);
			var view = plus.webview.getWebviewById(container);
			if (view) {
				app.log(url);
				view.loadURL(url);
			} else {
				window.app.open(url);
			}
		}

	});


	mui(document).on('tap', 'submit', function() {
		var target = this.getAttribute("target-id");

		var json = app.serializeform(target);
		var form = $("#" + target);
		var api = form.attr("data-api");
		var event = form.attr("data-success-event");
		var params = form.attr("data-params");
		if (params) {
			eval("var pj=" + params);
			json = mui.extend(json, pj);
		}
		alert(api);
		app.log(api)
		var spinner = $("<i class='fa fa-spinner fa-spin'></i>").appendTo($(this));
		app.api.post(api, json, function(data) {
				spinner.remove();
				var evalJs = event + "(data.data);";
				try {
					eval(evalJs);
				} catch (e) {
					//TODO handle the exception
					//salert("ww");
				}
			},
			function() {
				spinner.remove();
			});
	});

	$("content").each(function(index, el) {
		var api = $(el).attr("data-api");
		var tid = $(el).attr("data-template");
		var username = app.getUser().UserName;
		if (api && tid) {
			var d = localStorage.getItem("api/" + api);
			var source = $("#" + tid).html();
			var template = Handlebars.compile(source);
			$(el).html(template(d));
			var loading = plus.nativeUI.showWaiting();
			app.api.get(api, {
					username: username
				},
				function(data) {
					loading.close();
					app.log(data.data);
					localStorage.setItem("api/" + api, data.data);
					$(el).html(template(data.data));
				},
				function(err) {
					loading.close();
				});
		}
	});
});