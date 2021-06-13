<%@page import="com.servlet.u.model.MemberVO"%>
<%@page import="bitcamp.project.vo.PjCommentVO"%>
<%@page import="bitcamp.project.model.DAO"%>
<%@page import="bitcamp.project.paging.Paging"%>
<%@page import="bitcamp.project.vo.PjNoticeVO"%>
<%@page import="java.util.List"%>
<%@page import="bitcamp.project.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">

<title>프로젝트 공지사항 리스트(메인)</title>

<%--DB 데이터 조회하여 출력 --%>

<%--  //공지사항 리스트(전체)
	SqlSession ss = DBService.getFactory().openSession();
	List<PjNoticeVO> list = ss.selectList("pjnotice.all");
	ss.close();
	//System.out.println("> list: "+list);
	pageContext.setAttribute("attr_list", list);
--%>

<%-- 	//페이징처리(n개씩 출력)
	//페이징 객체 생성
	Paging p = new Paging();

	//전체 게시물 수량
	p.setTotalRecord(DAO.getTotalCount());
	p.setTotalPage();
	System.out.println("> 전체 게시글 수: "+p.getTotalRecord());
	System.out.println("> 전체 페이지 수: "+p.getTotalPage());

	//현재 페이지
	String cPage = request.getParameter("cPage");
	if(cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	//시작번호 끝 번호 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() +1);
	
	if(p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	System.out.println("> 현재 페이지: "+p.getNowPage());
	System.out.println("> 시작 번호(begin): "+p.getBegin());
	System.out.println("> 끝 번호(end): "+p.getEnd());
	
	//블록계산하기
	//블록 시작 페이지, 끝 페이지 구하기
	int nowPage = p.getNowPage();
	int beginPage = (nowPage -1 ) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() -1 );
	
	//끝페이지가 전체페이지 수보다 크면 끝페이지를 전체 페이지수로 변경처리
	if(p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	System.out.println("> 시작 페이지(beginPage): "+p.getBeginPage());
	System.out.println("> 끝 페이지(endPage): "+p.getEndPage());
	
	//현재 페이지 기준으로 DB데이터 가져오기
	List<PjNoticeVO> list = DAO.getList(p.getBegin(), p.getEnd());
	//System.out.println("> 현재페이지 글 목록(list): "+list);
	
	int totalCount = DAO.getTotalCount();
	System.out.println("totalCount: "+totalCount);
	
	//scope에 데이터 등록
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
--%>

<style>
	#container {
		width: 512px; margin: auto;
		/*border: 1px solid blue;*/
	}
	#container table{
      width: 600px;
      padding: 0 5px;
      border: 1px solid black;
      border-collapse: collapse;
   	}
   	th, td {
		border: 1px solid black;
	}
	.paging { list-style: none; }
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
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
</style>

</head>
<body>
<%@include file ="navbar.jsp" %>
<div id="content-container">
	<div class="py-5 text-center">
        <h2>프로젝트 공지사항</h2>
    </div>
	<%--검색 --%>
<div class="container-fluid search-form">
    <form action="pj_notice/search.jsp" method="get" class="d-flex">
        <div class="form-group">
           <%--  <legend class="hidden">공지사항 검색 필드</legend>
            <label class="hidden">검색분류</label>--%>
            <select class="form-select" name="f">
                <option ${(param.f=="title")?"selected":""} value="title">제목</option>
                <option ${(param.f=="writer")?"selected":""} value="writer">작성자</option>
                <option ${(param.f=="content")?"selected":""} value="content">내용</option>
            </select>
        </div>
            <input class="form-control me-sm-2" type="text" name="q" placeholder="Search">
            <button class="btn btn-outline-dark" type="submit">Search</button>
    </form>
</div>
	<table border="1" class="table table-hover">
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
	<%-- 	<th scope="col">수정일</th>  --%>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
 		<c:if test="${not empty list }">
		<c:forEach var="vo" items="${list }">
			<tr class="table-primary">	
				<td>${vo.getPj_idx() }</td>
				<td>
					<a href="pj_notice/onelist.jsp?pj_idx=${vo.pj_idx}&cPage=${pvo.nowPage}">${vo.title }
				<%--댓글 개수 카운트 <c:if test="${vo.com_count != 0 }">
						<small><b>[&nbsp;<c:out value="${vo.com_count}"/>&nbsp;]</b></small>
					</c:if>	--%>	
					</a>
				</td>
				<td>${vo.writer}</td>
				<td>${vo.regdate }</td>
	<%-- 		<td>${vo.editdate }</td> --%>
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
					<c:if test="${pvo.beginPage == 1 }">  <!-- 시작페이지가 1일 경우 비활성화 -->
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
<div class="write-button">
    <c:if test="${login == null}">
        <h2>
            <button onclick="alert('로그인 후 이용 가능합니다.');" type="button" class="btn btn-primary btn-lg">공지사항 작성</button>
        </h2>
    </c:if>
</div>
	<c:if test="${login != null}">
		<a type="button" class="btn btn-primary" href="pj_notice/write_notice.jsp">공지사항 작성</a>
	</c:if>
	</form>
</div>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</body>
</html>