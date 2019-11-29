<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<style>
div#userGrid{
	width:403px;
	height:300px;
}
</style>
</head>
<body>
userinfolist
<h5 style="text-align:right">[로그인중:${user.uiName}]</h5>
<div id="userGrid"></div>
<script>
function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list/ajax?' + param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var userList = JSON.parse(xhr.responseText);
				console.log(userList);
				var grid = new dhx.Grid('userGrid',{
					columns:[
						{width:100,id:'uiNum',header:[{text:'번호'}]},
						{width:100,id:'uiId',header:[{text:'아이디'}]},
						{width:100,id:'uiName',header:[{text:'닉네임'}]},
						{width:100,id:'credat',header:[{text:'생성날짜'}]}
					],
				headerRowHeight:20
				});
			} else {
				console.log(xhr.responseText);
				alert('로그인이 필요한 요청입니다.');
				location.href = '/views/user/login';
			}
		}
	}
	xhr.send();
}

window.onload = function(){
	getUserList();
}
</script>
</body>
</html>