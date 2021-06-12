<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style>
th, td {
  text-align: center;
}
</style>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<%@include file ="header.jsp" %>

		<form method="post">
		<div style="position : absolute; top : 30%; left : 40% ; border : solid 1px gray;">
        <div class="">
        	<table class="table table-hover">
			  <thead>
			    <tr>
			      <th colspan="2" scope="col">마이페이지</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="table-active">
			      <th scope="row">아이디</th>
			      <td><span>${login.id}</span></td>

			    </tr>
			    <tr class="table-active">
			      <th scope="row">이름</th>
			      <td><span>${login.name}</span></td>
			      
			    </tr>
			    <tr class="table-active">
			      <th scope="row">이메일</th>
			      <td><span>${login.email}</span></td>
			      
			    </tr>
			    <tr class="table-active">
			      <th scope="row">핸드폰번호</th>
			      <td><span>${login.phone}</span></td>
			      
			    </tr>
			  </tbody>
			</table>
        </div>
       
        <p class="btn-group">
            <button >수정</button>	<!-- 미완성 -->
            <button type="button" onclick="location.href='${contextPath }/delete.jsp'">삭제</button>   
        </p>
        
    </div>
</form>
</body>
</html>