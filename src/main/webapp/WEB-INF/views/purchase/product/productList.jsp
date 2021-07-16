<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 목록</title>
    <%@ include file="../../fragments/head.html" %>

</head>
<body>
<div>
    <button type="button" onclick="location.href='/order/list/${sessionScope.loginMember.id}'">주문내역</button>
</div>

<h2>상품목록</h2>

<table border="1">
    <thead>
    <tr>
        <th>번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>설명</th>
        <th>이미지</th>
        <th>등록일</th>
    </tr>
    </thead>
    <c:forEach items="${list}" var="product">
        <tr>
            <td><a href="productDetail/${product.id}">${ product.id }</a></td>
            <td>${ product.name }</td>
            <td>${ product.price }</td>
            <td>${ product.description }</td>
            <td>${ product.url }</td>
            <td>
                <fmt:parseDate value="${ product.regdate }" var="regdate" type="both"
                               pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                <fmt:formatDate value="${regdate}" type="both" dateStyle="long" timeStyle="long"
                                pattern="yyyy.MM.dd E HH:mm"/>
            </td>
        </tr>
    </c:forEach>
</table>

<%-- footer --%>
<jsp:include page="../../fragments/footer.jsp" flush="false"/>

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="/assets/vendor/aos/aos.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="/assets/vendor/purecounter/purecounter.js"></script>
<script src="/assets/vendor/swiper/js/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="/assets/js/main.js"></script>

</body>
</html>