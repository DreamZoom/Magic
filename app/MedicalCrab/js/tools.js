window.application={};

//全局工具
(function(mui,app){
	
})(mui,application);

mui.ready(function() {

	/*
	 * a 标签跳转
	 */
	mui(document).on('tap', 'a', function() {
		var url = this.getAttribute("href");
		if(!url) return;
		var container = this.getAttribute("data-container"); ///框架id
		if (!container) {
			
			mui.openWindow({
				id: url,
				url: url,
				styles: {
					zindex: 2
				},
				waiting: {
					autoShow: true
				}
			});
			return;
		}

	});
	
	
	/*
	 * 提交form
	 * 
	 */
    mui(document).on('tap', 'submit', function() {
    	var target = this.getAttribute("target-id");
    	alert($("#"+target).serialize());
    	 
    });
});