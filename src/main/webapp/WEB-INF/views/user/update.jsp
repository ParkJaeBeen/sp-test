<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<div class="container">
<h3>회원정보수정</h3>
	<table class="table">
		<tbody id="tBody">
		<tr>
			<th>번호</th>
			<td id="uiNum">${param.uiNum}</td>
		</tr>
		<tr>
			<th>ID</th>
			<td id="uiId"></td>
		</tr>
		<tr>
			<th>PWD</th>
			<td id="uiPwd"></td>
		</tr>
		<tr>
			<th>NAME</th>
			<td id="uiName"></td>
		</tr>
		<tr>
			<td><button onclick="update()" class="btn btn-outline-secondary">완료</button></td>
		</tr>
		</tbody>
	</table>
</div>
</body>
<script>
var user;
var uiNum = document.querySelector('#uiNum');
var uiId = document.querySelector('#uiId');
var uiPwd = document.querySelector('#uiPwd');
var uiName = document.querySelector('#uiName');

window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list/ajax?uiNum=${param.uiNum}');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				user = JSON.parse(xhr.responseText);
				console.log(user);
				for(var idx = 0;idx<user.length;idx++){
					var us = user[idx];
				}
				uiNum.innerHTML = '<input type="hidden" id="uiNum" value="'+us.uiNum+'">'+us.uiNum+'';
				uiId.innerHTML = '<input type="text" id="uiId" value="'+us.uiId+'">';
				uiPwd.innerHTML = '<input type="text" id="uiPwd" value="'+us.uiPwd+'">';
				uiName.innerHTML = '<input type="text" id="uiName" value="'+us.uiName+'">';
				console.log(document.querySelector('input[id=uiNum]').value);
				console.log(document.querySelector('#uiId').value);
			}
		}
	}
	xhr.send();
}

function update(){
	var xhr = new XMLHttpRequest();
	xhr.open('PUT','/user/list/ajax');
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText)
				alert(res.msg);
				location.href = res.url;
			}
		}
	}
	var param = {
			uiNum : document.querySelector('input[id=uiNum]').value, 
			uiId : document.querySelector('input[id=uiId]').value,
			uiPwd : document.querySelector('input[id=uiPwd]').value,
			uiName : document.querySelector('input[id=uiName]').value
	}
	param = JSON.stringify(param);
	console.log(param);
	xhr.send(param);
}
</script>
</html>