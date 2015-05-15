function log(obj){
	for(var p in obj)
	   console.log(p);
}

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
				},
				show:{
					duration:150,
					aniShow:"pop-in"
				}
			});
			return;
		}

	});
	
	
	/*
	 * 提交form
	 * 
	 */
	function getJson(str){
		var parms = str.split('&');
		var jsonobj={};
		parms.forEach(function(s,i){
			console.log(i);
			var p =s.split('=');		
			if(p.length==2){
				jsonobj[p[0]]=p[1];
			}
		});
		return jsonobj;
	}
	
    mui(document).on('tap', 'submit', function() {
    	var target = this.getAttribute("target-id");
    	
    	var str = ($("#"+target).serialize());
    	console.log(str);
    	var json = getJson(str);
    	var api = $("#"+target).attr("data-api");
    
    	app.network.post(app.RomateUrl+api,json,function(data){
    		alert(data.message);
    	});
    });
});