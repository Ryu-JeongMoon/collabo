<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>상품 목록</title>

    <style>
        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid black;
            margin: 0 auto;
            text-align: center;
        }
    </style>

</head>
<body>
<div>
    <button type="button" onclick="location.href='/order/list/${sessionScope.id}'">주문내역</button>
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

</body>
</html>