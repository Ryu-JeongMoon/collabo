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
	<!-- 메인페이지 상단바에서 선택(개인-사업자: 사업자번호 유무로 조건검사)-->
	<h1>펀딩오픈 신청하기</h1>
	<form action="fundingOpen.do">
	<!-- 로그인 되어 있지 않은 경우, 사업자 번호가 없는 경우 -->
	<c:if test="${sessionScope.id == null || funding.license == null }">
		<input type="button" value="펀딩오픈 신청하기" onclick="alert('사업자 등록이 필요합니다.')">
		<input type="text" value="${funding.license }">		
	</c:if>
	<!-- 로그인 되어 있고, 사업자 번호가 있는 경우 -->
	<c:if test="${sessionScope.id != null && funding.license != null }">
		<input type="submit" value="펀딩오픈 신청하기">		
	</c:if>
		
	</form>
</body>
</html>