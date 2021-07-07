<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문</title>
    <style>
        #img {
            text-align: center;
        }

        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
        }

        table, tr, td {
            border: 1px solid black;
            margin: 0 auto;
            text-align: center;
        }

        input {
            width: 320px;
            font-size: 15px;
        }
    </style>
</head>
<body>
<h2>주문</h2>

<c:choose>
    <c:when test="${cartChecks == null }">
        장바구니가 비었습니다.
    </c:when>
    <c:otherwise>
        <form method="post">
            <table border="1">
                <tr>
                    <th>장바구니번호</th>
                    <th>회원 아이디</th>
                    <th>상품명</th>
                    <th>상품 수</th>
                    <th>상품 금액</th>
                </tr>
                <c:forEach var="cartCheck" items="${cartChecks}" varStatus="i">
                    <tr>
                        <td>${cartCheck.id }</td>
                        <td>${cartCheck.member_id }</td>
                        <td>${cartCheck.name}</td>
                        <td>${cartCheck.product_count}</td>
                        <td><fmt:formatNumber value="${cartCheck.price }" pattern="#,###,###"/></td>
                    </tr>

                    <tr>
                        <td colspan="5" style="text-align: center">
                                ${cartCheck.id}번 주문 금액 합계 : <fmt:formatNumber value="${cartCheck.total_money }"
                                                                              pattern="#,###,###"/>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5" style="text-align: center">
                        총합계 : <fmt:formatNumber value="${sum}" pattern="#,###,###"/>
                    </td>
                </tr>
            </table>
                <%--			<input type="hidden" name="cart_count" value="${cart.count }">--%>
        </form>
    </c:otherwise>
</c:choose>

<form method="post" onsubmit="return validate();" action="/order/add/${member_id}">
    <table border="1">
        <tr>
            <th><label for="receiver">수령인</label></th>
            <td><input type="text" name="receiver" id="receiver"></td>
        </tr>
        <tr>
            <th><label for="address">주소</label></th>
            <td><input type="text" name="address" id="address"></td>
        </tr>
        <tr>
            <th><label for="phone">연락처</label></th>
            <td><input type="tel" name="phone" id="phone"></td>
        </tr>
    </table>

    <div align="center">
        <br>
        <button type="submit">주문하기</button>
        <button type="button" onclick="location.href='/cart/list/${member_id}'">취소</button>
    </div>
</form>

<script>
    function validate() {
        let addressRe = /^[a-zA-Z0-9]{10,50}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
        let receiverRe = /^[가-힣a-zA-Z]{2,20}$/;
        let phoneRe = /^010\d{8}$/;

        let ageRe = /^[0-9]{1,3}$/;
        // 이메일이 적합한지 검사할 정규식

        let receiver = document.getElementById("receiver");
        let address = document.getElementById("address");
        let phone = document.getElementById("phone");

        // ------------ 이메일 까지 -----------

        if(!check(addressRe,address,"주소는 한글, 영문으로 10 ~ 50자까지 입력 가능합니다.")) {
            return false;
        }

        if(!check(receiverRe,receiver,"수령인의 이름은 한글, 영문으로 2 ~ 10자까지 입력 가능합니다.")) {
            return false;
        }

        if(!check(phoneRe, phone, "전화번호는 010으로 시작하여 10~11자리로 입력해주세요.")) {
            return false;
        }

        alert("주문이 완료되었습니다.");
    }

    function check(re, what, message) {
        if(re.test(what.value)) {
            return true;
        }
        alert(message);
        what.focus();
    }
</script>
</body>
</html>
