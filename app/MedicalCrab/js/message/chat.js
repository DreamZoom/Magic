mui.plusReady(function() {

	template.helper("imageFormat", function(image) {
		return app.Request.ServerUrl + image;
	});
	//与谁聊天
	var self = plus.webview.currentWebview();
	var recivername = self.username;

	var user = app.getUser();

	var reciver, chat;
	var loading = plus.nativeUI.showWaiting();
	app.api.get("user/userinfo", {
		username: recivername
	}, function(data) {
		reciver = data.data;
        InitChat(user.UserName,recivername);
		$(".mui-title").html(reciver.UserName);
		loading.close();
	}, function() {
		loading.close();
		self.close();
	});

	function InitChat(user,touser) {
		
		
		plus.imchat.Login(user, "123456", function() {
			 
		}, function() {
			alert("error");
		});
		setTimeout(function() {
			plus.imchat.SetOnReciveMessage(touser,function(msg) {
				reciveMessage(msg.message);
			});
		}, 1000);
	}

	function scroll_buttom() {

		setTimeout(function() {
			var h = $(document).height() - $(window).height();
			$(document).scrollTop(h);
		}, 100);

	}

	function sendMessage(message) {

		plus.imchat.SendText(reciver.UserName, message, false, function() {
			var user = app.getUser();
			var data = {
				user: user,
				message: message
			};
			var h = template("template-talk2", data);
			$(".messages").append(h);
			scroll_buttom();
		}, function() {
			alert("发送失败");
		})

	}

	function reciveMessage(message) {
		var data = {
			user: reciver,
			message: message
		};
		var h = template("template-talk1", data);
		$(".messages").append(h);
		scroll_buttom();
	}



	mui(document).on("tap", "#btn_send", function() {
		var txt = $("#chat_text").val();
		if (!txt || txt == "") return;
		sendMessage(txt);
		$("#chat_text").val("");
	});
});