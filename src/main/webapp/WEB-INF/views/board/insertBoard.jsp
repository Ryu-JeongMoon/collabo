<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <%@ include file="../fragments/head.html" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>질문글 작성</title>

</head>

<body>

<!-- navbar -->
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>질문글 작성</h2>
        </div>
    </div><!-- End Breadcrumbs -->

    <!-- myResume에서 가져옴 -->
    <!-- ======= Contact Section ======= -->
    <form action="/board/insertBoard" method="post" enctype="multipart/form-data">
        <input type="hidden" name="flag_nq" value="${flag}">
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up">
                <br><br>

                <div></div>
                <div class="section-title">
                    <h2>게시글 입력</h2>
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
                <!-- 제목 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-address-card" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>제 목</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" name="title" class="form-control" placeholder="제목을 입력해주세요" required>
                    </div>
                </div>
                <!-- 작성자 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>작성자</strong></h5>
                    </div>
                    <div class="col-7">
                        <input type="text" value="${sessionScope.loginMember.id }" name="writer" class="form-control"
                               placeholder="${sessionScope.id }" readonly>
                    </div>
                </div>

                <!-- 글쓰기 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-sticky-note" aria-hidden="true"></i>
                    </div>
                    <div class="col-2">
                        <h5><strong>내 용</strong></h5>
                    </div>
                    <div class="col-7">
                        <textarea class="form-control" name="content" rows="10" placeholder="게시글 내용을 입력해주세요"
                                  required></textarea>
                    </div>
                </div>
                <!-- 파일 업로드-->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-picture-o" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>첨부 파일</strong></h5>
                    </div>
                    <div class="col-7">
                        <input multiple="multiple" type="file" name="file" class="form-control">
                    </div>

                </div>

                <div class="row mt-2">
                    <div class="col-5"></div>
                    <div class="col-2 pt-2">
                        <button type="submit" class="btn btn-primary">등록</button>
                        <input type="button" class="btn btn-primary" value="취소" onclick="location.href='/board/getBoardList?flag_nq=${flag}'">
                    </div>
                </div>
                <hr class="mt5">
            </div>
        </section><!-- End Contact Section -->
    </form>
</main><!-- End #main -->


<%-- footer --%>
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

</body>
</html>