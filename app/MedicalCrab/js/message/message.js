(function(){
	
	
	function Chat(url,username){
		url+=url+"/"+username;
		
		this.socket=new WebSocket('ws://localhost:2014');
		
		var context =this;
		this.socket.onopen=function(){
			console.log("连接到服务器");
			context.sendTextMessage("aa","hello");
			
		}
		this.socket.onmessage=function(){
			
		}
		
		this.socket.onerror=function(){
			
		}
		
		this.sendTextMessage=function(user,text){
			var message={
				ID:null,
				Sender:"wxllzf",
				Reciver:user,
				Content:text,
				ContentType:0,
				MsgType:0,
				SendTime:"",
				ReciveTime:null,
				IsProc:false
			};
	 
			this.socket.send(JSON.stringify(message));
		}
		
	}
	
	var chat=new Chat();
	
	//chat.sendTextMessage("aa","hello");
	
})();
