
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
			// alert(message.Content);
			reciveMessage(message.Content);
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
	
	var chat=new Chat('ws://192.168.0.111:2014',"wxllzf"); 
	
	function sendMessage(message,user){
		var user=app.getUser();
		var data={
			user:user,
			message:{
				content:message
			}
		};
		var h = template("template-talk2",data);
	    $(".messages").append(h);
	}
	
	function reciveMessage(message,user){
		var user=app.getUser();
		var data={
			user:user,
			message:{
				content:message
			}
		};
		var h = template("template-talk1",data);
	    $(".messages").append(h);
	}
	
	mui(document).on("tap","#btn_send",function(){
		
		var txt =$("#chat_text").val();
		sendMessage(txt,"");
		chat.sendTextMessage("wxllzf",txt);
	});
});
