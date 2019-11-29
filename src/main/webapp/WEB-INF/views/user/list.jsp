<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<div class="container">
		<h3>UserList</h3>
		<h5 style="text-align:right">[로그인:${user.uiId}]</h5>
		<div class="search">
			<label for="uiName">이름</label> <input type="checkbox" name="search" id="uiName" value="ui_name" >
			<label for="uiId">아이디</label> <input type="checkbox" name="search" id="uiId"  value="ui_id">
			<label for="uiNum">번호</label> <input type="checkbox" name="search" id="uiNum" value="ui_num">
			<div class="form-row align-items-center">
			<div class="col-auto">
			<input class="form-control mb-10" type="text" id="searchStr">
			</div>
			<div class="col-auto">
			<button class="btn btn-dark" >검색</button>
			</div>
			</div>
		</div>
		<h3></h3>
		<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>가입날짜</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody id="tBody">
		</tbody>
	</table>
	<button onclick="goPage('/views/user/insert')" class="btn btn-outline-secondary">회원가입</button>
</div>
<script>
window.onload = function(){
	getUserList('');
	
	var btn = document.querySelector('button');
	btn.onclick = function(){
		var checks = document.querySelectorAll('[name=search]:checked');
		if(checks.length == 0){
			alert('체크된 것이 없습니다.');
			return;
		}
		var searchStr = document.querySelector('#searchStr');
		if(searchStr.value.trim().length<1){
			alert('검색어를 입력해 주세요');
			return;
		}
		var search='';
		for(var i=0;i<checks.length;i++){
			search += 'search='+checks[i].value+'&';
		}
		search += 'searchStr=' + searchStr.value;
		getUserList(search);
	}
}

function getUserList(param){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/user/list/ajax?' + param);
	xhr.onreadystatechange = function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var userList = JSON.parse(xhr.responseText);
				var tBody = document.getElementById("tBody");
				var html ='';
				for(var user of userList){
					html += '<tr>';
					html += '<td id="uiNum">' +user.uiNum+ '</td>';
					html += '<td>' +user.uiName+ '</td>';
					html += '<td>' +user.uiId+ '</td>';
					html += '<td>' +user.credat+ '</td>';
					html += '<td><button class="btn btn-outline-secondary" onclick="goPage(\'/views/user/update?uiNum='+user.uiNum+'\')">수정</button></td>';
					html += '<td><button class="btn btn-outline-secondary" onclick="deleteUser(' +user.uiNum+ ')">삭제</button></td>';
					html += '</tr>';
				}
				tBody.innerHTML = html;
			} else {
				console.log(xhr.responseText);
				alert('로그인이 필요한 요청입니다.');
				location.href = '/views/user/login';
			}
		}
	}
	xhr.send();
}

function deleteUser(idx){
	var xhr = new XMLHttpRequest();
	xhr.open('DELETE','/user/list/ajax');
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==xhr.DONE){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				alert(res.msg);
				location.href = res.url;
			}
		}
	}
	console.log(document.querySelector('td[id=uiNum]').value);
	var param = {
			uiNum : idx
	}
	console.log(param);
	param = JSON.stringify(param);
	xhr.send(param);
}
</script>
</body>
</html>