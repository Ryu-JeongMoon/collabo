<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>펀딩 리스트</title>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div class="container">
    <h1>펀딩 리스트-유현/수정</h1>
    <form action="/board/getBoard" method="post">
        <input type="submit" value="상세보기">
        <input type="number" name="product_no">
    </form>
    <hr>
    <!-- 메인페이지 상단바에서 선택(개인-사업자: 사업자번호 유무로 조건검사)-->
    <h1>펀딩오픈 신청하기</h1>
    <form action="/board/fundingOpen">
        <input type="text" value="${license}" hidden>
        <c:if test="${sessionScope.loginMember.id == null || license == null }">
            <input type="button" value="펀딩오픈 신청하기" onclick="alert('사업자 등록이 필요합니다.')">
            <input type="text" value="${funding.license }">
        </c:if>

        <c:if test="${sessionScope.loginMember.id != null && license != null }">
            <input type="submit" value="펀딩오픈 신청하기">
        </c:if>

    </form>
</div>


<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>