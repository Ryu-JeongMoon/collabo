<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script>
function send_go1(frm){
	frm.action = "${contextPath }/controller?type=delete";
	frm.submit();
}

function passwordck(){
	if(document.delete.password.value!=${login.password}){
		alert("비번 틀림");
	}else{
		const target = document.getElementById('delete');
		  target.disabled = false;
	}
}
</script>
<style>

table {
  text-align: center;
}

</style>
<meta charset="UTF-8">
<title>탈퇴페이지</title>
</head>
<body>
<%@include file ="header.jsp" %>
			<form name="delete" method="post">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th colspan="2" scope="col">탈퇴 페이지</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="table-active">
			      <th scope="row">뭐쓰지이잉</th>
			      <td><span>${login.name}님</span></td>
			    </tr>
			    <tr class="table-active">
			    
			      <th scope="row">비밀번호를 입력하세요</th>
			      
			      <td><input type="password" name="password" id="password" onblur="passwordck()"></td>
			     
			    </tr>
			    <tr class="table-active">
			      <th scope="row"></th>
			      <input type="hidden" name="id" value="${login.id}">
			      <td><button type="button" disabled="disabled" id="delete" onclick="send_go1(this.form)">탈퇴하기</button></td>
			      
			    </tr>
			    
			  </tbody>
			</table>
			</form> 
</body>
</html>