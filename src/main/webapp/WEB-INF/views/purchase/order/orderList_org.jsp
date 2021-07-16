<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>주문 목록</title>

</head>
<body>

<%-- navbar --%>
<jsp:include page="../../fragments/navbar.jsp" flush="false"/>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>${sessionScope.loginMember.id}님의 주문 내역</h2>
        </div>
    </div><!-- End Breadcrumbs -->
    <br>
    <section class="contact">
        <c:choose>
            <c:when test="${sum == 0}">
                <div class="container py-5 text-center">주문 내역이 존재하지 않습니다.</div>
            </c:when>
            <c:otherwise>
                <div class="container text-center">
                    <form method="post">
                        <table class="table">
                            <thead>
                            <tr style="height: 80px; font-size: 1.3rem; ">
                                <th style="width: 90px">주문번호</th>
                                <th style="width: 200px">상품명</th>
                                <th style="width: 120px">상품 수</th>
                                <th style="width: 120px">상품 금액</th>
                                <th style="width: 120px">주문금액 합계</th>
                                <th style="width: 140px">주문 시각</th>
                                <c:if test="${refund != false}">
                                    <th style="width: 120px">주문 취소</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orders}" varStatus="i">
                                <tr style="height: 60px; font-size: 1.1rem;">
                                    <td>${order.id}</td>
                                    <td style="color: #2a52be; font-size: 1.3rem;">${order.product_name}</td>
                                    <td>${order.product_count}</td>
                                    <td>
                                        <fmt:formatNumber value="${order.product_price }" pattern="#,###,###"/>
                                    </td>

                                    <td>
                                        <strong><fmt:formatNumber value="${order.product_price * order.product_count }"
                                                          pattern="#,###,###"/></strong>
                                    </td>
                                    <td>
                                        <small><fmt:parseDate value="${order.regdate}" var="parsedDateTime" type="both"
                                                              pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                                            <fmt:formatDate value="${parsedDateTime}" type="both" dateStyle="long"
                                                            timeStyle="long"
                                                            pattern="yyyy.MM.dd E HH:mm"/></small>
                                    </td>
                                    <c:if test="${refund != false}">
                                        <td>
                                            <c:if test="${interval[order.uuid] < 2}">
                                                <a href="/order/refund/${order.uuid}" onclick="alert('환불 처리 되었습니다.');">[환불]</a>
                                            </c:if>
                                            <c:if test="${interval[order.uuid] >= 2}">
                                                <span onclick="alert('주문 후 48시간이 지나 환불이 불가합니다.');"
                                                    style="color: #741126;">
                                                    [환불 불가]
                                                </span>
                                            </c:if>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr style="height: 80px; font-size: 1.4rem; font-weight: bold;">
                                <td colspan="7" style="text-align: center; ">
                                    총합계 : <fmt:formatNumber value="${sum}" pattern="#,###,###원"/>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>

        <br>
        <%-----------------------------------------------------------------------%>
        <br>
        <br>

        <c:if test="${sum != 0 && isOrdered == true}">
            <div class="row mt-2">
                <div class="col-3"></div>
                <div class="col-1 text-center">
                    <i class="fa fa-check" aria-hidden="true"></i>
                </div>
                <div class="col-2 pt-1">
                    <h5><strong>주문번호</strong></h5>
                </div>
                <div class="col-4">
                    <input type="text" value="${orders[0].id }" readonly>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-3"></div>
                <div class="col-1 text-center">
                    <i class="fa fa-check" aria-hidden="true"></i>
                </div>
                <div class="col-2 pt-1">
                    <h5><strong>수령인</strong></h5>
                </div>
                <div class="col-4">
                    <input type="text" value="${orders[0].receiver }" readonly>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-3"></div>
                <div class="col-1 text-center">
                    <i class="fa fa-check" aria-hidden="true"></i>
                </div>
                <div class="col-2 pt-1">
                    <h5><strong>주소</strong></h5>
                </div>
                <div class="col-4">
                    <input type="text" value="${orders[0].address }" readonly>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-3"></div>
                <div class="col-1 text-center">
                    <i class="fa fa-check" aria-hidden="true"></i>
                </div>
                <div class="col-2 pt-1">
                    <h5><strong>전화번호</strong></h5>
                </div>
                <div class="col-4">
                    <input type="text" value="${orders[0].phone }" readonly>
                </div>
            </div>
        </c:if>
        <br>
        <br>
    </section>
</main><!--end main-->

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

<!-- 수정 -->