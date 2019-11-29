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
<h3>회원가입</h3>
<h5 style="text-align:right">[로그인:${user.uiId}]</h5>
	<table class="table">
		<tbody>
		<tr>
			<th>ID</th>
			<td><input type="text" id="uiId"></td>
		</tr>
		<tr>
			<th>PWD</th>
			<td><input type="password" id="uiPwd"></td>
		</tr>
		<tr>
			<th>NAME</th>
			<td><input type="text" id="uiName"></td>
		</tr>
		<tr>
			<td><button onclick="insert()" class="btn btn-outline-secondary">완료</button></td>
		</tr>
		</tbody>
	</table>
</div>
</body>
<script>
function insert(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/user/list/ajax')
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
			uiId :document.querySelector('#uiId').value,
			uiPwd:document.querySelector('#uiPwd').value,
			uiName:document.querySelector('#uiName').value
	}
	
	param = JSON.stringify(param);
	console.log(param);
	xhr.send(param);
}
</script>
</html>