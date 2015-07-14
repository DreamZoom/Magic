
//全局的唯一公众号ID
var currentFIndexNo = 0;
var currentPublicId = '';

mui.plusReady(function(){
	var commonUrl = app.ApiUrl;
	var serverUrl = commonUrl+"PublicNum/GetPublicNumById";
	var serverUrlB = commonUrl +"PublicNum/AddAttention";
	
	var view = plus.webview.currentWebview();
	var findexNo = view.findexNo;
	currentFIndexNo = findexNo;
	
	var userName = app.getUser().UserName;
	
	//隐藏
	$("#addAttention").hide();
	
	$.ajax(serverUrl,{
			data:{
				Id:	findexNo,
				userName:userName
			},
			dataType:'json',
			type:'post',
			timeout:50000,
			success:function(response){
				if(response.result){
					var data = response.data;
					$("#pubTitle").text(data.model.fName);	
					currentPublicId = data.model.ID;
					var html = template("publicInfo",response.data);
					document.getElementById("tagDiv").innerHTML = html;
					if(!data.fState){
						$("#addAttention").show();	
					}
				}else{
					mui.toast("未找到数据");
				}
				stopLoading();
			},
			error:function(xhr,type,errorThrown){
				mui.toast("获取公众号数据错误");
			} 
	});
	
	$("#goInfo").bind("click",function(){
		gotoDetail(currentFIndexNo);
	});
	
	$("#addAttention").bind("click",function(){
		addAttention(serverUrlB,currentPublicId,userName);
	});
});

//到介绍页面
var gotoIntro = function(){
	var view = plus.webview.currentWebview();
	var findexNo = view.findexNo;
	mui.openWindow({
		url:"publicIntro.html",
		id:"publicIntro",
		extras:{findexNo:findexNo},
		show:{
			autoShow:true  
		}
	});
}
 
//停止加载图标
var stopLoading = function(){
	plus.nativeUI.closeWaiting();
	mui.currentWebview.show();
}

var addAttention = function(serverUrl,publicId,userName){
	console.log(serverUrl+":"+publicId+":"+userName);
	$.ajax(serverUrl,{
			data:{
				fPublicNumId:publicId,
				userName:userName
			},
			dataType:'json',
			type:'post',
			timeout:50000,
			success:function(response){
				if("YES" ==response.message){
					gotoDetail(currentFIndexNo);
				}else{
					mui.toast("关注失败");
				}					
			},
			error:function(xhr,type,errorThrown){
				mui.toast("关注异常");
			} 
	});
}

//到详情页面
var gotoDetail = function(findexNo){
	mui.openWindow({
		url:"publicDetail.html",
		id:"publicDetail",
		extras:{findexNo:findexNo},
		show:{
			autoShow:false 
		}
	});
} 

var closeCurrentView = function(){
	var view = plus.webview.currentWebview();
	plus.webview.close(view.id,"none");
}
