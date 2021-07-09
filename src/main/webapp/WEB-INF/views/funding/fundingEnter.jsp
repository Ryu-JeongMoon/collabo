<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>펀딩 참여 화면</title>
    <link href="/css/funding/detail.css" rel="stylesheet" type="text/css">
    <script src="/js/funding/funding_detail.js" type="text/javascript"></script>
</head>

<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div id="container">
    <h1>${funding.product_name }</h1>
    <h4>${funding.id }</h4>

    <hr>
    <form action="fundingPayment" method="post" onsubmit="alert_go(this.form)">
        <h3>펀딩 내역</h3>

        <table>
            <tr>
                <th>선택한 리워드</th>
                <td>
                    <c:forEach var="element" items="${list }">
                        ${element }<br>
                        <input type="text" name="choice_reward" value="${element }" hidden="hidden"/>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th>총 금액</th>
                <td><fmt:formatNumber value="${totalSum }" pattern="#,###,###,###"/>원</td>
                <input type="text" hidden name="product_no" value="${product_no }">
                <input type="text" hidden name="total_sum" value="${totalSum }">
            </tr>
        </table>

        <hr>
        <h3>배송지 입력</h3>

        <table>
            <tr>
                <th>이름</th>
                <td><input type="text" id="name" name="name"></td>
                <input type="hidden" value="${sessionScope.loginMember.id }" id="id" name="id">
            </tr>
            <tr>
                <th>연락처</th>
                <td><input type="text" id="phone" name="phone"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" id="email" name="email"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="address"></td>
            </tr>
        </table>

        <hr>

        <div class="center">
            <button type="submit" value="펀딩 참여하기" onclick="return validate();">펀딩 참여하기</button>
            <input type="button" value="목록으로 이동" onclick="location.href='/board/getFundingList'">
        </div>
    </form>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>