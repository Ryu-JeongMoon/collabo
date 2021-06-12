<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
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

<h4 class="alert-heading" align="center" style="margin-top: 200px">반갑습니다!</h4>
<p class="mb-0" style="text-align: center; font-size: 2em;">어서오세요 ${login}님.</p>

<%--footer--%>
<footer>
<%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>