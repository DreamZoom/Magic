(function(){
	function Chat(opt){	
		var options={
			url:"",
			Sender:{},
			Reciver:{},
			OnReciveMessage:function(d){},
			OnSendMessage:function(d){},
			OnError:function(){},
			OnHistory:function(){}
		};
		
		var opts= $.extend(options, opt);
		
		url=opts.url+"/"+opts.Sender.UserName+"@"+opts.Reciver.UserName;
		
		this.socket=new WebSocket(url);
		
		this.connected=false;
		
		var context =this;
		
		this.socket.onopen=function(){
			//连接到服务器
			this.connected=true;
		}
		this.socket.onmessage=function(messageEvent){
			var message = JSON.parse(messageEvent.data);
			// 接受消息
			opts.OnReciveMessage(message);
			// alert(message);
			context.Log(message);
		}
		
		this.socket.onerror=function(e){
			opts.OnError(e);
		}
		
		this.SendTextMessage=function(text){
			
			var message={
				ID:0,
				Sender:opts.Sender.UserName,
				Reciver:opts.Reciver.UserName,
				Content:text,
				ContentType:0,
				MsgType:0,
				SendTime:new Date(),
				ReciveTime:new Date(),
				IsProc:false,
				IsRead:false,
				IsRecived:false
			};	        
			this.socket.send(JSON.stringify(message));
			context.Log(message);
			
			opts.OnSendMessage(message);
		}
		
		this.Log=function(message){
			var key=opts.Sender.UserName+"@"+opts.Reciver.UserName;
			var messages=app.storage.getItem(key);
			if(!(messages instanceof Array)) {
				messages=[];
			}
			messages.push(message); 
    	    app.storage.setItem(key,messages);
    	    
    	    app.ChatHistory(opts.Reciver,message);
		}
		
		this.InitHistory=function(){
			var key=opts.Sender.UserName+"@"+opts.Reciver.UserName;
			var messages=app.storage.getItem(key);
			if(!(messages instanceof Array)) {
				messages=[];
			}		
			opts.OnHistory(messages);
		}
		
		this.InitHistory();
	}
	
	window.Chat=Chat;
})();

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
		 
		chat=new Chat({
			url:'ws://192.168.0.109:2014',
			Sender:user,
			Reciver:reciver,
			OnReciveMessage:function(message){
				reciveMessage(message);
			},
			OnSendMessage:function(message){
				sendMessage(message);
			},
			OnHistory:function(messages){
				messages.forEach(function(msg,i){
					if(msg.Sender==user.UserName){
						sendMessage(msg);
					}
					else{
						reciveMessage(msg);
					}
				});
			},
			OnError:function(){
				
			}
		});
		$(".mui-title").html(reciver.UserName); 
		loading.close();
	},function(){
		loading.close();
		self.close();
	});
	
    function scroll_buttom(){
    	
        setTimeout(function(){
        	 var h = $(document).height()-$(window).height();
             $(document).scrollTop(h);
        },100);
       
    }

	function sendMessage(message){
		var user=app.getUser();
		var data={
			user:user,
			message:message
		};		
		var h = template("template-talk2",data);
	    $(".messages").append(h);
	    scroll_buttom();
	}
	
	function reciveMessage(message){
		var data={
			user:reciver,
			message:message
		};
		var h = template("template-talk1",data);
	    $(".messages").append(h);
	    scroll_buttom(); 
	}

    

	mui(document).on("tap","#btn_send",function(){		
		var txt =$("#chat_text").val();
		if(!txt || txt=="") return;
		chat.SendTextMessage(txt);
		$("#chat_text").val("");
	});
});
