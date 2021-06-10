<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bitcamp.project.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="PjNoticeVO" class="bitcamp.project.vo.PjNoticeVO" />
	<jsp:setProperty property="*" name="PjNoticeVO"/>
<%--	//파일 업로드 확인
	//파일 저장 위치
	String path = this.getServletContext().getRealPath("/file_upload");
	System.out.println("path: "+path);
	
	MultipartRequest mr = new MultipartRequest(
	         request, //요청객체
	         path, //실제 파일을 저장할 경로
	         10 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
	         "UTF-8", //인코딩 형식
	         new DefaultFileRenamePolicy());
--%>	
<%--	<h1>파일업로드 결과 보기</h1>
   <h2>제목(title) : <%=mr.getParameter("title") %></h2>
   <h2>파일(f_name) : <%=mr.getParameter("f_name") %></h2>  <!-- null로 나옴 -->
   <h2>원본파일명 : <%=mr.getOriginalFileName("f_name") %></h2> 
   <h2>저장파일명 : <%=mr.getFilesystemName("f_name") %></h2> <!-- 물리적으로 저장된 파일이름, 이걸로 써야함 -->
   <h2>파일타입 : <%=mr.getContentType("f_name") %></h2>
   <hr>
 --%>   
<%--
	File file = mr.getFile("f_name");
	out.println("<h2>파일이름 : "+file.getName() + "</h2>");
	out.println("<h2>파일크기 : "+file.length() + "</h2>");
--%>
<%
	System.out.println("> PjNoticeVO: "+PjNoticeVO);
	
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//빈칸 있는 경우
%>
	<c:if test="${PjNoticeVO.writer == null || PjNoticeVO.pwd == null || 
					PjNoticeVO.title == null || PjNoticeVO.content == null ||
					PjNoticeVO.writer.equals(' ') || PjNoticeVO.pwd.equals(' ') ||
					PjNoticeVO.title.equals(' ') || PjNoticeVO.content.equals(' ')}">
	 <script>
	 	alert("입력이 안 된 항목이 있습니다.");
	 	history.back();
	 </script>
	</c:if>
	
<%	
	try {
		ss.insert("pjnotice.insert", PjNoticeVO);
%>
	<script>
		alert("정상적으로 입력되었습니다.");
		location.href="../pjnotice";
	</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
%>
	<script>
		alert("[예외 발생]\n목록페이지로 이동합니다.");
		history.back();  <%--예외발생하면 목록페이지로 이동--%>
	</script>
<%
	} finally {
	ss.close();
	}
%>

 