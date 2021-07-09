<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
    <%@ include file="../fragments/head.html" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
    #woomoolWrap {
        max-width:700px;
        min-height:100%;
        margin:0 auto;
        background:#fff;
    }
</style>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div class="container" id="woomoolWrap">
    <p><a href="/board/getBoardList?flag_nq=N">공지사항 이동</a></p>
    <p><a href="/board/getBoardList?flag_nq=Q">QNA 이동</a></p>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>