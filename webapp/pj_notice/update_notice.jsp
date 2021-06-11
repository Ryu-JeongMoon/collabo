<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css"
          integrity="undefined" crossorigin="anonymous">
    <title>수정</title>

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
    <h1>작성글 수정</h1>
    <hr>
    <p><a href="../pjnotice">[목록으로 이동]</a></p>
    <form action="update_notice_ok.jsp" method="post">
        <table>
            <tbody>
            <!--  <tr>
						<th>작성자</th>
						<td><input type="text" name="writer" value="${pnVO.writer}"></td>
					</tr> -->
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${pnVO.title}"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea name="content" rows="5" cols="60" value="${pnVO.content}"></textarea>
                </td>
            </tr>
            <!--  <tr>
						<th>파일 업로드</th>
						<td><input type="file" name="f_name" value="${pnVO.file_name }"></td>
					</tr>-->
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2">
                    <button type="submit" value="수정">수정</button>
                    <button type="reset">다시 작성</button>
                    <input type="hidden" name="pj_idx" value="${pnVO.pj_idx}">
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