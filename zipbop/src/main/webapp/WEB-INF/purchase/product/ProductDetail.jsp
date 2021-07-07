<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 상세정보</title>
    <style>
        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
        }

        table, tr, td, th {
            border: 1px solid black;
            margin: 0 auto;
            text-align: center;
        }

        .wrap1 {
            padding: 50px 20px;
            text-align: center;
        }
    </style>

</head>
<body>
<h2>상품 상세정보</h2>
<div class="wrap1"><img src="/images/apple.png" width="200" height="200"></div>
<table border="1">
    <tr>
        <td>상품명</td>
        <th>${product.name }</th>
    </tr>
    <tr>
        <td>가격</td>
        <th><fmt:formatNumber value="${product.price }" pattern="#,###,###"/></th>
    </tr>
    <tr>
        <td>상품설명</td>
        <th>${product.description }</th>
    </tr>
    <tr>
        <td>등록날짜</td>
        <th>
            <fmt:parseDate value="${ product.regdate }" var="regdate" type="both"
                           pattern="yyyy-MM-dd'T'HH:mm:ss"/>
            <fmt:formatDate value="${regdate}" type="both" dateStyle="long" timeStyle="long"
                            pattern="yyyy.MM.dd E HH:mm"/>
        </th>
    </tr>
    <tr align="center">
        <th colspan="2">
            <form method="post" action="../../cart/insert">
                <input type="hidden" name="product_id" id="product_id" value="${product.id }">
                <select name="product_count" id="product_count">
                    <c:forEach begin="1" end="30" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>&nbsp;개
                <input type="submit" onclick="cartCheck()" value="장바구니에 담기">
            </form>
        </th>
    </tr>
</table>
<div align="center">
    <br>
    <button onclick="location.href='../../cart/list/${sessionScope.id}'">장바구니로 가기</button>
    <button onclick="location.href='/product/productList'">상품목록</button>
</div>
<script>
    function cartCheck() {
        alert('장바구니에 담겼습니다.');
    }
</script>
</body>
</html>