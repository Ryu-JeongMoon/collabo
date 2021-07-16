<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>주문</title>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../../fragments/navbar.jsp" flush="false"/>

<th:block th:replace="/templates/fragments/navbar :: header"></th:block>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>주문</h2>
        </div>
    </div><!-- End Breadcrumbs -->
    <br>
    <br>
    <section class="contact">
        <c:choose>
            <c:when test="${cartChecks == null }">
                장바구니가 비었습니다.
            </c:when>
            <c:otherwise>
                <div class="container">
                    <form method="post">
                        <table class="table text-center">
                            <thead>
                            <tr style="height: 30px; font-size: 1.3rem; ">
                                <th>장바구니번호</th>
                                <th>회원 아이디</th>
                                <th>상품명</th>
                                <th>상품 수</th>
                                <th>상품 금액</th>
                                <th>주문금액 합계</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cartCheck" items="${cartChecks}" varStatus="i">
                            <tr style="height: 40px; font-size: 1.1rem;">
                                <td>${cartCheck.id }</td>
                                <td>${cartCheck.member_id }</td>
                                <td>${cartCheck.name}</td>
                                <td>${cartCheck.product_count}</td>
                                <td><fmt:formatNumber value="${cartCheck.price }" pattern="#,###,###"/></td>
                                <td colspan="5">
                                    <fmt:formatNumber value="${cartCheck.total_money }" pattern="#,###,###"/>
                                </td>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="6"  style="height: 80px; font-size: 1.4rem; font-weight: bold;">
                                    총합계 : <fmt:formatNumber value="${sum}" pattern="#,###,###"/>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>


        <div class="container aos-init aos-animate mt-5 mb-5" data-aos="fade-up">
            <form method="post" onsubmit="return validate();" action="/order/add/${member_id}">
                <%-----------------------------------------------------------------------%>
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 text-center">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-1">
                        <h5><strong>수령인</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" name="receiver" id=receiver class="form-control" placeholder="받으실 분 성함을 입력해주세요">
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 text-center">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-1">
                        <h5><strong>주소</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" name="address" id="address" class="form-control" placeholder="주소를 입력해주세요">
                    </div>
                </div>
                <div class="row mt-2 mb-5">
                    <div class="col-1"></div>
                    <div class="col-1 text-center">
                        <i class="fa fa-phone" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-1">
                        <h5><strong>연락처</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="tel" name="phone" id="phone" class="form-control" placeholder="전화번호를 입력해주세요">
                    </div>
                </div>
                <hr>
                <div class="row mt-5 mb-5">
                    <%--                                <div class="col-1"></div>--%>
                    <div class="col-5"></div>
                    <div class="col-1">
                        <br>
                        <c:if test="${sessionScope.loginMember != null}">
                            <input type="submit" class="btn btn-primary" value="주문하기">
                        </c:if>
                        <c:if test="${sessionScope.loginMember == null}">
                            <input type="submit" class="btn btn-primary" value="주문하기"
                                   onclick="location.href='/login'">
                        </c:if>
                    </div>
                    <div class="col-1">
                        <br>
                        <input type="button" class="btn btn-primary" value="취소"
                               onclick="location.href='/cart/list'">
                    </div>
                </div>
            </form>
        </div>
    </section>
    <br><br><br><br><br>
</main><!-- End #main -->

<script id="contact" class="contact">
    function validate() {
        let addressRe = /^[가-힣a-zA-Z0-9 ]{10,50}$/;
        let receiverRe = /^[가-힣a-zA-Z]{2,20}$/;
        let phoneRe = /^010\d{8}$/;

        let receiver = document.getElementById("receiver");
        let address = document.getElementById("address");
        let phone = document.getElementById("phone");

        // ------------ 이메일 까지 -----------
        if (!check(receiverRe, receiver, "수령인의 이름은 한글, 영문으로 2 ~ 10자까지 입력 가능합니다.")) {
            return false;
        }

        if (!check(addressRe, address, "주소는 한글, 영문으로 10 ~ 50자까지 입력 가능합니다.")) {
            return false;
        }

        if (!check(phoneRe, phone, "전화번호는 010으로 시작하여 10~11자리로 입력해주세요.")) {
            return false;
        }

        alert("주문이 완료되었습니다.");
    }

    function check(re, what, message) {
        if (re.test(what.value)) {
            return true;
        }
        alert(message);
        what.focus();
    }
</script>

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
