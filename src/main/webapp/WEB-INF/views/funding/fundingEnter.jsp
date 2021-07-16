<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>펀딩 참여 화면</title>
    <%--    <link href="/css/funding/detail.css" rel="stylesheet" type="text/css">--%>
    <script src="/js/funding/funding_detail.js" type="text/javascript"></script>
    <script src="/js/funding/validate.js" type="text/javascript"></script>
</head>

<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>${sessionScope.loginMember.id}이 방금 참여하신 펀딩 내역</h2>
        </div>
    </div><!-- End Breadcrumbs -->

    <!--pricing 적용한 펀딩 내역 -->
        <h1>${funding.product_name }</h1>
        <h4>${funding.id }</h4>
        <!-- ======= Pricing Section ======= -->
        <form action="fundingPayment" method="post" onsubmit="alert_go(this.form)">
        <section id="pricing" class="pricing">
            <div class="container" data-aos="fade-up">
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 col-md-6">

                        <div class="box">

                            <ul>
                                <li><h3>선택한 리워드</h3></li>
                                <li>
                                    <h2>${funding.product_name }</h2>
                                    <c:forEach var="element" items="${list }">
                                        <h2>
                                                ${element }<br>
                                            <input type="text" name="choice_reward" value="${element }" hidden="hidden"/>
                                        </h2>
                                    </c:forEach>
                                </li>
                                <li>
                                    <h4><sup></sup><fmt:formatNumber value="${totalSum }" pattern="#,###,###,###"/><span> 원</span></h4>
                                    <input type="text" hidden name="product_no" value="${product_no }">
                                    <input type="text" hidden name="total_sum" value="${totalSum }">
                                </li>
                            </ul>
                            <ul class="mt-3">
                                <li></li>
                                <li><h3>배송지 입력</h3></li>
                                <li><input type="text" class="form-control" id="name" name="name" placeholder="이름" required></li>
                                <input type="hidden" value="${sessionScope.loginMember.id }" id="id" name="id">
                                <li><input type="text" class="form-control" id="phone" name="phone" placeholder="연락처" required></li>
                                <li><input type="text" class="form-control" id="email" name="email" placeholder="이메일" required></li>
                                <li><input type="text" class="form-control" id="address" name="address" placeholder="주소" required></li>
                            </ul>
                            <div class="btn-wrap">
                                <button class="btn-buy" type="submit" value="펀딩 참여하기" onclick="return validate();">펀딩 참여하기</button>
                                <a href="/board/getFundingList" class="btn-buy">목록으로 돌아가기</a>
                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </section><!-- End Pricing Section -->
        </form>

</main>
<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

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