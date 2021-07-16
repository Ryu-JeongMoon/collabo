<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Board</title>
    <%@ include file="../fragments/head.html" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .page {
            display: grid;
            margin: 0 3px auto;
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
    </style>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
        <div class="container">
            <h2>공지사항 페이지</h2>
            <p></p>
        </div>
    </div><!-- End Breadcrumbs -->

    <section>
        <div class="container text-center mt-5 mb-5" >
            <table class="table">
                <thead >
                    <tr style="height: 30px; font-size: 1.3rem; ">
                        <th style="width: 170px">글번호</th>
                        <th style="width: 500px">제목</th>
                        <th style="width: 170px">글쓴이</th>
                        <th style="width: 170px">작성일</th>
                        <th style="width: 170px">조회수</th>
                    </tr>
                    </thead>
                <tbody>
                <c:if test="${not empty boardList}">
                    <c:forEach var="board" items="${boardList}">
                        <tr style="height: 60px; font-size: 1.1rem;">
                            <td class="center">${board.no }</td>
                            <td>
                                <a href="/board/getBoard?no=${board.no}&cnt=1&flag_nq=N">${board.title }</a>
                            </td>
                            <td>${board.writer }</td>
                            <td>
                                <fmt:parseDate value="${ board.regdate }" var="regdate" type="both"
                                               pattern="yyyy-MM-dd"/>
                                <fmt:formatDate value="${regdate}" type="both" dateStyle="long" timeStyle="long"
                                                pattern="yyyy.MM.dd"/>
                            </td>
                            <td>${board.hit }</td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
<%--                <tfoot>--%>
<%--                <tr>--%>
<%--                    <td colspan="4"></td>--%>
<%--                    <td>--%>
<%--                        <c:if test="${sessionScope.loginMember.id eq 'ADMIN'}">--%>
<%--                            <button class="btn-primary" onclick="location.href='/board/insertBoard?flag_nq=N'">--%>
<%--                                글쓰기--%>
<%--                            </button>--%>
<%--                        </c:if>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                </tfoot>--%>
            </table>

            <div class="container">
                <div class="row mt-5 ml-5">
                    <div style="width: 20px;"></div>
                    <div class="col-4">
                        <!--검색-->
                        <form action="/board/getBoardList?flag_nq=N">
                            <div class="p-1 bg-light rounded rounded-pill shadow-sm mb-4">
                                <div class="input-group">
                                    <select name="searchCondition" hidden>
                                        <option value="TITLE" hidden>제목</option>
                                        <option value="CONTENT" hidden>내용
                                    </select>
                                    <input type="text" placeholder="제목을 입력해주세요 " aria-describedby="button-addon1" class="form-control border-0 bg-light"
                                           name="searchKeyword">
                                    <div class="input-group-append">
                                        <button id="button-addon1" type="submit" class="btn btn-link text-primary"><i class="fa fa-search"></i></button>
                                        <input type="hidden" value="N" name="flag_nq">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-5 pt-2 pl-5 text-center">
                        <!--페이징-->
                        <ul>
                            <c:if test="${pageMaker.prev}">
                                <li class="page"><a
                                        href="/board/getBoardList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                <li class="page"><a href="/board/getBoardList${pageMaker.makeQuery(idx)}">${idx}</a></li>
                            </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                <li class="page"><a
                                        href="/board/getBoardList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                    <div class="col-2">
                        <c:if test="${sessionScope.loginMember.id eq 'ADMIN'}">
                            <button class="btn btn-primary" onclick="location.href='/board/insertBoard?flag_nq=N'">글쓰기
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

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

<!-- JS -->
<script>
    function getBoard(board_no) {
        $.ajax({
            url: 'updateHit.do?no=' + board_no,
            type: 'GET',
            success: function () {
                location.href = "getBoard.do?no=" + board_no;
            },
            error: function (e) {
                alert("실패");
            }
        });
    }
</script>

</body>
</html>