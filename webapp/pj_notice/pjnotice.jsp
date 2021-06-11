<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css"
          integrity="undefined" crossorigin="anonymous">

    <title>프로젝트 공지사항 리스트(메인)</title>


    <style>
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
    <h1 class="text-center">프로젝트 공지사항</h1>
    <form class="d-flex" action="pj_notice/search" method="get">
        <%--검색 --%>
        <div class="input-group">
            <div class="form-group navbar-left">
                <select name="f" class="form-control">
                    <option ${(param.f=="title")?"selected":""} value="title">제목</option>
                    <option ${(param.f=="content")?"selected":""} value="content">내용</option>
                    <option ${(param.f=="writer")?"selected":""} value="writer">작성자</option>
                </select>
            </div>
            <!-- 검색 버튼-->
            <input class="form-control me-sm-2" type="text" placeholder="Search" name="q">
<%--            <input type="hidden" name="type" value="writerList">--%>
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </div>
    </form>
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
        <c:if test="${not empty list }">
            <c:forEach var="vo" items="${list }">
                <tr>
                    <td>${vo.getPj_idx() }</td>
                    <td>
                        <a href="pj_notice/onelist.jsp?pj_idx=${vo.pj_idx}&cPage=${pvo.nowPage}">${vo.title }
                            <c:if test="${vo.com_count != 0 }">
                                <small><b>[&nbsp;<c:out value="${vo.com_count}"/>&nbsp;]</b></small>
                            </c:if>
                        </a>
                    </td>
                    <td>${vo.getWriter() }</td>
                    <td>${vo.regdate }</td>
                    <td>${vo.editdate }</td>
                    <td>${vo.hit }</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <tr>
                <td colspan="6">
                    <h2>현재 등록된 게시글이 없습니다.</h2>
                </td>
            </tr>
        </c:if>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="6">
                <ol class="paging">
                    <%--이전으로 --%>
                    <c:if test="${pvo.beginPage == 1 }"> <!-- 시작페이지가 1일 경우 비활성화 -->
                        <li class="disable">prev</li>
                    </c:if>
                    <c:if test="${pvo.beginPage != 1 }">
                        <li>
                            <a href="pjnotice?cPage=${pvo.beginPage - 1}">prev</a>
                        </li>
                    </c:if>

                    <%--블록 내 표시할 페이지 태그 작성 --%>
                    <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
                        <c:choose>
                            <c:when test="${pageNo == pvo.nowPage  }"> <%--현재 페이지랑 누른 페이지 같으면 링크처리x --%>
                                <li class="now">${pageNo }</li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="pjnotice?cPage=${pageNo}">${pageNo}</a> <%--현재 페이지랑 누른 페이지 다르면 링크처리 --%>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <%--다음으로 --%>
                    <c:if test="${pvo.endPage >= pvo.totalPage }">
                        <li class="disable">next</li>
                    </c:if>
                    <c:if test="${pvo.endPage < pvo.totalPage }">
                        <li>
                            <a href="pjnotice?cPage=${pvo.endPage + 1 }">next</a>
                        </li>
                    </c:if>
                </ol>
            </td>
        </tr>
        </tfoot>
    </table>
    <form method="post">
        <%--공지사항 작성--%>
        <a type="button" class="btn btn-primary" href="pj_notice/write_notice.jsp">공지사항 작성</a>
    </form>
</div>

<%--footer--%>
<footer id="footer">
<%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>