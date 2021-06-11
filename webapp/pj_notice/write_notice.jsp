<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css"
          integrity="undefined" crossorigin="anonymous">
    <title>공지사항 입력화면</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

    <style>
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
    <h1>공지사항 작성</h1>
    <hr>
    <p><a href="../pjnotice">[뒤로가기]</a></p>
    <form action="write_notice_ok.jsp" method="post">
        <table>
            <tbody>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="text" name="writer"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea name="content" rows="5" cols="60" placeholder="내용을 입력해주세요."></textarea>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td>
                    <div class="form-group">
                        <!--파일
                        <label for="formFile" class="form-label mt-4">파일 선택</label>
                        <input class="form-control" type="file" id="formFile" name="f_name">
                        -->
                    </div>
                    <input type="submit" value="저장">
                    <input type="reset" value="취소">
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

</body>
</html>