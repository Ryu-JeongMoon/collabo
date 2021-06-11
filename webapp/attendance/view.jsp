<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.bp.attendance.vo.AttVO"%>
<%@page import="com.bp.attendance.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    

<%
	String a_idx = request.getParameter("a_idx");
	System.out.println("a_idx : " + a_idx);
	
	SqlSession ss = DBService.getFactory().openSession();
	
	AttVO vo = ss.selectOne("attendance.one", a_idx);
	ss.close();
	System.out.println(" > vo : " + vo);
	
	session.setAttribute("AttVO", vo);
	System.out.println("> session AttVO : " + session.getAttribute("AttVO"));

// 	if (request.getParameter("a_idx") != null) {
// 		System.out.println(request.getParameter("a_idx");
// 	}

	//줄바꿈 + taglib prefix="fn"도 해줘야함 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");

%>

<%-- 파일 업로드 처리하고 파일 정보 화면 표시 from ex01.result.jsp //file upload--%>
<%--
	//한글처리 위한 UTF-8 설정
	request.setCharacterEncoding("utf-8");

	//(주의) form 태그에 enctype="multipart/form-data" 설정하면
	//request 객체를 통한 파라미터값 조회 안 됨(MultipartRequest 사용할 것)
	String file_name = request.getParameter("file_name");
	System.out.println("> file_name : " + file_name);

	//파일을 저장할 위치
	// 	String path = "c:/MyStudy/temp"; //특정 위치를 직접 지정해 줄 수도 있고 
	String path = this.getServletContext().getRealPath("/upload");
	System.out.println("path : " + path);
	
	MultipartRequest mr = new MultipartRequest(
			request, //요청객체
			path, //실제 파일을 저장할 경로
			50 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
			"UTF-8", //인코딩 형식
			new DefaultFileRenamePolicy());
			
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewpoint" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>상세 페이지 화면</title>
<script>
	function update_go(frm){
		frm.action = "update.jsp";
		frm.submit();
	}
	function delete_go(frm){
		frm.action = "delete.jsp";
		frm.submit();
	}
	
</script>

</head>
<body>
<h2 class="text-center">상세화면</h2>
<hr>
<div class="container">
	<div class="row">
	<form method="post" action="download.jsp" enctype="multipart/form-data">
		<table class="table table-striped">
		<thead>
			<tr>
				<th colspan="3">게시판 글 보기</th>
			</tr>		
		</thead>
		<tbody>
			<tr>
				<td>글 제목</td>
				<td><c:out value='${AttVO.a_title }' escapeXml="false" /></td>
			</tr>
			<tr>
				<td>분류</td>
				<td colspan="2">${AttVO.a_type }</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td colspan="2">${AttVO.a_writer }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td colspan="2">${AttVO.write_date }</td>
			</tr>
			<tr>
				<td style="height : 200px">글 내용</td>
<%-- 				<td colspan='2'><c:out value="${AttVO.a_content }" escapeXml="false"/></td> --%>
				<td colspan='2'>${fn:replace(AttVO.a_content, cn, br)}</td>
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td colspan="2">업로드된 파일.jpg</td>
<%-- 				<td colspan="2">${AttVO.file_name } --%>
<%-- 				<a href = "download.jsp?path=upload&name=<%=mr.getFilesystemName("file_name")%>"> --%>
<%-- 					다운로드할 파일(<%=mr.getOriginalFileName("file_name") %>)</a> --%>
<!-- 				</td> -->

			</tr>
			<tr>
				<td>확인 여부</td>
				<td colspan="2"><button type="button" class="btn btn-outline-success">${AttVO.status }</button></td>
<%-- 				<td colspan="2">${AttVO.status }</td> --%>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<a type="button" class="btn btn-primary" href="list.jsp">목록</a>
					<button type="button" class="btn btn-warning" onclick="update_go(this.form)">수정</button>
					<a type="button" class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?a_idx=${a_idx }">삭제</a>
				</td>
			</tr>
		</tfoot>
		</table>
	
	</form>
	</div>

</div>



</body>
</html>
