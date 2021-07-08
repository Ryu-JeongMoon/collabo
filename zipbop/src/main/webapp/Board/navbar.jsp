<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
</style>
</head>
<body>
<!-- 네비바 그냥 모양잡는 정도로만 템플릿 잡아둔거라 다 갈아 엎으셔두 되어요 온니 -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">로고</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="login.do" method="post">홈</a></li>
        <li><a href="getPerchaseList.do">구매하기</a></li>
        <li><a href="getFundingList.do">펀딩하기</a></li> 
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">QnA<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="getBoardList.do?flag_nq=Q">QnA</a></li>
            <li><a href="getBoardList.do?flag_nq=N">공지사항</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      
       
       <c:choose>
          <c:when test = "${id == null }">
          <li><a href="#">회원가입</a></li>
          <li><a href="#">로그인</a></li>
          </c:when>
          
          <c:when test = "${id == 'ADMIN' }">
          <li><a href="#">관리자로그아웃</a></li>
          </c:when>
          
          <c:when test = "${id != null }">
          <li><a href="#">로그아웃</a></li>
          </c:when>
          
          
       </c:choose>
        
       
      
        
      </ul>
    </div>
  </div>
</nav>
</body>
</html>