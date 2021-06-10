<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>자료 게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

    <style type="text/css">
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        .-text-highlight {
            color: #0f0f0f;
        }

        .hidden {
            display: none;
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .search-form {
            text-align: right;
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
        }

        .page-form {
            text-align: center;
            font-size: 1.5em;
        }

        .write-button {
            text-align: right;
            margin-right: 50px;
        }

        ul li {
            list-style-type: none;
        }

        table {
            table-layout: fixed;
            word-break: break-all;
        }
    </style>
</head>

<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbarResponsive">
    <div class="container-fluid">
        <a class="navbar-brand" href="">BIIT</a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="">HOME
                        <span class="visually-hidden">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">공지사항 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">프로젝트 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="list">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">일정 관리</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%--Search Form--%>
<div class="container-fluid search-form">
    <form class="d-flex">
        <div class="form-group">
            <legend class="hidden">공지사항 검색 필드</legend>
            <label class="hidden">검색분류</label>
            <select class="form-select" name="f">
                <option ${(param.f=="post_title")?"selected":""} value="post_title">제목</option>
                <option ${(param.f=="writer_name")?"selected":""} value="writer_name">작성자</option>
            </select>
        </div>
        <div class="form-group">
            <input class="form-control me-sm-2" type="text" name="k" value="${param.k}" placeholder="검색어 입력">
        </div>
        <div class="form-group">
            <button class="btn btn-outline-dark" type="submit">검색</button>
        </div>
    </form>
</div>

<%--페이징 처리를 위한 변수--%>
<c:set var="page" value="${(param.p == null)?1:param.p}"/>
<c:set var="startNum" value="${page-(page-1)%5}"/>
<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"/>

<%--Table--%>
<div class="content-container">
    <table border="1" class="table table-hover">
        <thead>
        <th scope="col">번호</th>
        <th scope="col">제목</th>
        <th scope="col">글쓴이</th>
        <th scope="col">작성일</th>
        <th scope="col">조회수</th>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr class="table-primary">
                <c:if test="${!empty param.p}">
                    <td><a href="/data-board/detail?post_no=${item.post_no}&p=${param.p}&f=${param.f}&k=${param.k}">${item.post_no}</a></td>
                    <td><a href="/data-board/detail?post_no=${item.post_no}&p=${param.p}&f=${param.f}&k=${param.k}">${item.post_title} [${item.reply_cnt}]</a></td>
                </c:if>
                <c:if test="${empty param.p}">
                    <td><a href="/data-board/detail?post_no=${item.post_no}">${item.post_no}</a></td>
                    <td><a href="/data-board/detail?post_no=${item.post_no}">${item.post_title} [${item.reply_cnt}]</a></td>
                </c:if>
                <td>${item.writer_name}</td>
                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.reg_date}"></fmt:formatDate></td>
                <td><fmt:formatNumber value="${item.hit}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="write-button">
    <c:if test="${!empty param.p}">
    <h2>
        <button onclick="location.href='write?p=${param.p}&f=${param.f}&k=${param.k}'" type="button" class="btn btn-primary btn-lg">글 쓰기</button>
    </h2>
    </c:if>
    <c:if test="${empty param.p}">
    <h2>
        <button onclick="location.href='write'" type="button" class="btn btn-primary btn-lg">글 쓰기</button>
    </h2>
    </c:if>
</div>

<%--Page--%>
<div class="page-form">
    <c:if test="${startNum>1}">
        <button class="btn btn-outline-primary" onclick="location.href='?p=${startNum-1}&f=${param.f}&k=${param.k}'">
            이전
        </button>
    </c:if>
    <c:if test="${startNum<=1}">
        <button class="btn btn-outline-primary" onclick="alert('이전 페이지가 없습니다');">이전</button>
    </c:if>

    <c:forEach var="i" begin="0" end="4">
        <c:if test="${(startNum+i) <= lastNum}">
            <a class="-text-${(param.p==(startNum+i))?'highlight':''}"
               href="?p=${startNum+i}&f=${param.f}&k=${param.k}">${startNum+i}</a>
        </c:if>
    </c:forEach>

    <c:if test="${startNum+5<=lastNum}">
        <button class="btn btn-outline-primary" onclick="location.href='?p=${startNum+5}&f=${param.f}&k=${param.k}'">
            다음
        </button>
    </c:if>
    <c:if test="${startNum+5>lastNum}">
        <button class="btn btn-outline-primary" onclick="alert('다음 페이지가 없습니다');">다음</button>
    </c:if>
</div>
<div style="text-align: right">
    <span>${(empty param.p)?1:param.p} / ${lastNum} 페이지</span>
</div>

<%--footer--%>
<%@ include file="../html/footer.jsp" %>
</body>
</html>