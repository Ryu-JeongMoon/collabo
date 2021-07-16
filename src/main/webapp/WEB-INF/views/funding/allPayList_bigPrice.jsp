<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../fragments/head.html" %>
    <title>결제 내역 확인</title>
    <link href="/css/funding/detail.css" rel="stylesheet" type="text/css">
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

    <!--pricing 적용한 펀딩 내역 -->
    <h1>${funding.product_name }</h1>
    <h4>${funding.id }</h4>
    <!-- ======= Pricing Section ======= -->
    <form action="fundingPayment" method="post" onsubmit="alert_go(this.form)">
        <section id="pricing" class="pricing">
            <div class="container" data-aos="fade-up">
                <c:forEach var="pay" items="${pays }">
                    <div class="row mt-4">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10 col-md-6">
                            <div class="box">
                                <ul>
                                    <li><h3>주문 번호</h3></li>
                                    <li>
                                        <h2>${pay.pay_no }</h2>
                                    </li>
                                    <li><h3>선택한 리워드</h3></li>
                                    <li>
                                        <h2>${pay.choice_reward }</h2>
                                    </li>
                                    <li><h3>총 금액</h3></li>
                                    <li>
                                        <h4>${pay.total_sum }<span> 원</span></h4>
                                    </li>
                                    <li><h3>참여 일시</h3></li>
                                    <li>
                                        <h2>${pay.pay_date }</h2>
                                    </li>
                                </ul>

                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </section><!-- End Pricing Section -->
    </form>
    <div class="btn-wrap">
            <a class="btn-buy" href="/board/getFundingList">목록으로 돌아가기</a>
    </div>
</main>

<%--원래--%>
<div id="container">
    <h1>
        <font color="tomato">${sessionScope.loginMember.id }</font>님이 참여하신 <font color="tomato">전체 펀딩</font>입니다!
    </h1>

    <input class="btn-buy" type="button" value="목록으로 돌아가기" onclick="location.href='/board/getFundingList'">

    <hr>

    <h3>방금 참여하신 펀딩</h3>
    <c:forEach var="pay" items="${pays }">
        <table class="center">
            <tr>
                <th>주문 번호</th>
                <td>${pay.pay_no }</td>
            </tr>
            <tr>
            <tr>
                <th>선택한 리워드</th>
                <td>${pay.choice_reward }</td>
            </tr>
            <tr>
                <th>총 금액</th>
                <td>${pay.total_sum }원</td>
            </tr>
            <tr>
                <th>참여 일시</th>
                <td>${pay.pay_date }</td>
            </tr>
        </table>
        <hr>
    </c:forEach>
</div>

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