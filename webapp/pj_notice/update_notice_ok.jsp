<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.servlet.project.mybatis.DBService" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//파라미터 값 추출해서 vo에 저장
%>
	<jsp:useBean id="vo" class="com.servlet.project.vo.PjNoticeVO" />
	<jsp:setProperty property="*" name="vo" />
<%
	//System.out.println("local vo: "+vo);
	//System.out.println("pageContext vo: "+pageContext.getAttribute("vo"));
	
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try {
		ss.update("pjnotice.update", vo);
		//response.sendRedirect("pjnotice.jsp");
		response.sendRedirect("onelist.jsp?pj_idx="+ vo.getPj_idx());
		} catch (Exception e) {
			e.printStackTrace();
			
%>
	<script>
		alert("[예외 발생]\n목록페이지로 이동합니다.");
		location.href="http://localhost:8080/pjnotice";
	</script>
<%
		} finally {
			ss.close();
		}
%>