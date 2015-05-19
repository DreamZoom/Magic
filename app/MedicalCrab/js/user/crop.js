mui.plusReady(function() {

    function upload_userimage(file,params) {

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

		task.addData("username", app.getUser().UserName);
		for(var p in params){
			task.addData(p, ""+params[p]);
		}
		task.addFile(file, {
			key: "upload_img"
		}); 
		
		task.start();
	}
    
    var crop_api =null,select_rect=null;
	function corpImage(file) {

		var loading = plus.nativeUI.showWaiting();
		var $image = $(".cropper").bind("load", function() {
			setTimeout(function() {
				loading.close();
			}, 1000);

		}).attr("src", file);

		$image.Jcrop({
			aspectRatio: 1 / 1,
	        setSelect: [ 0, 0, 200, 200 ],
	        allowResize:false,
	        onSelect:function(rect){
	        	select_rect=rect;
	        }
		},function(){
			crop_api=this;
		});

	}

	var self = plus.webview.currentWebview();
	var file = self.file;
	if (!file) {
		mui.toast("参数不正确！")
		self.close();
	}
	corpImage(file);

	mui(document).on("tap", ".cmd-ok", function() {
		
		upload_userimage(file,select_rect);

	});

});