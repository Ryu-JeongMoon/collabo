<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>펀딩상세</title>
    <script src="/js/funding/funding_detail.js" type="text/javascript"></script>
    <%@ include file="../fragments/head.html" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div id="container">
    <h1>[${funding.region }]&nbsp;&nbsp;${funding.product_name }</h1>
    <hr>
    <div>
        <img src="/images/try.jpg" alt="상품이미지">
    </div>
    <hr>
    <h4>
        <c:if test="${funding.d_day >= 0}">
            <font color="tomato">[진행 중]</font>
        </c:if>
        <c:if test="${funding.d_day < 0}">
            <font color="tomato">[종료]</font>
        </c:if>
        현재까지 <font color="tomato"><fmt:formatNumber value="${funding.supporter }" pattern="#,###,###,###"/>명</font>이 펀딩에
        참여해주셨습니다!
    </h4>
    <c:if test="${funding.d_day >= 0}">
        <h4>&#9203; 마감일 <font color="tomato">${funding.deadLine }</font>까지
            <font color="tomato">${funding.d_day }일</font> 남음 &#9203;
        </h4>
    </c:if>
    <c:if test="${funding.d_day < 0}">
        <h4>&#10060; 이미 <font color="tomato">종료된 펀딩</font>입니다 &#10060;</h4>
    </c:if>
    <form action="fundingEnter" method="post">
        <table class="center">
            <thead>
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>사업자명</th>
                <th>목표금액</th>
                <th>달성금액</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${funding.product_no }</td>
                <td>[${funding.region }]&nbsp;&nbsp;${funding.product_name }</td>
                <td>${funding.id }</td>
                <td>${funding.goal_money}원</td>
                <td><fmt:formatNumber value="${funding.save_money }" pattern="#,###,###,###"/>원</td>
            </tr>
            </tbody>
        </table>
        <hr>
        <table class="reward">
            <tr>
                <th>리워드 선택</th>
                <td>
                    <c:forEach var="name_price_map" varStatus="status" items="${name_price_map}">
                        <label for="${name_price_map.key }">
                            <input type="checkbox" value="${name_price_map.key } / ${name_price_map.value}"
                                   id="${name_price_map.key }" name="list${status.index }" class="opt check"
                                   onclick="sum(this)">
                                ${name_price_map.key }&nbsp;&nbsp;&nbsp;<fmt:formatNumber
                                value="${name_price_map.value}" pattern="#,###,###,###"/>원
                        </label><br>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th>총 금액</th>
                <td>
                    <input type="text" value="0" id="total" name="totalSum" readonly>원
                </td>
            </tr>
        </table>
        <hr>
        <div class="center">
            <c:if test="${sessionScope.loginMember.id == null && funding.d_day < 0}">
                <input type="button" value="펀딩 참여하기" onclick="alert_login(this.form)">
            </c:if>
            <c:if test="${funding.d_day >= 0}">
                <input type="button" value="펀딩 참여하기" onclick="alert_go(this.form)">
            </c:if>
            <c:if test="${funding.d_day < 0}">
                <input type="button" disabled='disabled' value="펀딩 참여하기">
            </c:if>
            <input type="button" value="목록으로 이동" onclick="location.href='/board/getFundingList'">
        </div>
        <p>
		<textarea rows="30" cols="100" readonly>
            ${funding.content }
        </textarea>
        </p>

        <c:if test="${sessionScope.loginMember.id == null || funding.id != sessionScope.loginMember.id}">
            <button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 수정할 수 있습니다.');" type="reset">수정</button>
            <button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 삭제할 수 있습니다.');" type="reset">삭제</button>
        </c:if>
        <c:if test="${funding.id == sessionScope.loginMember.id}">
            <input class="center" type="button" value="수정" onclick="update_go(this.form)">
            <input class="center" type="button" value="삭제" onclick="delete_go(this.form)">
        </c:if>
        <input type="text" name="product_no" value="${funding.product_no}" hidden>
    </form>
</div>


<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>
