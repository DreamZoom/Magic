mui.plusReady(function(){
	
	function corpImage(file) {

        var loading = plus.nativeUI.showWaiting();
		var $image = $(".cropper").bind("load",function(){
			setTimeout(function(){
				loading.close(); 
			},1000);
			
		}).attr("src", file);
		
		$image.cropper({
			aspectRatio: 1 / 1,
		    autoCropArea: 0,
			data: {
				width: 400,
				height: 400
			},
			preview: ".preview",
			done: function(data) {
//				$dataX.val(data.x);
//				$dataY.val(data.y);
//				$dataHeight.val(data.height);
//				$dataWidth.val(data.width);
			},

			build: function(e) {
				console.log(e.type);
			},

			built: function(e) {
				console.log(e.type);
			},

			dragstart: function(e) {
				console.log(e.type);
			},

			dragmove: function(e) {
				console.log(e.type);
			},

			dragend: function(e) {
				console.log(e.type);
			}
		});

	}
	
	var self = plus.webview.currentWebview();
    var file = self.file;
    if(!file) {
    	mui.toast("参数不正确！")
    	self.close();
    }
    corpImage(file);
	
});