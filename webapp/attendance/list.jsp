<%@page import="com.servlet.attendance.common.Paging"%>
<%@page import="com.servlet.attendance.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.servlet.attendance.DAO.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.servlet.attendance.vo.AttVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
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
	<meta name="viewpoint" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
				integrity="undefined" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
   	<style type="text/css">
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        .-text-highlight {
            color: #0f0f0f;
        }

        .hidden {
            display: none;
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .search-form {
            text-align: right;
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
        }

        .page-form {
            text-align: center;
            font-size: 1.5em;
        }

        .write-button {
            text-align: right;
            margin-right: 50px;
        }

        ul li {
            list-style-type: none;
        }

        table {
            table-layout: fixed;
            word-break: break-all;
        }
    </style>
    <script>
   var btn;
   //버튼 비활성화 --실패
   function btn_off() {
	   confirm('확인하셨습니까?');
	   if (true) {
		   btn = $('.oxbtn');
		   btn.disabled = 'disabled';
		   btn.addClass('okay');
	   }
   }
    </script>
</head>
<body>
<%--navbar--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbarResponsive">
    <div class="container-fluid">
        <a class="navbar-brand" href="">BIIT</a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="">HOME
                        <span class="visually-hidden">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">공지사항 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/pjnotice">프로젝트 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="list">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">일정 관리</a>
                </li>
                <c:choose>
                    <c:when test="${login != null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/login.jsp"
                               onclick="return confirm('로그아웃 하시겠습니까?');">${login}님 로그아웃</a>
                        </li>
                    </c:when>
                    <c:when test="${login == null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/login.jsp">로그인</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<%--Search Form--%>
<div class="container-fluid search-form">
    <form class="d-flex">
        <div class="form-group">
            <legend class="hidden">공지사항 검색 필드</legend>
            <label class="hidden">검색분류</label>
            <select class="form-select" name="f">
                <option value="a_title" selected>제목</option>
                <option value="a_writer">작성자</option>
                <option value="a_writer">내용</option>
            </select>
        </div>
        <div class="form-group">
            <input class="form-control me-sm-2" type="text" name="k"  placeholder="검색어 입력">
        </div>
        <div class="form-group">
            <button class="btn btn-outline-dark" type="submit">검색</button>
        </div>
    </form>
</div>

<%
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
	<h2 class="text-center" style="margin: 20px">출결 신청 목록</h2>
	<div class="content-container"  style="margin: 20px"> 
		<table class="table table-hover" border="1">
			<thead>
				<tr>
					<th scope="col">글 번호</th>
					<th scope="col">분류</th>
					<th scope="col" style="width: 30%;">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">작성일</th>
					<th scope="col">수정일</th>
					<th scope="col">확인 상태</th>
				</tr>
			</thead>

			<tbody>
<%-- 			<c:if test="${empty list }"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="7"> -->
<!-- 						<h2>현재 등록된 게시글이 없습니다.</h2> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
			<c:if test="${not empty list }">
				<c:forEach var="vo" items="${list }">
					<tr class="table-primary">
						<td>${vo.a_idx }</td>
						<td>${vo.a_type }</td>
						<td><a href="view.jsp?a_idx=${vo.a_idx}&cPage=${pvo.nowPage}" class="text-info"><c:out value='${vo.a_title}' escapeXml="false"/></a></td>
						<td>${vo.a_writer }</td>
						<td>${vo.write_date }</td>
						<td>${vo.mod_date }</td>
						<c:if test="${vo.status == 1 }">
							<td><button type="button" class="btn btn-primary disabled oxbtn okay" >O</button></td>
						</c:if>
						<c:if test="${vo.status == 0 }">
							<td><button type="button" class="btn btn-outline-primary oxbtn" onclick="btn_off()">X</button></td>
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
		</table>
	</div>		
<!-- 글쓰기 -->
	<div class="write-button">
		<h2>
             <button onclick="location.href='write.jsp'" type="button"
                     class="btn btn-primary btn-lg">글 쓰기
             </button>
         </h2>
	</div>
			
<!-- paging-->
	<div class="page-form">
		<!--[이전페이지] -->
		<c:if test="${pvo.beginPage == 1 }">
			<button class="btn btn-outline-primary" onclick="alert('이전 페이지가 없습니다');" disabled>
				이전
			</button>
		</c:if>
		<c:if test="${pvo.beginPage != 1 }">
			<button class="btn btn-outline-primary" onclick="location.href='list.jsp?cPage=${pvo.beginPage - 1}'">
				이전
			</button>
		</c:if>
		<!--[현재페이지] -->
		<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:choose>
				<c:when test="${pageNo == pvo.nowPage }">
					${pageNo }
				</c:when>
				<c:otherwise>
					<a class="-text-highlight text-info" href="list.jsp?cPage=${pageNo}">${pageNo }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<%--[다음으로] 사용여부 처리 --%>
		<c:if test="${pvo.endPage >= pvo.totalPage }">
			<button class="btn btn-outline-primary" onclick="alert('다음 페이지가 없습니다');">다음</button>
		</c:if>
		<c:if test="${pvo.endPage < pvo.totalPage }">
			<button class="btn btn-outline-primary" onclick='location.href="list.jsp?cPage=${pvo.endPage + 1 }"'>다음</button>>
		</c:if>
	</div>	
	
	<div style="text-align: right">
	    <span>${(empty pvo.nowPage)?1:pvo.nowPage} / ${pvo.endPage!=0?pvo.totalPage:1} 페이지</span>
	</div>	
		
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</body>
</html>