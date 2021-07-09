<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../fragments/head.html" %>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="description">
    <meta content="" name="keywords">
    <title>펀딩 글쓰기 페이지</title>
</head>

<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div id="container">
    <h1><font color="tomato">${sessionScope.id }</font>님이<br>
        방금 참여하신 <font color="tomato">펀딩</font>입니다!
    </h1>
    <input class="center" type="button" value="목록으로 돌아가기" onclick="location.href='fundingList.jsp'">
    <hr>
    <table class="center">
        <tr>
            <th>주문 번호</th>
            <td>${chk.pay_no }</td>
        </tr>
        <tr>
            <th>선택한 리워드</th>
            <td>${chk.choice_reward }<br></td>
        </tr>
        <tr>
            <th>총 금액</th>
            <td>${chk.total_sum }원</td>
        </tr>
        <tr>
            <th>참여 일시</th>
            <td>${chk.pay_date }</td>
        </tr>
    </table>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>