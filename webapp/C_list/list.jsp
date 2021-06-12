<%@page import="com.bc.bit.common.Paging"%>
<%@page import="com.bc.bit.vo.BITVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.bit.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="css/jm.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>BIT 공지사항</title>
<style type="text/css">
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        .-text-highlight {
            color: #0f0f0f;
        }

        .hidden {
            display: none;
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .search-form {
            text-align: right;
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
        }

        .page-form {
            text-align: center;
            font-size: 1.5em;
        }

        .write-button {
            text-align: right;
            margin-right: 50px;
        }

        ul li {
            list-style-type: none;
        }

        table {
            table-layout: fixed;
            word-break: break-all;
        }
    </style>
<%--DB 데이터 조회하여 출력 --%>
</head>
<body>
<%--navbar--%>
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
                    <a class="nav-link" href="list">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">일정 관리</a>
                </li>
                <c:choose>
                    <c:when test="${login != null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/controller?type=out"
                               onclick="return confirm('로그아웃?');">${login}님 로그아웃</a>
                        </li>
                    </c:when>
                    <c:when test="${login == null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/login.jsp">로그인</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<%-- Table --%>
<div class="content-container">
	<h1 class="text-center">비트캠프 공지사항</h1>
	<hr>
	<table border="1" class="table table-hover">
	<thead>
	<th scope="col">번호</th>
	<th scope="col">제목</th>
	<th scope="col">작성자</th>
	<th scope="col">작성일</th>
	<th scope="col">조회수</th>
	</thead>
	<tbody>
	  <c:if test="${not empty list }">
      <c:forEach var="vo" items="${list }">
         <tr class="table-primary">   
            <td>${vo.getB_idx() }</td>
            <td>
               <a href="C_list/onelist.jsp?b_idx=${vo.b_idx}&cPage=${pvo.nowPage}">${vo.subject }</a>
            </td>
            <td>${vo.getWriter() }</td>
            <td>${vo.write_date }</td>
            <td>${vo.hit }</td>
         </tr>
      </c:forEach>
      </c:if>      
      <c:if test="${empty list}">
         <tr>
            <td colspan="5">
            <h2>현재 등록된 게시글이 없습니다.</h2>
            </td>
         </tr>
      </c:if>
	</tbody>
	</table>
	
	
	<%-- 검색 --%>
	<div class="container-fluid search-form">
    <form action="C_list/search.jsp" method="get" class="d-flex">
        <div class="form-group">
           <%--  <legend class="hidden">공지사항 검색 필드</legend>
            <label class="hidden">검색분류</label>--%>
            <select class="form-select" name="f">
                <option ${(param.f=="title")?"selected":""} value="subject">제목</option>
                <option ${(param.f=="writer")?"selected":""} value="writer">작성자</option>
                <option ${(param.f=="content")?"selected":""} value="content">내용</option>
            </select>
        </div>
            <input class="form-control me-sm-2" type="text" name="q" placeholder="Search">
            <button class="btn btn-outline-dark" type="submit">Search</button>
    </form>
</div>
	
    <%-- Page --%>
	<div class="page-form">	
	<ul class="pagination">
     <c:if test="${pvo.beginPage == 1 }">  <!-- 시작페이지가 1일 경우 비활성화 -->
        <li class="page-item disabled">
        	<a class="page-link">&laquo;</a>
        </li>               
     </c:if>
     <c:if test="${pvo.beginPage != 1 }">
        <li class="page-item disabled">
           <a class="page-link" href="C_list?cPage=${pvo.beginPage - 1}">&laquo;</a>
        </li>
     </c:if>
     
     <%--블록 내 표시할 페이지 태그 작성 --%>
     <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
     <c:choose>
     <c:when test="${pageNo == pvo.nowPage  }"> <%--현재 페이지랑 누른 페이지 같으면 링크처리x --%>
        <li class="page-item active">
        	<a class="page-link"> ${pageNo } </a>
        </li>
     </c:when>
     <c:otherwise>
        <li class="page-item">
           <a class="page-link" href="C_list?cPage=${pageNo}">${pageNo}</a> <%--현재 페이지랑 누른 페이지 다르면 링크처리 --%>
        </li>
     </c:otherwise>
     </c:choose>   
     </c:forEach>
     
     <%--다음으로 --%>
     <c:if test="${pvo.endPage >= pvo.totalPage }">
        <li class="page-item disabled">
        	<a class="page-link" href="#">&raquo;</a>
        </li>
     </c:if>
     <c:if test="${pvo.endPage < pvo.totalPage }">
        <li>
           <a class="page-link" href="C_list?cPage=${pvo.endPage + 1 }">&raquo;</a>
        </li>
     </c:if>
     </ul>
	</div>     
	
	<%--공지사항 글 작성 --%>
   <div class="write-button">
   		<button class="btn btn-lg btn-primary" type="button" 
   				onclick="location.href='C_list/write.jsp'">공지사항 작성</button>
   </div>
   
<%--footer--%>
<%@include file="footer.jsp" %>

</body>
</html>







