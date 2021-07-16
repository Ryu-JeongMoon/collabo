<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <%@ include file="../fragments/head.html" %>
    <title>게시글 수정</title>
    <script>
        var del_file_no = [];

        function deleteFile(file) {
            $("div").remove("#file_" + file);
            del_file_no.push(file);
            $("#del_file_no").attr("value", del_file_no);
        }
    </script>

</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>게시글 수정</h2>
        </div>
    </div><!-- End Breadcrumbs -->

    <!-- myResume에서 가져옴 -->
    <!-- ======= Contact Section ======= -->
    <form name="updateForm" action="/board/updateBoard?flag_nq=${flag_nq}" method="post" enctype="multipart/form-data">
        <input type="hidden" name="no" value="${board.no}">
        <input type="hidden" id="del_file_no" name="del_file_no" value="">
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up">
                <hr>
                <br>
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
                        <input type="text" name="title" rows="10"  class="form-control" value="${board.title}">
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
                        <input type="text" value="${sessionScope.loginMember.id }" name="writer" class="form-control" placeholder="${sessionScope.id }" readonly>
                    </div>
                </div>

                <!-- 글 내용 -->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-sticky-note" aria-hidden="true"></i>
                    </div>
                    <div class="col-2">
                        <h5><strong>내 용</strong></h5>
                    </div>
                    <div class="col-7">
                        <textarea class="form-control" name="content" rows="10">${board.content}</textarea>
                    </div>
                </div>
                <!-- 수정-->
                <div class="row mt-2">
                    <div class="col-1"></div>
                    <div class="col-1 pt-1 text-center">
                        <i class="fa fa-picture-o" aria-hidden="true"></i>
                    </div>
                    <div class="col-2 pt-2">
                        <h5><strong>첨부 파일</strong></h5>
                    </div>
                    <!-- 파일 있으면 파일 리스트랑 삭제 버튼 뜸 -->
                    <c:forEach var="file" items="${file}">
                        <div id="file_${file.file_no }">
                                ${file.org_file_name}(${file.file_size}kb)
                            <input type="hidden" id="FILE_NO" value="${file.file_no }">
                            <button onclick="deleteFile(${file.file_no })" type="button" >삭제</button><br>
                        </div>
                    </c:forEach>

                    <div class="col-7">
                        <input multiple="multiple" type="file" name="file" class="form-control">
                    </div>

                    <div class="row mt-2">
                        <hr class="mt-3">
                        <div class="col-5"></div>
                        <div class="col-2 pt-1">
                            <input type="button" class="btn btn-secondary" value="목록으로 이동" onclick="location.href='/board/getBoardList?no=${board.no}&flag_nq=${board.flag_nq}'">
                        </div>
                        <div class="col-4 ">
                            <input type="submit" value="수정" class="btn btn-primary">
                            <input type="button" value="취소" class="btn btn-primary "
                                   onclick="location.href='/board/getBoard.do?no=${board.no}'">
                        </div>
                    </div>
                </div>
                <hr>
                <br><br><br><br>
            </div>
    </form>

    </section><!-- End Contact Section -->

</main><!-- End #main -->


<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

<!-- arrow -->
<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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