mui.plusReady(function() {

	mui(document).on("tap", ".select", function() {
		var dataStr = this.getAttribute("data-options");
		console.log(dataStr); 
		var data = JSON.parse(dataStr);

		var arr=data.data;
		var btns =new Array();
		arr.forEach(function(o,i){
			btns.push({title:o.text});
		});

        var context =this;
		plus.nativeUI.actionSheet({
			title: "请选择",
			buttons: btns
		}, function(e) {
			var index = e.index;
			console.log(index-1)
			var text =arr[index-1].value + "你刚点击了\"" +arr[index-1].text;
			
			$(context).find(".select-value").html(arr[index-1].text); 
		});
	});
});