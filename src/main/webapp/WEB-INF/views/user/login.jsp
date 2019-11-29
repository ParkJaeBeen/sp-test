<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style>
	div.container{
		height:250px;
		width:500px;
	}
</style>
</head>
<body>
<div class="container" id="loginForm">
<h3>LOG IN</h3>
<h5 style="text-align:right">[로그인중:${user.uiName}]</h5>
</div>
<script>
window.onload = function(){
	var dhWin = new dhx.Window({width:500,height:300,title:'Login'});
	//dhWin.show();
	var form = new dhx.Form("loginForm", {
		cellCss: "dhx_widget--bordered",
		rows: [
			{
				type: "input",
				label: "ID",
				icon: "dxi dxi-magnify",
				placeholder: "id를 입력해주세요",
				id:"uiId"
			},
			{
				type: "input",
				inputType: "password",
				label: "Password",
				placeholder: "비밀번호를 입력해주세요",
				id:"uiPwd"
			},
			{
				type: "button",
				value: "Send",
				size: "medium",
				view: "flat",
				submit: true,
				color: "primary",
				id:"loginBtn"
			},
		]
	});
	
	form.events.on("ButtonClick", function(id,e){
		if(id==='loginBtn'){
			doLogin();
		}
	})
}

function doLogin(){
	var param={
			uiId : document.querySelector('#uiId').value,
			uiPwd : document.querySelector('#uiPwd').value
	}
	param = JSON.stringify(param);
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/user/login');
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				if(xhr.responseText){
					var user = JSON.parse(xhr.responseText);
					alert(user.uiName+'님 반갑습니다');
					location.href='/views/userinfo/list';
				}
				console.log(xhr.responseText);
			}
		}
	}
	xhr.send(param);
}
</script>
</body>
</html>