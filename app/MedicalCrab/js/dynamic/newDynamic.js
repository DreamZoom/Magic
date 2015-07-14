//mui.init({
//	gestureConfig:{
//		doubletap:true
//	},
//	subpages:[{
//		url:'dynamicList.html',
//		id:'dynamicList.html',
//		styles:{
//			top: '45px',
//			bottom: '0px',
//		}
//	}]
//});
//
//var contentWebview = null;
//document.querySelector('header').addEventListener('doubletap',function () {
//	if(contentWebview==null){
//		contentWebview = plus.webview.currentWebview().children()[0];
//	}
//	if(mui.os.ios){
//		contentWebview.evalJS("mui('#pullrefresh').pullRefresh().scrollTo(0,0,100)");
//	}else{
//		contentWebview.evalJS('mui.scrollTo(0, 100)');
//	}
//});