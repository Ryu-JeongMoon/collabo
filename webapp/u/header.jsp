<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<meta charset="UTF-8">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbarResponsive">
    <div class="container-fluid">
        <a class="navbar-brand" href="">BIIT</a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="">HOME
                        <span class="visually-hidden">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">공지사항 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">프로젝트 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">일정 관리</a>
                </li>
                <c:choose>
                    <c:when test="${login != null }">
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath }/controller?type=out" onclick="return confirm('로그아웃?');">${login.id}님 로그아웃</a>
                        	<a class="nav-link" href="${contextPath }/mypage.jsp">마이페이지</a>
                        </li>
                    </c:when>
                    <c:when test="${login == null }">
                        <li class="nav-item">
                            <a class="nav-link" href="${contextPath }/login.jsp">로그인</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
