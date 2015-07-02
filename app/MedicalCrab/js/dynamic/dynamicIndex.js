
mui.init({
	pullRefresh: {
		container: '#pullrefresh',
		down: {
			callback: pulldownRefresh
		},
		up:{
			contentrefresh: '正在加载...',
			callback: pullupRefresh
		}
	}
});

var serverUrl = app.ApiUrl +"Dynamic/GetList";
/**
 * 下拉刷新具体业务实现
 */
function pulldownRefresh() {
		$.ajax(serverUrl,{
					data:{},
					dataType:'json',
					type:'post',
					timeout:50000,
					success:function(data){
						var html = template("dynamicList",data);
						document.getElementById("list").innerHTML = html;						
					},
					error:function(xhr,type,errorThrown){
						mui.toast("请求错误");
					} 
			});
		mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed 
}
var count = 0;
/**
 * 上拉加载具体业务实现
 */
function pullupRefresh() {
	setTimeout(function() {
		console.log(serverUrl);
		mui('#pullrefresh').pullRefresh().endPullupToRefresh((++count > 2)); //参数为true代表没有更多数据了。
				$.ajax(serverUrl,{
					data:{},
					dataType:'json',
					type:'post',
					timeout:50000,
					success:function(data){
						var html = template("dynamicList",data);
						document.getElementById("list").innerHTML = html;						
					},
					error:function(xhr,type,errorThrown){
						mui.toast("请求错误");
					} 
			});
	}, 1500);
}

if (mui.os.plus) {
	mui.plusReady(function() {
		setTimeout(function() {
			mui('#pullrefresh').pullRefresh().pullupLoading(); 
		}, 1000);
	}); 
} else {
	mui.plusReady(function() {
		mui('#pullrefresh').pullRefresh().pullupLoading(); 
	}); 
}

