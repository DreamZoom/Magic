
var users=[];

function UserListController($scope) {
	
	$scope.ServerUrl=app.RomateUrl;
	
	$scope.users = app.getChatHistory();
	
}

mui.plusReady(function(){
	users=[{
		User: {
			UserName: "wxllzf"
		},
		Message: {
			Content: "呵呵"
		},
		MessageCount:1
	}, {
		User: {
			UserName: "wxllzf2"
		},
		Message: {
			Content: "哈哈哈"
		},
		MessageCount:0
	}];
	
	angular.bootstrap(document.getElementById("app"));
});
