<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../fragments/head.html" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>글등록(insertQna.jsp)</title>
</head>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<body>

<div class="container" id="container">
    <h1>글등록</h1>
    <p><a href="/board/logout">Log-out</a></p>
    <hr>

    <form action="/board/insertBoard" method="post" enctype="multipart/form-data">
        <input type="hidden" name="flag_nq" value="${flag}">
        <table>
            <tr>
                <th width="70">제목</th>
                <td>
                    <input type="text" name="title" size="30">
                </td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>
                    <input type="text" name="writer" value="${sessionScope.loginMember.id}" readonly>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" rows="10" cols="40"></textarea>
                </td>
            </tr>
            <tr>
                <th>업로드</th>
                <td>
                    <input multiple="multiple" type="file" name="file">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="center">
                    <input type="submit" value="새글 등록">
                </td>
            </tr>
        </table>
    </form>
    <p><a href="/board/getBoardList?flag_nq=${flag}">글 목록 가기</a></p>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>