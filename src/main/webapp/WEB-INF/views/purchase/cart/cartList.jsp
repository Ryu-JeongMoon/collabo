<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>장바구니 목록</title>
    <%@ include file="../../fragments/head.html" %>

</head>
<body>

<%-- navbar --%>
<jsp:include page="../../fragments/navbar.jsp" flush="false"/>

<th:block th:replace="/templates/fragments/navbar :: header"></th:block>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>${sessionScope.loginMember.id}님의 장바구니</h2>
        </div>
    </div><!-- End Breadcrumbs -->
    <br>
    <br>
    <!--원래-->
    <section class="contact">
        <div class="container text-center mt-5 mb-5">
            <c:choose>
                <c:when test="${cartChecks == null }">
                    장바구니가 비었습니다.
                </c:when>
                <c:otherwise>
                    <form method="post">
                    <div class="container text-center align-items-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>장바구니 번호</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>상품금액</th>
                                <th>주문금액 합계</th>
                                <th>취소</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cartCheck" items="${cartChecks}" varStatus="i">
                                <tr style="height: 60px; font-size: 1.25rem;">
                                    <td>${cartCheck.id }</td>
                                    <td>${cartCheck.name}</td>
                                    <td>${cartCheck.product_count}</td>
                                    <td><fmt:formatNumber value="${cartCheck.price }" pattern="#,###,###"/></td>
                                    <td style="color: #2a52be;"><strong><fmt:formatNumber value="${cartCheck.total_money }" pattern="#,###,###"/></strong></td>
                                    <td><a href="/cart/delete/${cartCheck.id}">[삭제]</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr style="height: 80px; font-size: 1.4rem; font-weight: bold;">
                                <td colspan="6" style="text-align: center">
                                    총합계 : <fmt:formatNumber value="${sum}" pattern="#,###,###원"/>
                                </td>
                            </tr>
                            </tfoot>
                        </table>

                        <div class="row">
                            <div class="col-4"></div>
                            <div class="col-2">
                                <br>
                                <input type="button" class="btn btn-secondary" onclick="location.href='/cart/deleteAll/${member_id}'" value="장바구니 비우기">
                            </div>
                            <div class="col-1">
                                <br>
                                <c:if test="${!empty cartChecks}">
                                    <input type="button" class="btn btn-primary"
                                           onclick="location.href='/order/orderDetail/${member_id}'" value="주문하기">
                                </c:if>
                                <c:if test="${empty cartChecks}">
                                    <input type="button" class="btn btn-primary"
                                           onclick="alert('장바구니가 비었습니다.');" value="주문하기">
                                </c:if>
                            </div>
                        </div>
                    </div>
                    </form>
                </c:otherwise>
            </c:choose>
            <br><br><br><br><br><br><br><br><br><br>
        </div>
    </section>

</main><!--end main-->

<%-- footer --%>
<jsp:include page="../../fragments/footer.jsp" />

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