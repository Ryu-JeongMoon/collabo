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
        var del_file_no = new Array();

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

<div class="container" id="container">
    <h1>글수정(updateBoard.jsp)</h1>
    <p><a href="/board/logout">Log-out</a></p>
    <hr>

    <form NAME="updateForm" action="/board/updateBoard" method="post" enctype="multipart/form-data">
        <input type="hidden" name="no" value="${board.no}">
        <input type="hidden" id="del_file_no" name="del_file_no" value="">
        <table>
            <tr>
                <th width="70">제목</th>
                <td>
                    <input type="text" name="title" size="30"
                           value="${board.title}">
                </td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>
                    ${board.writer }
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" rows="10" cols="40">${board.content}</textarea>
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>${board.regdate }</td>
            </tr>
            <tr>
                <c:forEach var="file" items="${file}">
                    <div id="file_${file.file_no }">
                            ${file.org_file_name}(${file.file_size}kb)
                        <input type="hidden" id="FILE_NO" value="${file.file_no }">
                        <button onclick="deleteFile(${file.file_no })" type="button">삭제</button>
                        <br>
                    </div>
                </c:forEach>
            </tr>
            <tr>
                <th>업로드</th>
                <td>
                    <input multiple="multiple" type="file" name="file">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="center">
                    <input type="submit" value="수정">
                </td>
            </tr>
        </table>
    </form>
    <p>
        <a href="/board/getBoard?no=${board.no}">취소</a>
        <a href="/board/getBoardList?no=${board.no}&flag_nq=${board.flag_nq }">글 목록</a>
    </p>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>