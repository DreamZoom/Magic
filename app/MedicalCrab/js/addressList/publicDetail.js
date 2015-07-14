
mui.plusReady(function(){
	var serverUrl = app.ApiUrl+"PublicNum/GetPublicNumById";
	var view = plus.webview.currentWebview();
	var findexNo = view.findexNo;
	var userName = app.getUser().UserName;

	$.ajax(serverUrl,{
			data:{
				Id:findexNo,
				userName:userName
			},
			dataType:'json', 
			type:'post',
			timeout:50000,
			success:function(response){
				if(response.result){
					var data = response.data;
					$("#pubTitle").text(data.model.fName);
					$("#imgId").attr("src",data.model.fImage);
					$("#pName").text(data.model.fName);
					$("#publicNo").text(data.model.fNo);
					plus.nativeUI.closeWaiting();
					mui.currentWebview.show();
				}else{
					mui.toast("未找到数据");
				}					
			},
			error:function(xhr,type,errorThrown){
				mui.toast("获取公众号数据错误");
			} 
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
			autoShow:false  
		}
	});
}

var closeCurrentView = function(){
	var view = plus.webview.currentWebview();
	plus.webview.close(view.id,"none");
}
