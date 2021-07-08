<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역 확인</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, .center {text-align: center;	}
	table { border-collapse: collapse; }
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
		text-align: center;		
	}
</style>
</head>
<body>
<div id="container">
<h1><font color="tomato">${sessionScope.id }</font>님이<br>
	참여하신 <font color="tomato">전체 펀딩</font>입니다!
</h1>
<input class="center" type="button" value="목록으로 돌아가기" onclick="location.href='fundingList.jsp'">
<hr>
<c:forEach var="pay" items="${pays }">
<table class="center">
	<tr>
		<th>주문 번호</th>
		<td>${pay.pay_no }</td>
	</tr>
	<tr>
		<th>선택한 리워드</th>
		<td>${pay.choice_reward }<br></td>
	</tr>
	<tr>
		<th>총 금액</th>
		<td>${pay.total_sum }원</td>
	</tr>
	<tr>
		<th>참여 일시</th>
		<td>${pay.pay_date }</td>
	</tr>
</table>
</c:forEach>
</div>
</body>
</html>