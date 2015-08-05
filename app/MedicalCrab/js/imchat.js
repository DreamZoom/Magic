document.addEventListener("plusready", function() {
	// 声明的JS“扩展插件别名”
	var _BARCODE = 'imchat',
		B = window.plus.bridge;
	var imchat = {
		// 声明异步返回方法
		Login: function(username, password, successCallback, errorCallback) {
			var success = typeof successCallback !== 'function' ? null : function(args) {
					successCallback(args);
				},
				fail = typeof errorCallback !== 'function' ? null : function(code) {
					errorCallback(code);
				};
			callbackID = B.callbackId(success, fail);
			// 通知Native层plugintest扩展插件运行”PluginTestFunction”方法
			return B.exec(_BARCODE, "Login", [callbackID, username, password]);
		},
		Logout: function(successCallback, errorCallback) {
			var success = typeof successCallback !== 'function' ? null : function(args) {
					successCallback(args);
				},
				fail = typeof errorCallback !== 'function' ? null : function(code) {
					errorCallback(code);
				};
			callbackID = B.callbackId(success, fail);
			// 通知Native层plugintest扩展插件运行”PluginTestFunction”方法
			return B.exec(_BARCODE, "Logout", [callbackID]);
		},
		SendText: function(username,content,isgroup, successCallback, errorCallback) {
			var success = typeof successCallback !== 'function' ? null : function(args) {
					successCallback(args);
				},
				fail = typeof errorCallback !== 'function' ? null : function(code) {
					errorCallback(code);
				};
			callbackID = B.callbackId(success, fail);
			return B.exec(_BARCODE, "SendText", [callbackID, username,content,isgroup]);
		},
		// 声明同步返回方法
		SetOnReciveMessage: function(successCallback, errorCallback) {
			// 通知Native层plugintest扩展插件运行“PluginTestFunctionSync”方法并同步返回结果                       
			var success = typeof successCallback !== 'function' ? null : function(args) {
					successCallback(args);
				},
				fail = typeof errorCallback !== 'function' ? null : function(code) {
					errorCallback(code);
				};
			callbackID = B.callbackId(success, fail);
			return B.exec(_BARCODE, "SetOnReciveMessage", [callbackID]);

		},
		PluginTestFunctionSyncArrayArgu: function(Argus) {
			return B.execSync(_BARCODE, "PluginTestFunctionSyncArrayArgu", [Argus]);
		}
	};
	window.plus.imchat = imchat;
	
}, true);