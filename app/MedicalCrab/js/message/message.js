

mui.plusReady(function(){
	
	template.helper("imageFormat",function(image){
		return app.Request.ServerUrl+image;
	});
	//与谁聊天
	var self = plus.webview.currentWebview();
	var recivername = self.username;
	
	var user = app.getUser();
	
	var reciver,chat;
	var loading = plus.nativeUI.showWaiting();
	app.api.get("user/userinfo",{username:recivername},function(data){
	    reciver=data.data;
		
		chat=new Chat('ws://192.168.0.109:2014',user.UserName,reciver.UserName); 
		$(".mui-title").html(reciver.UserName); 
		loading.close();
	},function(){
		loading.close();
		self.close();
	});
	

	function Chat(url,username,reciver){
		url=url+"/"+username+"@"+reciver;
		
		this.socket=new WebSocket(url);
		
		var context =this;
		this.socket.onopen=function(){
			console.log("连接到服务器");
			//context.sendTextMessage("wxllzf","hello");
			
		}
		this.socket.onmessage=function(messageEvent){
			var message = JSON.parse(messageEvent.data);
			// alert(message.Content);
			reciveMessage(message.Content);
			// alert(message);
		}
		
		this.socket.onerror=function(){
			
		}
		
		this.sendTextMessage=function(text){
			var username=app.getUser().UserName;
			var message={
				ID:0,
				Sender:username,
				Reciver:reciver,
				Content:text,
				ContentType:0,
				MsgType:0,
				SendTime:"2015/6/9 ",
				ReciveTime:"2015/6/9",
				IsProc:false,
				IsRead:false,
				IsRecived:false
			};
	 
			this.socket.send(JSON.stringify(message));
		}
		
	}
	
	function sendMessage(message){
		var user=app.getUser();
		var data={
			user:user,
			message:{
				content:message
			}
		};
		//ChatLog(message);
		var h = template("template-talk2",data);
	    $(".messages").append(h);
	}
	
	function reciveMessage(message,user){
		var user=app.getUser();
		var data={
			user:reciver,
			message:{
				content:message
			}
		};
		var h = template("template-talk1",data);
	    $(".messages").append(h);
	}
 
    function ChatLog(message){
    	var key=user.UserName+"-"+reciver.UserName;
    	app.storage.setItem(key,message);
    }

	mui(document).on("tap","#btn_send",function(){
		
		var txt =$("#chat_text").val();
		sendMessage(txt);
		chat.sendTextMessage(txt);
	});
});
