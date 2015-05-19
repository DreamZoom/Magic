mui.plusReady(function() {

	//上传图片
	function upload_userimage(file) {
		mui.toast(file);
		var filename = file.substr(file.lastIndexOf('/') + 1);
		var server = app.ApiUrl + "user/UploadHandImage";
		console.log(server);
		var wt = plus.nativeUI.showWaiting();
		var task = plus.uploader.createUpload(server, {
			method: "POST"
		}, function(t, status) { //上传完成
			wt.close();
			mui.toast(status);
			try {
				console.log(t.responseText);
				alert(t.responseText);
				var result = JSON.parse(t.responseText);
				alert(t.responseText);
				if (status == 200) {
					mui.toast("上传成功：");
					mui.toast(result.message);

				} else {
					mui.toast("上传失败：" + status);

				}
			} catch (e) {
				mui.toast("ss");
			}
		});
		alert(app.getUser().UserName);
		task.addData("username", app.getUser().UserName);
		task.addFile(file, {
			key: filename
		});
		task.start();
	}

	function corpImage(file){
		app.open("crop.html",{file:file}); 
	}

	// 拍照添加文件
	function appendByCamera() {
		plus.camera.getCamera().captureImage(function(p) {
			corpImage(p);
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