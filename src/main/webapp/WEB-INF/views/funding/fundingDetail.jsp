<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
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

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>${funding.product_name }</h2>
            <p></p>
        </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Cource Details Section ======= -->
    <section id="course-details" class="course-details">
        <div class="container" data-aos="fade-up">

            <div class="row">
                <div class="col-lg-6 mt-3" style="padding: 0 0 0 50px">
                    <img src="/board/getImg?no=${funding.pimg_no}" class="img-fluid" alt="" width="90%">
                    <div class="row">
                        <div class="col-9">
                            <h3>
                                ${funding.product_name }
                            </h3>
                        </div>
                        <div class="col-3" style="padding: 30px 0 0 0">
                            <c:if test="${sessionScope.loginMember == null || funding.id ne sessionScope.loginMember.id}">
                                <button class="btn btn-warning btn-sm" onclick="alert('본인이 작성한 글만 수정할 수 있습니다.');" type="reset">수정
                                </button>
                                <button class="btn btn-danger btn-sm" onclick="alert('본인이 작성한 글만 삭제할 수 있습니다.');" type="reset">삭제
                                </button>
                            </c:if>
                            <c:if test="${funding.id eq sessionScope.loginMember.id}">
                                <input class="btn btn-warning btn-sm" type="button" value="수정" onclick="update_go(this.form)">
                                <input class="btn btn-danger btn-sm" type="button" value="삭제" onclick="delete_go(this.form)">
                            </c:if>
                        </div>
                    </div>
                    <p>
                        ${funding.content }
                    </p>
                </div>

                <div class="col-lg-6 mt-3">
                    <br><br><br>
                    <c:if test="${funding.d_day >= 0}">
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <p>[진행 중]</p>
                            <p>
                                <strong>마감일 ${funding.deadLine }</strong>까지
                                <strong>${funding.d_day }일</strong> 남음
                            </p>
                        </div>
                    </c:if>
                    <c:if test="${funding.d_day < 0}">
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <p>[종료]</p>
                            <p>
                                이미 <strong>종료된 펀딩</strong>입니다.
                            </p>
                        </div>
                    </c:if>

                    <div class="course-info d-flex justify-content-between align-items-center text-center">
                        <h5></h5>
                        <p><p>현재까지 <strong><fmt:formatNumber value="${funding.supporter }"
                                                          pattern="#,###,###,###"/>명</strong>이 펀딩에 참여해주셨습니다!</p></p>
                    </div>

                    <form action="/funding/fundingEnter" method="post">
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>상품번호</h5>
                            <p><a href="#">${funding.product_no }</a></p>
                            <input type="text" name="product_no" hidden value="${funding.product_no}">
                        </div>
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>상품명</h5>
                            <p>${funding.product_name }</p>
                        </div>
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>사업자명</h5>
                            <p>${funding.id }</p>
                        </div>
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>목표금액</h5>
                            <p><fmt:formatNumber value="${funding.goal_money}" pattern="#,###,###,###"/>원</p>
                        </div>
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>달성금액</h5>
                            <p><fmt:formatNumber value="${funding.save_money }" pattern="#,###,###,###"/>원</p>
                        </div>

                        <div class="course-info d-flex justify-content-between align-items-center">
                            <div class="col-6">
                                <h5>리워드 선택</h5>
                            </div>
                            <div class="col-6">
                                <p>
                                    <c:forEach var="name_price_map" varStatus="status" items="${name_price_map}">
                                        <label for="${name_price_map.key }">
                                            <input type="checkbox" style="width: 150px;" value="${name_price_map.key } / ${name_price_map.value}"
                                                   id="${name_price_map.key }" name="list${status.index }" class="opt check"
                                                   onclick="sum(this)">
                                                ${name_price_map.key } <fmt:formatNumber value="${name_price_map.value}"
                                                                                         pattern="#,###,###,###"/>원
                                        </label><br>
                                    </c:forEach>
                                </p>
                            </div>

                        </div>
                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>총 금액</h5>
                            <input class="form-control text-center" type="text" value="0" id="total" name="totalSum" style="width: 130px; height: 28px; margin: 0 0 0 400px;" readonly >원
                        </div>
                        <hr>
                        <div class="row">
                        <div class="col-3"></div>
                        <div class="col-3">
                            <c:if test="${sessionScope.loginMember == null}">
                                <input class="btn btn-primary"
                                         type="button" value="펀딩 참여하기" onclick="alert_login(this.form)">
                            </c:if>
                            <c:if test="${sessionScope.loginMember != null && funding.d_day >= 0}">
                                <input class="btn btn-primary"
                                        type="button" value="펀딩 참여하기" onclick="alert_go(this.form)">
                            </c:if>
                            <c:if test="${funding.d_day < 0}">
                                <input class="btn btn-primary"
                                        type="button" disabled='disabled' value="펀딩 참여하기">
                            </c:if>
                        </div>
                        <div class="col-2">
                            <input class="btn btn-secondary"
                                    type="button" class="more-btn" value="목록으로 이동"
                                   onclick="location.href='/board/getFundingList'">
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br>
    </section><!-- End Cource Details Section -->


</main><!-- End #main -->

<!-- footer -->
<jsp:include page="../fragments/footer.jsp" flush="false"/>

<!-- arrow -->
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

<script>
    function update_go() {
        var con = confirm("\n수정하시겠습니까?\n◈ 악용 방지를 위해 목표 금액은 수정이 불가합니다. ◈");
        if (con == true) {
            location.href = "/funding/fundingUpdate?product_no=${funding.product_no}";
        } else {
            alert("취소되었습니다.");
        }
    }

    function delete_go() {
        var con = confirm("삭제하시겠습니까?");
        if (con == true) {
            location.href = "/funding/deleteBoard/${funding.product_no}";
        } else {
            alert("취소되었습니다.");
        }
    }
</script>

</body>
</html>
