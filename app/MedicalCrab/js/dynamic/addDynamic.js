
/*全局变量*/
var spanClass = [{tagClass:"mui-badge"},
	{tagClass:"mui-badge mui-badge-primary"},
	{tagClass:"mui-badge mui-badge-success"},
	{tagClass:"mui-badge mui-badge-warning"},
	{tagClass:"mui-badge mui-badge-danger"},
	{tagClass:"mui-badge mui-badge-purple"}
];

/*MUI 涉及HTML5 扩展API建议都写在MUI.plusReady()中*/
mui.plusReady(function(){
	document.getElementById("photos").addEventListener('tap',function(){
		var btn = [{title:"拍照"},{title:"从相册选择"}];
		plus.nativeUI.actionSheet({
			title:"选择照片",
			cancel:"取消",
			buttons:btn
		},function(e){
			//获取序号
			var Array = document.getElementsByName("imgTag");
			var currentIndex = 0;
			if(undefined==Array){
				currentIndex = 0;
			}else{
				currentIndex = Array.length;
			}
			//var ulHtml = $("#ImageList").html();
			var ulHtml = '<li class="mui-table-view-cell mui-media mui-col-xs-3">';
			ulHtml += '<img name="imgTag" class="mui-media-object" src="#" style="width:100%;height:100%;">';
			ulHtml += '</li>';
			
			
			var index = e.index;
			var txt = "";
			switch(index){
				case 0:txt="AAAA"; break;
				case 1:
				var camera = plus.camera.getCamera();
				var fmt = camera.supportedImageFormats[0];
				var res = camera.supportedImageResolutions[0];
				camera.captureImage(function(path){
					//转换为本地资源可以直接为Img添加src属性则可以预览
					plus.io.resolveLocalFileSystemURL(path,function(entry){
//						var pic = document.getElementsByName("imgTag");   
//	    				pic[currentIndex].src = entry.toLocalURL();
						ulHtml = ulHtml.replace("#",entry.toLocalURL());
	    				$("#ImageList").append(ulHtml);
					},function(errors){
						mui.toast(errors);
					});
				},function(errors){ 
					//mui.toast(errors);
				},{resolution:res,format:fmt});
				
				break;
				case 2:
				plus.gallery.pick(function(ePath){
					alert(currentIndex);
//					var pic = document.getElementsByName("imgTag");   
//	    				pic[currentIndex].src = ePath;
	    				ulHtml = ulHtml.replace("#",ePath);
	    				$("#ImageList").append(ulHtml);
				},function(error){},{filter:"image",multiple:false});
				break;
			}
		});
	});
	
	plus.storage.removeItem("TagKey");
	//添加标签
	$("#aTag").click(function(){
		var currentKey = plus.storage.getItem("TagKey");
		if(undefined == currentKey || 4 > currentKey){
			prompt_dialog();
		}else{
			mui.toast("最多能添加4个标签");	
		}
	});
	
	$("#btnSend").click(function(){
		var content = $("#txtContent").val(); 
		if(0 == content.length){
			mui.toast("请填写动态内容");
			return false;
		} 
		
		var pic = $('img[name="imgTag"]').src;
		var tag001 = $("#tag001").html();
		var tag002 = $("#tag002").html();
		var tag003 = $("#tag003").html();
		var tag004 = $("#tag004").html();
		var serverUrl = app.ApiUrl + "Dynamic/Add";

		console.log(serverUrl+app.getUser().UserName+"::"+tag002);
		
		if(undefined == pic){
			$.ajax(serverUrl+"?username="+app.getUser().UserName,{
					data:{
						fContent:content,
						fImage:"",
						fImageCount:"0",
						fTag1:tag001,
						fTag2:tag002,
						fTag3:tag003,
						fTag4:tag004,
						fType:"1"
					},
					dataType:'json',
					type:'post',
					timeout:10000,
					success:function(data){
						if("NO" == data.result){
							mui.toast("发布动态失败");
						}else{
							//mui.currentWebview().close();
						}
					},
					error:function(xhr,type,errorThrown){
						mui.toast("请求错误");
					} 
				});
		}else{
//			var task = plus.uploader.createUpload("url",
//			{method:"post",blocksize:204800,timeout:10000,retry:2},
//			function(t,state){
//				//成功
//				if(200 == state){
//					
//				}else{
//					
//				}
//			});
//			//添加任务
//			pic.forEach(item){
//				task.addFile(item,{key:"",name:"",mime:""});
//			}
			
		}	
	});
});




/*退出页面，提示对话框*/
var old_back = mui.back;
mui.back = function(){
	var btn = ["退出","取消"];
	mui.confirm("退出此次编辑？","提示",btn,function(e){
		if(0 == e.index){
			old_back();
		};
	});
};

/*添加标签*/
var prompt_dialog = function(){
	var btn = ["取消","确定"];
	mui.prompt("请输入标签","给自己的动态加个标签吧","添加标签",btn,function(e){
		var content = e.value;
		if(undefined == content){
			mui.toast("请输入标签内容");
			return false;
		}
		
		if(5 < content.length){
			mui.toast("标签不能超过5个字");
			return false;
		}
		
		if(1 == e.index){
			//提交信息
			$("#tagTitle").text("动态标签：");
			var currentKey = plus.storage.getItem("TagKey");

			if(undefined == currentKey){
				currentKey = 1;
			}else{
				currentKey++;
			}
			plus.storage.setItem("TagKey",currentKey.toString());
			var tagId = 'tag00'+currentKey;
			$("#"+tagId).html(content);
		}
	});
};	


/*获取未设置值的标签*/
var findIndex = function(index){
	var tag = $("#tag00"+index);
	if(null == tag ||  undefined == tag) return $("#tag00"+(index-1));
	
	var content = tag.text();
	if(content.length == 0) return tag;
	 findIndex(index+1);
};

/*获得0-5的随机数*/
var getRandom = function(){	
	return parseInt(Math.random()*6);
};

/*获取一个0-5数字随机序列*/
var getNumList = function(list){
	if(6 == list.length) return list;
	
	var num = getRandom();
	$.each(list, function(index,value) {    
		if(value == num){
		}
	});
	list.push()
};


