
var serverUrl = app.ApiUrl +"PublicNum/SearchPublicNumList";
var loadingFlag = false;
var currentPage = 0;

mui.init({
	pullRefresh: {
		container: '#listrefresh',
		up:{
			contentrefresh: '正在加载...',
			callback: pullupRefresh
		}
	}
});

/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
	stopRefresh(loadingFlag);
	$.ajax(serverUrl,{
				data:{
					searchKey:'北',//searchKey,
					currentPage:currentPage+1
				},
				dataType:'json',
				type:'post',
				timeout:50000,
				success:function(response){
					var tagData = response.data;
					if(response.result){
						var html = template("publicList",tagData);
						document.getElementById("allList").innerHTML = html;	
						if(tagData.currentPage == tagData.totalPage){
							loadingFlag = true;
							stopRefresh(loadingFlag);
						}
						currentPage = tagData.currentPage;
					}else{
						stopRefresh(true);
					}
					console.log("AAAAA"+currentPage);
				},
				error:function(xhr,type,errorThrown){
					mui.toast("请求错误");
				} 
		});
}

var stopRefresh = function(flag){
	mui('#listrefresh').pullRefresh().endPullupToRefresh((flag)); 
}

//到介绍页面
var gotoIntro = function(findexNo){
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

if (mui.os.plus) {
	mui.plusReady(function() {
		setTimeout(function() {
			mui('#listrefresh').pullRefresh().pullupLoading(); 
		}, 1000);
	}); 
} else {
	mui.plusReady(function() {
		mui('#listrefresh').pullRefresh().pullupLoading();
	}); 
}