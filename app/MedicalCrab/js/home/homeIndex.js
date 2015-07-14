
var subpages = ['pages/dynamic/dynamicList.html', 
				'pages/dynamic/addDynamic.html', 
				'pages/addressList/addressList.html', 
				'pages/position/near.html',
				'pages/user/center.html'];
			var subpage_style = {
				top: '46px',
				bottom: '50px'
			};
//创建子页面，首个选项卡页面显示，其它均隐藏；
mui.plusReady(function() {
	var self = plus.webview.currentWebview();
	for (var i = 0; i < 5; i++) {
		var sub = plus.webview.create(subpages[i], subpages[i], subpage_style);
		if (i > 0) {
			sub.hide();
		}
		self.append(sub);
	}
});

//当前激活选项
var activeTab = subpages[0];
var title = document.getElementById("title");
//选项卡点击事件
mui('.mui-bar-tab').on('tap', 'a', function(e) {
	var targetTab = this.getAttribute('href');
	if (targetTab == activeTab) {
		return;
	}
	//更换标题
	var myTitle = this.querySelector('.mui-tab-label').innerHTML;
	title.innerHTML =  myTitle== "我"?"个人中心":myTitle; 
	//显示目标选项卡
	plus.webview.show(targetTab);
	//隐藏当前;
	plus.webview.hide(activeTab);
	//更改当前活跃的选项卡
	activeTab = targetTab;
});
//自定义事件，模拟点击“首页选项卡”
document.addEventListener('gohome', function() {
	var defaultTab = document.getElementById("defaultTab");
	//模拟首页点击
	mui.trigger(defaultTab, 'tap');
	//切换选项卡高亮
	var current = document.querySelector(".mui-bar-tab>.mui-tab-item.mui-active");
	if (defaultTab !== current) {
		current.classList.remove('mui-active');
		defaultTab.classList.add('mui-active');
	}
});