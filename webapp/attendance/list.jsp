<%@page import="com.bp.attendance.common.Paging"%>
<%@page import="com.bp.attendance.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bp.attendance.DAO.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bp.attendance.vo.AttVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 현재 페이지에 표시할 데이터를 화면에 표시
	1. 페이징 처리를 위한 객체(Paging) 생성해서 필요한 데이터 참조
	2. 페이징 객체에 설정할 데이터 저장
	3. (DB) 전체 데이터 건수 조회
	4. (DB) 현재 페이지 표시할 데이터 조회
	5. 데이터 화면 표시(화면컨트롤 - 스타일 지정)
--%>    

<%
	//페이징 처리를 위한 Paging 객체 생성해서 값 읽고 설정
	Paging p = new Paging();

	//1. 전체 게시물의 수량 구하기
	p.setTotalRecord(DAO.getTotalCount());
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());

	//2. 현재 페이지 구하기
  	String cPage = request.getParameter("cPage");
  	if (cPage != null) {
  		p.setNowPage(Integer.parseInt(cPage));
  	}
	
  	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
  	p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당 게시글 수
  	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
  	
  	if (p.getEnd() > p.getTotalRecord()) {
  		p.setEnd(p.getTotalRecord());
  	}
  	System.out.println(">>현재페이지 : " + p.getNowPage());
  	System.out.println(">>시작번호(begin) : " + p.getBegin());
  	System.out.println(">>끝번호(end) : " + p.getEnd());
  	
  	//------ 블록(block) 계산하기 -----
  	//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호)
  	//시작페이지 번호 구하기
  	int nowPage = p.getNowPage();
  	int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
  	p.setBeginPage(beginPage);
  	p.setEndPage(p.getBeginPage() + p.getPagePerBlock());
  	
  	//4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
  	//끝페이지를 전체페이지 수로 변경처리
  	if (p.getEndPage() > p.getTotalPage()) {
  		p.setEndPage(p.getTotalPage());
  	}
  	System.out.println(">>시작페이지(beginPage) : " + p.getBeginPage());
  	System.out.println(">>끝페이지(endPage) : " + p.getEndPage());
  	
  	//=======================================
  	//현재 페이지 기준으로 DB 데이터(게시글) 가져오기
  	//시작번호(begin), 끝번호(end) 사용
  	List<AttVO> list = DAO.getList(p.getBegin(), p.getEnd());
  	System.out.println("> 현재페이지 글목록(list) : " + list);
  	
  	//============================
  	// EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
  	pageContext.setAttribute("list", list);
  	pageContext.setAttribute("pvo", p);

  	//----------------------------------------------------------
	SqlSession ss = DBService.getFactory().openSession();
	List<AttVO> aList = ss.selectList("attendance.list");
	ss.close();
	pageContext.setAttribute("attr_list", aList);
	System.out.println("aList" + aList);
	
// 	//-----------------이름으로 검색-------------------------------
// 	SqlSession ss2 = DBService.getFactory().openSession();
// 	List<AttVO> wList = ss2.selectList("attendance.writerSearch");
// 	ss2.close();
// 	pageContext.setAttribute("wList", wList);
// 	System.out.println("wList" + wList);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>출결 목록 보기</title>
	<meta name="viewpoint" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="text" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<%
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
	<h2 class="text-center" style="margin: 20px">출결 신청 목록</h2>
	<div id="container">
		<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>분류</th>
<!-- 					<th> -->
<!-- 						<ul class="nav nav-pills"> -->
<!-- 							 <li class="nav-item dropdown"> -->
<!-- 							    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">분류</a> -->
<!-- 							    <div class="dropdown-menu show" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 42px);" data-popper-placement="bottom-start"> -->
<!-- 							      <a class="dropdown-item" href="#">병결</a> -->
<!-- 							      <a class="dropdown-item" href="#">조퇴</a> -->
<!-- 							      <a class="dropdown-item" href="#">취업활동</a> -->
<!-- 							      <div class="dropdown-divider"></div> -->
<!-- 							      <a class="dropdown-item" href="#">비대면</a> -->
<!-- 							    </div> -->
<!-- 							  </li> -->
<!-- 						</ul> -->
<!-- 					</th> -->
					<th style="width: 30%;">제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>확인 상태</th>
					
				</tr>
			</thead>

			<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="7">
						<h2>현재 등록된 게시글이 없습니다.</h2>
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.a_idx }</td>
						<td>${vo.a_type }</td>
						<td><a href="view.jsp?a_idx=${vo.a_idx}&cPage=${pvo.nowPage}"><c:out value='${vo.a_title}' escapeXml="false"/></a></td>
						<td>${vo.a_writer }</td>
						<td>${vo.write_date }</td>
						<td>${vo.mod_date }</td>
						<c:if test="${vo.status == 1 }">
							<td><button type="button" class="btn btn-success disabled">O</button></td>
						</c:if>
						<c:if test="${vo.status == 0 }">
							<td><button type="button" class="btn btn-outline-success">X</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
<%-- 			<c:if test="${attr_list.size() <= 0 }"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="4">검색된 데이터가 없습니다.</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" >
						<ul class="pagination">
						<c:if test="${pvo.beginPage == 1 }">
							<li class="page-item disabled">
								<a class="page-link">이전</a>
							</li>
						</c:if>
						<c:if test="${pvo.beginPage != 1 }">
							<li class="page-item">
								<a class="page-link" href="list.jsp?cPage=${pvo.beginPage - 1}" >이전</a> 
							</li>
						</c:if>
						<!-- 블록 내 표시할 페이지 태그 작성 -->
						<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
							<c:choose>
								<c:when test="${pageNo == pvo.nowPage }">
									<li class="page-item active">
										<a class="page-link">${pageNo }</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="list.jsp?cPage=${pageNo}">${pageNo }</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<%--[다음으로] 사용여부 처리 --%>
						<c:if test="${pvo.endPage >= pvo.totalPage }">
							<li class="page-item disabled">
								<a class="page-link">다음</a></li>
						</c:if>
						<c:if test="${pvo.endPage < pvo.totalPage }">
							<li class="page-item">
								<a class="page-link" href="list.jsp?cPage=${pvo.endPage + 1 }">다음</a>
							</li>
						</c:if>
						</ul>
					</td>
					<td>
<!-- 						<div> -->
<!-- 							<form> -->
<!-- 								<fieldset> -->
<!-- 				                    <legend>글 검색 필드</legend>                     -->
<!-- 				                    <label>검색분류</label> -->
<!-- 				                        <select name = "f"> -->
<%-- 				                            <option ${(param.f == "title")? "selected" : ""} value = "title">제목</option> --%>
<%-- 				                            <option ${(param.f == "writer_Id")? "selected" : ""} value = "writer_Id">작성자</option> --%>
<!-- 				                        </select> -->
<!-- 				                    <label>검색어</label> -->
<%-- 				                        <input type = "text" name = "q" value = "${param.q}"/> --%>
<!-- 				                        <input type = "submit" value = "검색">                 -->
<!-- 				                </fieldset>         -->
<!-- 							</form>	 -->
<!-- 						</div>	 -->
	
					
						<form class="d-flex">
					        <input class="form-control me-sm-2" type="text" placeholder="검색할 내용을 입력하세요">
					        <button class="btn btn-secondary my-2 my-sm-0" type="submit" style="width: 110px">검색</button>
				     	</form>
					</td>
					<td>
						
					</td>
					<td>
						<a href="write.jsp" class="btn btn-info">글쓰기</a>
					</td>
				</tr>
			</tfoot>
		</table>
		

</body>
</html>
