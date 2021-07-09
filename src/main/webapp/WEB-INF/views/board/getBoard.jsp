<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%@ include file="../fragments/head.html" %>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
    <script>
        function updateBoard(frm) {
            if (${sessionScope.loginMember == null}) {
                alert('로그인이 필요한 서비스입니다.');
                location.href = '/login';
            } else
                location.href = "/board/updateBoard?no=${board.no}&flag_nq=${board.flag_nq}";
        }

        function deletaBoard(frm) {
            if (${sessionScope.loginMember == null}) {
                alert('로그인이 필요한 서비스입니다.');
                location.href = '/login';
            } else
                location.href = "/board/deleteBoard?no=${board.no}&flag_nq=${board.flag_nq}";
        }

        function cancelAnswer(frm) {
            location.href = "/board/getBoard?no=${board.no}";
        }

        function insertAnswer(frm) {
            var formData = $("form[name=answer]").serialize();
            $.ajax({
                url: '/board/insertAnswer',
                data: formData,
                type: 'POST',
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success: function (answer) {
                    $("#answer").html("<p id='text'>" + answer.text + "</p><input type='button' value='삭제' onclick='deleteAnswer(this)'><input type='button' value='수정' onclick='modifyAnswer(this)'>");
                },
                error: function (e) {
                    alert("write 실패");
                }
            });

        }

        function modifyAnswer(frm) {
            var text = $("#text");
            $("#answer").html("<textarea id='text' rows='6' cols='60' name='text'>" + text.text() + "</textarea><input type='button' onclick='updateAnswer(this)' value='답변 수정'><input type='button' onclick='cancelAnswer(this)' value='취소'>");
        }

        function updateAnswer(frm) {
            var formData = $("form[name=answer]").serialize();
            $.ajax({
                url: '/board/updateAnswer',
                data: formData,
                type: 'POST',
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function () {
                    location.reload();
                },
                error: function (e) {
                    alert("실패");
                }
            });
        }

        function deleteAnswer(frm) {
            var formData = $("form[name=answer]").serialize();
            $.ajax({
                url: '/board/deleteAnswer',
                data: formData,
                type: 'POST',
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function () {
                    location.reload();
                },
                error: function () {
                    alert("실패");
                }
            });

        }

    </script>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div id="container">
    <h1>글상세(getBoard.jsp)</h1>

    <hr>

    <form action="/board/download" method="post">
        <input type="hidden" name="no" value="${board.no}">
        <table>
            <tr>
                <td class="center">
                    <input type="button" value="글 수정" onclick="updateBoard(this)">
                </td>
                <td class="center">
                    <input type="button" value="글 삭제" onclick="deletaBoard(this)">
                </td>
            </tr>
            <c:if test="${not empty file}">
                <c:forEach var="file" items="${file}">
                    <tr>
                        <td><a href="/board/fileDownload?file_no=${file.file_no }">${file.org_file_name }</a></td>
                    </tr>
                </c:forEach>
            </c:if>
            <tr>
                <th width="70">제목</th>
                <td>
                    ${board.title}
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
                    ${board.content}
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>${board.regdate }</td>
            </tr>

        </table>
    </form>
    <form name="answer" >
        <input type="hidden" name="no" value="${board.no}">
        <c:if test="${fn:contains(board.flag_nq, 'Q') && empty answer}">
            <div id="answer">
                <textarea name="text" id="text" rows="6" cols="60"></textarea>
                <input type="button" onclick="insertAnswer(this)" value="답변 등록">
            </div>
        </c:if>

        <c:if test="${not empty answer }">
            <div id="answer">
                <p>${answer.text}</p>
                <input type='button' value='삭제' onclick='deleteAnswer(this)'>
                <input type='button' value='수정' onclick='modifyAnswer(this)'>
            </div>
        </c:if>
    </form>
    <p>
        <a href="/board/getBoardList?no=${board.no}&flag_nq=${board.flag_nq}">글 목록</a>
    </p>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>