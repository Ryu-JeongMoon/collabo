<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>상품 상세정보</title>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../../fragments/navbar.jsp" flush="false"/>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>상품상세</h2>
        </div>
    </div><!-- End Breadcrumbs -->

    <div class="mt-4"></div>

    <!-- ======= Cource Details Section ======= -->
    <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">
            <hr>
            <div class="row">
                <div class="col-lg-6 mt-3" style="padding: 0 0 0 50px">
                    <img src="/board/getpImg?url=${product.url }" class="img-fluid" alt="" width="90%">
                </div>

                <div class="col-lg-6">
                    <div class="mt-5 course-info d-flex justify-content-between align-items-center">
                        <h5>상품명</h5>
                        <p>${product.name }</p>
                    </div>
                    <div class="course-info d-flex justify-content-between align-items-center">
                        <h5>가격</h5>
                        <p><fmt:formatNumber value="${product.price }" pattern="#,###,###"/>원</p>
                    </div>
                    <div class="course-info d-flex justify-content-between align-items-center">
                        <h5>상품설명</h5>
                        <p>${product.description }</p>
                    </div>
                    <div class="course-info d-flex justify-content-between align-items-center">
                        <h5>등록날짜</h5>
                        <p><fmt:parseDate value="${ product.regdate }" var="regdate" type="both"
                                          pattern="yyyy-MM-dd'T'HH:mm:ss"/>
                            <fmt:formatDate value="${regdate}" type="both" dateStyle="long" timeStyle="long"
                                            pattern="yyyy.MM.dd E HH:mm"/></p>
                    </div>
                    <form method="post" action="/cart/insert">
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>수량</h5>
                            <input type="hidden" name="product_id" id="product_id" value="${product.id }">
                            <select name="product_count" id="product_count">
                                <c:forEach begin="1" end="30" var="i">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <%--                            <div class="col-1"></div>--%>
                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-4">
                                <c:if test="${sessionScope.loginMember != null}">
                                    <input type="submit" onclick="alert('장바구니에 담겼습니다');" class="btn btn-primary"
                                           value="장바구니 담기">
                                </c:if>
                                <c:if test="${sessionScope.loginMember == null}">
                                    <input type="button" class="btn btn-primary" value="장바구니 담기"
                                           onclick="location.href='/login'">
                                </c:if>
                            </div>
                            <div class="col-4">
                                <%--                            <div class="col-1">--%>
                                <input type="button" class="btn btn-secondary"
                                       onclick="location.href='/board/getPurchaseList'" value="상품목록">
                            </div>

                            <%-------------------------------------------------------------------------------------------------------------------%>
                            <%--                            <div class="col-2">--%>
                            <%--                                <input type="button" class="get-started-btn" value="주문내역" onclick="'/order/orderList'">--%>
                            <%--                            </div>--%>
                        </div>
                        <br><br><br><br>

                    </form>
                </div>
                <hr>
                <%--                <div class="row">--%>
                <%--                    <div class="col-4"></div>--%>
                <%--                    <div class="col-6">--%>
                <%--                        <input type="submit" class="get-started-btn" value="장바구니 담기" onclick="cartCheck()">--%>
                <%--                        <input type="button" class="get-started-btn" value="상품목록" onclick="'/product/productList'">--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
            <br><br><br><br>
        </div>
    </section>
</main><!-- End #main -->

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