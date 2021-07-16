<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../fragments/head.html" %>
    <title>결제 내역 확인</title>
<%--    <link href="/css/funding/detail.css" rel="stylesheet" type="text/css">--%>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>${sessionScope.loginMember.id}님이 참여하신 전체 펀딩내역</h2>
        </div>
    </div><!-- End Breadcrumbs -->

    <div class="container text-center mt-3 mb-3">
        <div class="row ">
            <div class="5"></div>
                <a class="btn-buy" onclick="location.href='/board/getFundingList'">목록 보기</a>
        </div>
    </div>

    <!-- ======= Pricing Section ======= -->
    <section id="pricing" class="pricing">
        <div class="container mb-5" data-aos="fade-up">
            <div class="row">
            <c:forEach var="pay" items="${pays }">
            <%-- each--%>
                <div class="col-lg-4 col-md-6">
                    <div class="box">
                        <h3><span>주문 번호 : </span>${pay.pay_no }</h3>
                        <ul>
                            <li><h5>선택한 리워드</h5></li>
                            <li>
                                <h5>${pay.choice_reward }</h5>
                            </li>
                            <hr>
                            <li><h5>참여 일시</h5></li>
                            <li>
                                <h5>${pay.pay_date }</h5>
                            </li>
                        </ul>
                        <div class="btn-wrap">
                            <span>총 금액</span>
                            <h4>${pay.total_sum }<span> 원</span></h4>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
            <br><br>
        </div>
    </section><!-- End Pricing Section -->

</main><!-- End #main -->


<!-- footer -->
<%@ include file="../fragments/footer.jsp" %>

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
<!-- Funding JS -->
<script src="/js/funding/funding_open.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>