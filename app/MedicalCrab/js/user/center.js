mui.plusReady(function() {

	//$("#userimage")
	function upload_userimage(file) {
		var wt = plus.nativeUI.showWaiting();
		var task = plus.uploader.createUpload(server, {
			method: "POST"
		}, function(t, status) { //上传完成
			wt.close();
			if (status == 200) {
				mui.toast("上传成功：" + t.responseText);
				plus.storage.setItem("uploader", t.responseText);
			} else {
				mui.toast("上传失败：" + status);

			}
		});
		task.addData("client", "HelloH5+");
		task.addFile(f.path, {
				key: f.name
		});		
		task.start();
	}

});