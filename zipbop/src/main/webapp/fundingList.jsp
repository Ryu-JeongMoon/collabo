<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 리스트</title>
</head>
<body>
	<h1>펀딩 리스트-유현/수정</h1>
	<form action="getBoard.do" method="post">
		<input type="submit" value="상세보기">
		<input type="text" name="product_no">
	</form>
	<hr>
	<!-- 메인페이지 상단바에서 선택(사업자만)-->
	<h1>펀딩오픈 신청하기</h1>
	<form action="fundingOpen.jsp">
		<input type="submit" value="펀딩오픈 신청하기">
	</form>
</body>
</html>