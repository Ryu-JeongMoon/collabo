<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
﻿<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>﻿
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style>
	#container { width:50%; margin: 0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
		text-align:center !important;
	}
	th { background-color: silver; 
	   text-align:center;}
	.page {display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;}
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
	div > img {width: 100%; height: 35%; }
	.list {
	display:block; 
	}
	
</style>


<title>펀딩리스트</title>
</head>
<body>
<jsp:include page="navbar.jsp" flush="true"/>
	<div id="container">
	<h1>펀딩리스트</h1>

	
	<!-- 데이터 표시영역 -->
	
	<c:if test="${not empty boardList}">
			<c:forEach var="board" items="${boardList}">
		<div style="float: left; padding:3%; width:33%;">
		<div><img class = "image" src = "getpImg.do?url=${board.url }"></div>
			<ul>
				<li class="list">${board.id }</li>
				<li class="list">${board.name }</li>
				<li class="list">${board.price}</li>
				<li class="list">${board.regdate}</li>
			</ul>	
		
			
		</div>
			</c:forEach>
		</c:if>
	
		<div>
		<br>
	<!-- 검색을 위한 폼  -->
<form action="getPerchaseList.do" >
	<table class="border-none">
		<tr>
			<td>
				 <select name="searchCondition">
					<option value="NAME">상품이름
					<option value="DESCRIPTION">상품설명
				</select>
				<input type="text" name="searchKeyword">
				
				<input type="submit" value="검색"> 
				
			</td>
		</tr>
	</table>
</form>

	<p><a href="">글등록</a></p>

  <ul>
	<c:if test="${pageMaker.prev}">
		<li class="page"><a href="getPerchaseList.do?page=1">처음</a></li>
    	<li class="page"><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if>
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page"><a href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
	
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page"><a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    	<li class="page"><a href="getPerchaseList.do?page=${pageMaker.tempEndPage }">맨끝</a></li>
    </c:if> 
  </ul>
</div>
</div>
</body>
</html>