
mui.plusReady(function(){	
	getPublicNumByUserName();
});

var getPublicNumByUserName = function(){
	//pageSize为0则直接显示全部
	var serverUrl = app.ApiUrl+"PublicNum/GetPublicNumList";

	$.ajax(serverUrl,{
			data:{
				userName:app.getUser().UserName,
				pageSize:0						
			},
			dataType:'json',
			type:'post',
			timeout:50000,
			success:function(response){
				if(response.result){
					var data = response.data;
					var html = template("publicList",data);
					document.getElementById("allList").innerHTML = html;
				}else{
					if("UserNameError" == response.message){
						mui.toast("获取数据参数错误");
					}else if("UserNull" == response.message){
						mui.toast("获取数据参数错误");
					}else{
						mui.toast("获取公众号数据异常");
					}
				}
				stopLoading();
			},
			error:function(xhr,type,errorThrown){
				mui.toast("获取公众号数据错误");
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

//停止加载图标
var stopLoading = function(){
	plus.nativeUI.closeWaiting();
	mui.currentWebview.show();
}

var closeCurrentView = function(){
	var view = plus.webview.currentWebview();
	plus.webview.close(view.id,"none");
}

