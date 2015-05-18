mui.plusReady(function() {

	//上传图片
	function upload_userimage(file) {
		mui.toast(file); 		var filename=file.substr(file.lastIndexOf('/')+1);
		var server=app.ApiUrl+"user/UploadHandImage";
		console.log(server);
		var wt = plus.nativeUI.showWaiting();
		var task = plus.uploader.createUpload(server, {
			method: "POST"
		}, function(t, status) { //上传完成
			wt.close();
            mui.toast(status);
            try{
            	
            
			var result = JSON.parse(t.responseText);
			if (status == 200) {
				mui.toast("上传成功：" ); 
				mui.toast( result.message); 
				plus.storage.setItem("uploader", t.responseText);
			} else {
				mui.toast("上传失败：" + status);

			}
			}
            catch(e){
            	mui.toast("ss");
            }
		});
		alert(app.getUser().UserName);
		task.addData("username",app.getUser().UserName);
		task.addFile(file, {
			key: filename
		});
		task.start();
	}

	// 拍照添加文件
	function appendByCamera() {
		plus.camera.getCamera().captureImage(function(p) {
			upload_userimage(p);
		});
	}
	
	// 从相册添加文件
	function appendByGallery() {
		plus.gallery.pick(function(p) {
			upload_userimage(p);
		});
	}
	
	$(document).on("tap","#from-camera",function(){
		appendByCamera();
	});
	$(document).on("tap","#from-gallery",function(){
		appendByGallery();
	});

});