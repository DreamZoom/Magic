mui.plusReady(function() {

	//上传图片
	

	function corpImage(file){
		app.open("crop.html",{file:file}); 
	}

	// 拍照添加文件
	function appendByCamera() {
		plus.camera.getCamera().captureImage(function(p) {
			plus.io.resolveLocalFileSystemURL(p, function(entry) {
				var localurl = entry.toLocalURL(); //
				corpImage(localurl);

			});
		});
	}

	// 从相册添加文件
	function appendByGallery() {
		plus.gallery.pick(function(p) {
			corpImage(p);
		});
	}

    //
	function appendImage() {
		plus.nativeUI.actionSheet({
			title: "选择照片",
			cancel: "取消",
			buttons: [{
				title: "拍照上传"
			}, {
				title: "相册选取"
			}]
		}, function(e) {
			var index = e.index;
			var text = "你刚点击了\"";
			switch (index) {
				case 0:
					text += "取消";
					break;
				case 1:
					appendByCamera();
					break;
				case 2:
					appendByGallery();
					break;
			}
		});
	}

    mui(document).on("tap","#userlogo",function(){
    	appendImage(); 
    });

});