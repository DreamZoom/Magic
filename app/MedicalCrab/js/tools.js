mui.ready(function() {

	/*
	 * a 标签跳转
	 */
	mui(document).on('tap', 'a', function() {
		var url = this.getAttribute("href");
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
	
	
	

});