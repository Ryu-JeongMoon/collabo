<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.servlet.project.vo.PjNoticeVO" %>
<%@ page import="com.servlet.project.vo.PjCommentVO" %>
<%@ page import="com.servlet.project.model.DAO" %>
<%@ page import="com.servlet.project.mybatis.DBService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 줄바꿈 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
    //내용 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%> 

<%
	int pj_idx = Integer.parseInt(request.getParameter("pj_idx"));
	String cPage = request.getParameter("cPage");
	System.out.println("pj_idx: "+pj_idx);
	System.out.println("cPage: "+cPage);
	
	SqlSession ss = DBService.getFactory().openSession(true);
	PjNoticeVO vo = ss.selectOne("pjnotice.one", pj_idx);
	ss.close();
	//System.out.println("vo: "+vo);
	
	session.setAttribute("pnVO", vo);
	System.out.println(">session pnVO: "+session.getAttribute("pnVO"));
%>

<%
	//댓글
	List<PjCommentVO> commlist = DAO.getCommList(pj_idx);
	System.out.println("댓글 리스트: "+commlist);
	
	pageContext.setAttribute("commlist", commlist);
	
	//댓글 개수
	//int c_idx = Integer.parseInt(request.getParameter("pj_idx"));
	int comcount = DAO.update_com_count(pj_idx);
	System.out.println("comcount: "+comcount);
	
	//조회수(상세 페이지에 들어오면 +1)
	int hitup = DAO.getUpdateHit(pj_idx);
	System.out.println("hitup: "+hitup);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">
<title>작성글 상세화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//게시글 수정
	function update_go(frm) {
		frm.action = "update_notice.jsp";
		frm.submit();
	}
	//게시글 삭제
	function delete_go(frm) {
		frm.action = "delete_notice_ok.jsp";
		frm.submit();
	}
	<%--댓글 입력 함수--%>
	$(document).ready(function(){
		$("#getDataBtn").click(getPcVO);
	});
	
	<%--댓글 삭제창
	function ans_del(c_idx) {
		var msg = confirm("댓글을 삭제합니다.");
		if(msg == true) {
			ans_del(c_idx);
		} else {
			return false;
		}
	}
	댓글 삭제(Ajax 방식)
	function ans_del(c_idx) {
		var param = "c_idx="+c_idx;
		
	}--%>
</script>
</head>
<body>
<div id="container">
		<h1>공지사항 상세</h1>
		<h4>${pnVO.title}</h4> <!--클릭한 게시글 제목이 표시되게 -->
		<hr>
		<p><a href="../pjnotice">[목록으로 이동]</a></p>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${pnVO.writer}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${pnVO.title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2">
						<!--  ${pnVO.content}-->
						${fn:replace(pnVO.content, cn, br)}
						</td>
					</tr>
					<!--  <tr>
						<th>첨부파일</th>
						<td>
						<c:if test="${not empty pnVO.file_name }">
							<a href="download.jsp?f_name=${pnVO.file_name }">${pnVO.file_name }</a>
						</c:if>
						<c:if test="${empty pnVO.file_name }">
							첨부파일 없음
						</c:if>
						</td>
					</tr>	-->				
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button" value="삭제" onclick="delete_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
<hr> <!-- 게시글 댓글 작성 -->
	<form method="post">
		<p>
			아이디<input type="text" name="writer">
			비밀번호<input type="password" name="pwd">
		</p>
		<textarea name="content" rows="4" cols="55" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
		<button type="submit" onclick="fn_comment(this.form)">댓글 등록</button>
		<input type="hidden" name="pj_idx" value="${pnVO.pj_idx }">
	</form>
<hr>
	<h5>Comments</h5>
<hr> <!-- 댓글 표시 -->
	<c:forEach var="PjCommentVO" items="${commlist }">
	<div class="comment">
		<form method="post">
			<p>▶${PjCommentVO.writer }&nbsp;&nbsp;|&nbsp;&nbsp;${PjCommentVO.write_date }</p>
			<p>${PjCommentVO.content }</p>
			<input type="button" value="댓글 삭제" onclick="ans_del(${PjCommentVO.c_idx })">
			<input type="hidden" name="c_idx" value="${PjCommentVO.c_idx }">
			<hr>
		</form>
	</div>
	</c:forEach>	
	</div>
</body>
</html>