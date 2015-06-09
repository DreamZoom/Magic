
mui.plusReady(function(){
	
	function Chat(url,username){
		url=url+"/"+username;
		
		this.socket=new WebSocket(url);
		
		var context =this;
		this.socket.onopen=function(){
			console.log("连接到服务器");
			//context.sendTextMessage("wxllzf","hello");
			
		}
		this.socket.onmessage=function(messageEvent){
			var message = JSON.parse(messageEvent.data);
			alert(message.Content);
			// alert(message);
		}
		
		this.socket.onerror=function(){
			
		}
		
		this.sendTextMessage=function(user,text){
			var username=app.getUser().UserName;
			var message={
				ID:0,
				Sender:username,
				Reciver:user,
				Content:text,
				ContentType:0,
				MsgType:0,
				SendTime:"2015/6/9 ",
				ReciveTime:"2015/6/9",
				IsProc:false
			};
	 
			this.socket.send(JSON.stringify(message));
		}
		
	}
	
	var chat=new Chat('ws://192.168.1.53:2014',"wxllzf"); 
	
	
	mui(document).on("tap","#btn_send",function(){
		
		var txt =$("#chat_text").val();
		chat.sendTextMessage("wxllzf",txt);
	});
});
