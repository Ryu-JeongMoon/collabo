<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../fragments/head.html" %>
    <title>결제 내역 확인</title>
    <link href="/css/funding/detail.css" rel="stylesheet" type="text/css">
</head>

<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div id="container">
    <h1>
        <font color="tomato">${sessionScope.loginMember.id }</font>님이<br>참여하신 <font color="tomato">전체 펀딩</font>입니다!
    </h1>

    <input class="center" type="button" value="목록으로 돌아가기" onclick="location.href='fundingList'">

    <hr>

    <h3>방금 참여하신 펀딩 &#128073;</h3>
    <c:forEach var="pay" items="${pays }">
        <table class="center">
            <tr>
                <th>선택한 리워드</th>
                <td>${pay.choice_reward }</td>
            </tr>
            <tr>
                <th>총 금액</th>
                <td>${pay.total_sum }</td>
            </tr>
            <tr>
                <th>참여 일자</th>
                <td>${pay.pay_date }</td>
            </tr>
        </table>
        <hr>
    </c:forEach>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>