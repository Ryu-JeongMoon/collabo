<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.bc.bit.dao.DAO"%>
<%@page import="com.bc.bit.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.bit.vo.BITVO"%>
<%@page import="com.bc.bit.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 전달받은 데이터(idx)로 DB데이터 조회 후 화면 출력 --%>     
<%

	//1. 전달받은 데이터 확인
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));
	String cPage = request.getParameter("cPage"); //게시글 조회수 1증가 처리
	System.out.println("b_idx : "+b_idx);
	System.out.println("cPage : "+cPage);
	
	//2. DB관련작업 - SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//조회수
	int plusReadCount = DAO.getUpdateHit(b_idx);
	System.out.println("plusReadCount : "+plusReadCount);
	
	//3. DB관련작업 - 데이터 가져오기
	BITVO vo = ss.selectOne("BIT.one", b_idx);
	ss.close();
	//System.out.println(">> vo : "+vo);
	
	//EL, JSTL 사용 + 검색데이터 계속 사용을 위해 session에 등록
	session.setAttribute("BITVO", vo);
	System.out.println(">session BITBVO : "+ session.getAttribute("BITVO"));
	
	//내용부분에 빈칸 넣기
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>    

<%
	/* (보류) 
	//댓글 (게시글(b_idx)에 댓글이 있으면 화면 표시)
 	List<CommVO> commList = DAO.getCommList(b_idx);
	System.out.println("> 댓글 리스트 : "+commList);
	
	//EL, JSTL, 사용을 위한 scope 상에 데이터 등록하고 화면 표시
	pageContext.setAttribute("commList", commList);  */
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<style>
	#bit table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bit table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bit table th, #bit table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
</style>
<script>
	function update_go(frm){
		frm.action = "modify.jsp"; //수정 페이지
		frm.submit();
	}
	function delete_go(frm){
		frm.action = "delete_ok.jsp"; //삭제 페이지
		frm.submit();
	}
/* 	function list_go(frm){
		frm.action = "list.jsp"; //목록 페이지
		frm.submit();
	} */
</script>
</head>
<body>
<div id="bit">
	<h2>공지사항 : 상세화면</h2>
	<hr>
	<p><a href="../C_list" method="post">[목록으로 이동]</a></p>
	
	<form method="post">
	<table border="1">
		<tr>
			<th>날짜</th>
			<td>${BITVO.write_date }</td>
			<th>조회수</th>
			<td>${BITVO.hit }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td colspan="3">${BITVO.writer }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${BITVO.subject }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">
			<%-- ${BITVO.content } --%>
			${fn:replace(BITVO.content, cn, br) }
			</td>
		</tr>
		<%-- <tr>
			<td>첨부파일</td>
			<td colspan="3">
				<c:if test="${not empty BITVO.file_name }">
				<a href="download.jsp?file_name=${BITVO.file_name }">${BITVO.ori_name }</a>
				</c:if>
				<c:if test="${empty BITVO.file_name }">
				[첨부파일 없음]
				</c:if>  
			</td>
		</tr> --%>
		<tr>
			<td colspan="4">
				<input type="button" value="수 정" onclick="update_go(this.form)">
				<input type="button" value="삭 제" onclick="delete_go(this.form)">
				<!-- <input type="button" value="목 록" onclick="list_go(this.form)"> -->
			</td>
		</tr>
	</table>
	</form>
	
	<%-- (보류) 게시글에 대한 댓글 작성 영역 
	<form action="ans_write_ok.jsp" method="post">
	<table>
		<tr>
			<td><textarea rows="5" cols="50"
				placeholder="댓글 내용을 입력하세요." id="content"></textarea>
			</td>	
		</tr>
		<tr>
			<td rowspan="2">
				<input type="submit" value="댓글저장">
				<input type="hidden" name="b_idx" value="${BITVO.b_idx }">
			</td>
		</tr>
	</table>
	</form>
	--%>
	
	<%-- (보류) 게시글에 달린 댓글 표시 
	<table>
	<c:forEach var="commVO" items="${c_list }">
	<div class="comment">
		<form action="ans_del.jsp" method="post">
			<p>아이디 : ${commVO.writer } &nbsp;&nbsp; 날짜 : ${commVO.write_date }</p>
			<p>내용 : ${commVO.content }</p>
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="c_idx" value="${commVO.c_idx }">
		</form>
		<form action="ans_up.jsp" items="${c_list }">
			<input type="submit" value="댓글수정">
			<input type="hidden" name="c_idx" value="${commVO.c_idx }">
		</form>
	</div>
	<hr>
	</c:forEach>
	</table>
	--%>
	
	
	
	
</div>
</body>
</html>
