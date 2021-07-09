<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../fragments/head.html" %>
    <title>Board</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div class="container" id="container">
    <h1>QnA</h1>

    <!-- 데이터 표시영역 -->
    <table>
        <tr>
            <th width="100">번호</th>
            <th width="200">제목</th>
            <th width="150">작성자</th>
            <th width="150">작성일</th>
            <th width="100">조회수</th>
        </tr>

        <c:if test="${not empty boardList}">
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td class="center">${board.no }</td>
                    <td>
                        <a href="/board/getBoard?no=${board.no}&cnt=1&flag_nq=Q">${board.title }</a>
                        <c:forEach var="answer" items="${answerList}">
                            <c:if test="${board.no eq answer.board_no}">
                                답변완료
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${board.writer }</td>
                    <td>${board.regdate }</td>
                    <td>${board.hit }</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>

    <div>
        <!-- 검색을 위한 폼  -->
        <form action="/board/getBoardList" method="post">
            <table class="border-none">
                <tr>
                    <td>

                        <select name="searchCondition">
                            <option value="TITLE">제목
                            <option value="CONTENT">내용
                        </select>
                        <!--
			 <select name="searchCondition">
			 <c:forEach var="option" items="${conditionMap }">
			 	<option value="${option.value }">${option.key }</option>
			 </c:forEach>
			 </select>
			 -->
                        <input type="text" name="searchKeyword">
                        <input type="submit" value="검색">
                        <input type="hidden" value="Q" name="flag_nq">
                    </td>
                </tr>
            </table>
        </form>
        <!-- id가 admin 일 경우만 뜨게??? -->
        <p><a href="/board/insertBoard?flag_nq=Q">글등록</a></p>
        <ul>
            <c:if test="${pageMaker.prev}">
                <li class="page"><a href="/board/getBoardList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <li class="page"><a href="/board/getBoardList${pageMaker.makeQuery(idx)}">${idx}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li class="page"><a href="/board/getBoardList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
            </c:if>
        </ul>
    </div>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>