<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css"
      integrity="undefined" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색</title>
    <style>
        #container {
            width: 512px;
            margin: auto;
            /*border: 1px solid blue;*/
        }

        #container table {
            width: 500px;
            padding: 0 5px;
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
        }

        .paging {
            list-style: none;
        }

        .paging li {
            float: left;
            margin-right: 8px;
        }

        .paging li a {
            text-decoration: none;
            display: block;
            padding: 3px 7px;
            border: 1px solid #00B3DC;
            font-weight: bold;
            color: black;
        }

        .paging .disable {
            padding: 3px 7px;
            color: silver;
        }

        .paging .now {
            border: 1px solid #00B3DC;
            padding: 3px 7px;
            background-color: #ff4aa5;
        }

        .paging li a:hover {
            background-color: #00B3DC;
            color: white;
        }

        footer {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            padding: 15px 0;
            text-align: center;
        }
    </style>
</head>
<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<div id="container">
    <h1>검색 결과</h1>
    <hr>
    <p><a href="../pjnotice">[목록으로 이동]</a></p>
    <table>
        <thead>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>수정일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty list }">
            <c:forEach var="vo" items="${list }">
                <tr>
                    <td>${vo.getPj_idx() }</td>
                    <td>
                        <a href="onelist.jsp?idx=${vo.pj_idx}">${vo.title }</a></td>
                    <td>${vo.getWriter() }</td>
                    <td>${vo.regdate }</td>
                    <td>${vo.editdate }</td>
                    <td>${vo.hit }</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <tr>
                <td colspan="6">검색된 데이터가 없습니다</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>