<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <%@ include file="../../fragments/head.html" %>
    <title>주문 목록</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/purchase/purchase.css'/>" >
</head>
<body>

<%-- navbar --%>
<jsp:include page="../../fragments/navbar.jsp" flush="false"/>

<div>
    <button onclick="location.href='/product/productList'">상품목록</button>
</div>
<h2>${orders[0].member_id}님의 주문 내역</h2>

<c:choose>
    <c:when test="${orders == null }">
        장바구니가 비었습니다.
    </c:when>
    <c:otherwise>
        <form method="post">
            <table border="1">
                <tr>
                    <th>주문번호</th>
                    <th>회원 아이디</th>
                    <th>상품명</th>
                    <th>상품 수</th>
                    <th>상품 금액</th>
                    <th>주문 시각</th>
                    <c:if test="${refund != false}">
                        <th>주문 취소</th>
                    </c:if>
                </tr>
                <tr>
                    <c:forEach var="order" items="${orders}" varStatus="i">
                    <td>${order.id}</td>
                    <td>${order.member_id }</td>
                    <td>${order.product_name}</td>
                    <td>${order.product_count}</td>
                    <td><fmt:formatNumber value="${order.product_price }" pattern="#,###,###"/></td>
                    <td>
                        <fmt:parseDate value="${order.regdate}" var="parsedDateTime" type="both"
                                       pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                        <fmt:formatDate value="${parsedDateTime}" type="both" dateStyle="long" timeStyle="long"
                                        pattern="yyyy.MM.dd E HH:mm"/>
                    </td>
                    <c:if test="${refund != false}">
                        <td>
                            <c:if test="${interval[order.uuid] < 2}">
                                <a href="/order/refund/${order.uuid}">[환불]</a>
                            </c:if>
                            <c:if test="${interval[order.uuid] >= 2}">
                                <span onclick="alert('주문 후 2일이 지나 환불이 불가합니다.');">[환불]</span>
                            </c:if>
                        </td>
                    </c:if>
                </tr>

                <tr>
                    <td colspan="8" style="text-align: center">
                            ${order.cart_id}번 주문 금액 합계 : <fmt:formatNumber
                            value="${order.product_price * order.product_count }"
                            pattern="#,###,###"/>
                    </td>

                </tr>

                </c:forEach>
                <tr>
                    <td colspan="7" style="text-align: center">
                        총합계 : <fmt:formatNumber value="${sum}" pattern="#,###,###"/>
                    </td>
                </tr>
            </table>
        </form>
    </c:otherwise>
</c:choose>
<c:if test="${refund == false}">
<table border="1">
    <thead>
    <tr>
        <td>주문번호</td>
        <td>수령인</td>
        <td>주소</td>
        <td>전화번호</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th><a>${orders[0].id }</a></th>
        <th>${orders[0].receiver }</th>
        <th>${orders[0].address }</th>
        <th>${orders[0].phone }</th>
    </tr>
    </tbody>
</table>
</c:if>

<%-- footer --%>
<jsp:include page="../../fragments/footer.jsp" flush="false"/>

</body>
</html>
