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
			console.log(t.responseText);
			
			if (status == 200) {
				mui.toast("上传头像成功");
				
			} else {
				mui.toast("上传失败：" + status);
			}
			
			self.close(); 
		});

		task.addData("username", app.getUser().UserName);  
		for(var p in params){
			task.addData(p, ""+params[p]);
			console.log(p+"-----"+params[p]);
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
	        allowSelect:false,
	        onSelect:function(rect){
	        	
	        	var w =$(".cropper").css("width").replace('px',''); 
	        	var h =$(".cropper").css("height").replace('px','');
	        	
	        	select_rect={
	        		x:rect.x,
	        		y:rect.y,
	        		w:rect.w,
	        		h:rect.h,
	        		sw:w,
	        		sh:h 
                };
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

    //alert(plus.screen.resolutionHeight) ; 
    //$(".mui-content").css("height",(plus.screen.resolutionHeight-48)+"px");
    
});