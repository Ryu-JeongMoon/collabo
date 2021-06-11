<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Refresh" content="1.5; url=login.jsp">
    <title>로그인 실패</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

    <style>
        * {
            font-family: NanumGothic, 'Malgun Gothic';
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

<div class="alert alert-dismissible alert-warning">
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    <h4 class="alert-heading" align="center">Warning!</h4>
    <p class="mb-0" style="text-align: center; font-size: 2em;">로그인에 실패하였습니다. 아이디 또는 비밀번호를 다시 확인하십시오.<br>
    잠시 후 로그인 화면으로 이동됩니다.</p>
</div>


<%--footer--%>
<%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>

</body>
</html>