<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="../fragments/head.html" %>
    <title>WooMool MARKET</title>

</head>

<body>

<%-- navbar --%>
<%@ include file="../fragments/navbar.jsp" %>

<%-- main --%>
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>펀딩 신청 페이지</h2>
            <p></p>
        </div>
    </div><!-- End Breadcrumbs -->

    <!-- myResume에서 가져옴 -->
    <!-- ======= Contact Section ======= -->
    <form action="/funding/insertBoard" method="post" enctype="multipart/form-data">
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up">
                <br><br>

                <div></div>
                <div class="section-title">
                    <h2>펀딩 신청 양식</h2>
                </div>

                <!-- 2 1 2 7 비율로 가운데로 입력하게 -->
                <!-- 틀 -->
                <!-- <div class="row mt-2">
                  <div class="col-1"></div>
                  <div class="col-1 text-center">
                    <i class="bi bi-geo-alt"></i>
                  </div>
                  <div class="col-2 pt-1">
                    <h5><strong>제목</strong></h5>
                  </div>
                  <div class="col-7">
                    인풋
                  </div>
                </div> -->

                <!-- 시작 -->
                <!-- 사업자명 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-id-card" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>사업자명</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" value="${sessionScope.loginMember.id}" name="id" class="form-control" id="id"
                               readonly>
                    </div>
                </div>
                <!-- 지역 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>지역</strong></h5>
                    </div>
                    <div class="col-7">
                        <select class="form-control" name="region" required>
                            <option value="">선택</option>
                            <option value="Seoul">서울</option>
                            <option value="Gyeonggi-do">경기</option>
                            <option value="Incheon">인천</option>
                            <option value="Gangwon-do">강원</option>
                            <option value="Chungcheongbuk-do">충북</option>
                            <option value="Chungcheongnam-do">충남</option>
                            <option value="Sejong">세종</option>
                            <option value="Daejeon">대전</option>
                            <option value="Jeollabuk-do">전북</option>
                            <option value="Jeollanam-do">전남</option>
                            <option value="Gwangju">광주</option>
                            <option value="Gyeongsangbuk-do">경북</option>
                            <option value="Gyeongsangnam-do">경남</option>
                            <option value="Daegu">대구</option>
                            <option value="Ulsan">울산</option>
                            <option value="Busan">부산</option>
                            <option value="Jeju-do">제주</option>
                        </select>
                    </div>
                </div>
                <!-- 펀딩이름 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-envelope-open" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>펀딩이름</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" name="product_name" class="form-control" id="name"
                               maxlength="25" size="30" placeholder="신청할 펀딩 이름을 입력해주세요" required>
                    </div>
                </div>
                <!-- 마감일 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-calendar" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>마감일</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="date" name="deadLine" class="form-control" placeholder="마감일" required>
                    </div>
                </div>
                <!-- 목표금액 -->

                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-credit-card-alt" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>목표금액</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" name="goal_money" class="form-control" id="name"
                               maxlength="7" size="30" oninput="maxLengthCheck(this)"
                               placeholder="목표금액은 수정이 불가하니 신중히 입력해주세요.(최대 900만원)" required>
                    </div>
                </div>
                <!-- 리워드 입력 -->


                <div id="room_type">
                    <div class="row mt-2">
                        <div class="col-1"></div>
                        <div class="col-1 pt-1 text-center">
                            <i class="fa fa-trophy" aria-hidden="true"></i>
                        </div>

                        <div class="col-2 pt-2">
                            <h5><strong>리워드</strong></h5>
                        </div>
                        <div class="col-2">
                            <input type="text" id="reward_name" name="reward_name" class="form-control" maxlength="25"
                                   placeholder="리워드 이름" required>
                        </div>
                        <%--            </div>--%>
                        <%--            <div class="row mt-2">--%>
                        <div class="col-1 pt-2">
                            <h5 text-center><strong>가격</strong></h5>
                        </div>
                        <div class="col-2">
                            <input type="text" id="reward_price" name="reward_price" class="form-control" maxlength="6"
                                   oninput="maxLengthCheck(this)" placeholder="최대 금액:90만원" required>
                        </div>
                        <div class="col-1">
                            <input class="col center btn btn-primary" type="button" value="추가" onclick="add_div()"
                                   style="margin-left: 34% ">
                        </div>
                        <div class="col-1">
                        </div>
                    </div>
                    <input class="col center btn btn-danger" type="button" value="삭제"
                           onclick="remove_div(this)" style="margin-left: 78.70%">
                </div>
                <div id="field"></div>

                <!-- 상품 설명 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-sticky-note" aria-hidden="true"></i>
                    </div>
                    <div class="col-2">
                        <h5><strong>상품 설명</strong></h5>
                    </div>
                    <div class="col-7">
                    <textarea class="form-control" name="content" rows="5" placeholder="상품 정보를 입력해주세요"
                              required></textarea>
                    </div>
                </div>

                <!-- 이미지 첨부 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-picture-o" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-1">
                        <h5><strong>이미지 첨부</strong></h5>
                    </div>
                    <div class="col-7 pt-1">
                        <input type="file" name="file">
                    </div>
                </div>
                <br>
                <hr class="mt5">
                <!-- 작성 버튼 -->
                <div class="row mt-2">
                    <div class="col-4"></div>
                    <div class="col-4">
                        <input type="reset" value="다시 작성" class="btn btn-primary">
                        <input type="submit" value="오픈 신청하기" class="btn btn-primary">
                        <input type="button" value="목록으로 이동" onclick="location.href='/board/getFundingList'" class="btn btn-secondary">
                    </div>
                </div>
                <hr class="mt-3">
            </div>
            </div>
        </section>
    </form>
    </section><!-- End Contact Section -->
    <br><br><br>
</main>
<!-- End #main -->

<%-- footer --%>
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