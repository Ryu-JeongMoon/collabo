<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

   <head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">
     
      <title>UMUL MARKET</title>
      <meta content="" name="description">
      <meta content="" name="keywords">
     
      <!-- Favicons -->
      <link href="assets/img/favicon.png" rel="icon">
      <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
     
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
     
      <!-- Vendor CSS Files -->
      <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
      <link href="assets/vendor/aos/aos.css" rel="stylesheet">
      <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
     
      <!-- Template Main CSS File -->
      <link href="assets/css/style.css" rel="stylesheet">
     
      <!-- 아이콘 넣기 -->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     
      <!-- =======================================================
      * Template Name: Mentor - v4.3.0
      * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#container { width:1000px; margin: 0 auto; }
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
	
</style>
</head>
<body>
<jsp:include page="navbar.jsp" flush="true"/>
	<div id="container">
	<h1>공지사항</h1>

	
	<h3>테스트님 환영합니다...<a href="logout.do">Log-out</a></h3>
	<table>
		<tr>
			<th width="100">번호</th>
			<th width="200">제목</th>			
			<th width="150">작성자</th>			
			<th width="150">작성일</th>			
			<th width="100">조회수</th>			
		</tr>
		
		<c:if test="${not empty boardList}">
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td class="center">${board.no }</td>
					<td>
						<a href="getBoard.do?no=${board.no}&cnt=1">${board.title }</a>
					</td>
					<td>${board.writer }</td>
					<td>${board.regdate }</td>
					<td>${board.hit }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<div>
	<!-- 검색을 위한 폼  -->
<form action="getBoardList.do" method="post">
	<table class="border-none">
		<tr>
			<td>
			 
				<select name="searchCondition">
					<option value="TITLE">제목
					<option value="CONTENT">내용
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
				<input type="hidden" value="N" name="flag_nq">
			</td>
		</tr>
	</table>
</form>
	<p><a href="insertBoard.do?flag_nq=Q">글등록</a></p>
  <ul>
	<c:if test="${pageMaker.prev}">
    	<li class="page"><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li class="page"><a href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li class="page"><a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</div>
</body>
</html>