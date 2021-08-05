<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../fragments/head.html" %>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        .page {
            display: block;
            margin: 0 3px;
            float: left;
            border: 1px solid #e1e4eb;
            width: 28px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            background-color: #fff;
            font-size: 13px;
            color: #999999;
            text-decoration: none;
        }
        li {
            list-style: none;
        }
    </style>
    <title>펀딩리스트</title>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>${searchKeyword} 지역 펀딩</h2>
            <p></p>
        </div>
    </div><!-- End Breadcrumbs -->

    <!-- 지역 -->
    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
        <div class="container" data-aos="fade-up">

            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2" onclick="location.href='/board/getFundingList'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>전체</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Seoul'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>서울</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Gyeonggi-do'">
                        <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                        <h3>경기도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Incheon'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>인천</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Gangwon-do'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>강원도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Chungcheongbuk-do'">
                        <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                        <h3>충청북도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Chungcheongnam-do'">
                        <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                        <h3>충청남도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Sejong'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>세종</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Daejeon'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>대전</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Jeollabuk-do'">
                        <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                        <h3>전라북도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Jeollanam-do'">
                        <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                        <h3>전라남도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Gwangju'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>광주</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Gyeongsangbuk-do'">
                        <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                        <h3>경상북도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Gyeongsangnam-do'">
                        <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                        <h3>경상남도</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Daegu'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>대구</h3>
                    </div>
                </div>

                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Ulsan'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>울산</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Busan'">
                        <i class="ri-store-line" style="color: #ffbb2c;"></i>
                        <h3>부산</h3>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mt-4 mt-md-0 ">
                    <div class="icon-box mt-2"
                         onclick="location.href='/board/getFundingList?searchCondition=REGION&searchKeyword=Jeju-do'">
                        <i class="ri-fingerprint-line active" style="color: #29cc61;"></i>
                        <h3>제주도</h3>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- End Features Section -->

    <div class="container text-center">
        <div class="row mt-3">
            <div class="col-4 center-block mt-2 ml-5" data-aos="fade-up">
                <!--페이징-->
                <ul>
                    <c:if test="${pageMaker.prev}">
                        <li class="page"><a href="/board/getFundingList?page=1">처음</a></li>
                        <li class="page"><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
                    </c:if>

                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                        <li class="page"><a href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
                    </c:forEach>

                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li class="page"><a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
                        <li class="page"><a href="/board/getFundingList?page=${pageMaker.tempEndPage }">맨끝</a></li>
                    </c:if>
                </ul>
            </div>
            <div class="col-4" data-aos="fade-up">
                <form action="/funding/fundingOpen">
                    <c:if test="${sessionScope.loginMember.license ne null}">
                        <input type="submit" value="펀딩오픈 신청하기" class="get-started-btn">
                    </c:if>
                    <c:if test="${sessionScope.loginMember eq null}">
                        <input type="submit" value="펀딩오픈 신청하기" class="get-started-btn"
                               onclick="alert('로그인이 필요한 서비스입니다.');">
                    </c:if>
                    <c:if test="${sessionScope.loginMember ne null && empty sessionScope.loginMember.license}">
                        <input type="button" value="펀딩오픈 신청하기" class="get-started-btn"
                               onclick="alert('사업자 등록이 필요한 서비스입니다.');">
                    </c:if>
                </form>
            </div>
            <div class="col-4" data-aos="fade-up">
                <!-- 검색-->
                <!-- Custom rounded search bars with input group -->
                <form action="/board/getFundingList">
                    <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                        <div class="input-group">
                            <input type="search" placeholder="펀딩 이름" aria-describedby="button-addon1" class="form-control border-0 bg-light"
                                   id="PRODUCT_NAMEKeyword" name="searchKeyword" value="${param.searchKeyword}">
                            <input type="text" hidden name="searchCondition" id="searchCondition" value="PRODUCT_NAME">
                            <div class="input-group-append">
                                <button id="button-addon1" type="submit" class="btn btn-link text-primary"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- End -->
            </div>
        </div>

    </div>

    <!-- ======= Courses Section ======= -->
    <section id="courses" class="courses">
        <div class="container" data-aos="fade-up">

            <div class="row" data-aos="zoom-in" data-aos-delay="100">
                <!-- each -->
                <c:if test="${not empty boardList}">
                    <c:forEach var="board" items="${boardList}">
                        <div class="col-lg-4 col-md-6 d-flex mt-3 align-items-stretch">
                            <div class="course-item">
                                <a href="/funding/getBoard?product_no=${board.product_no}">
                                    <img src="/board/getImg?no=${board.pimg_no }" class="img-fluid course-img ">
                                </a>
                                    <%--                                    alt="/board/getImg.do?no=${board.pimg_no }"--%>
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4>${board.region }</h4>
                                        <c:if test="${board.d_day > 0}">
                                            <li class="price">D-${board.d_day }</li>
                                        </c:if>

                                        <c:if test ="${board.d_day <= 0}">
                                            <p class="price">[종료]</p>
                                        </c:if>
                                    </div>

                                    <h3><a href="/funding/getBoard?product_no=${board.product_no}">${board.product_name }</a></h3>
                                        <%--                                        <p>${board.product_content}</p>--%>
                                    <!--progress bar-->
                                    <div class="progress ">
                                        <div class="progress-bar progress-bar-striped active " role="progressbar"
                                             style="width: ${board. percent }%"
                                             aria-valuenow="${board.percent }"
                                             aria-valuemin="0" aria-valuemax="100">
                                            <span class="sr-only">${board.percent }%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Course Item-->
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </section><!-- End Courses Section -->

</main>
<!-- End #main -->

<!-- footer -->
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