<%@page import="bitcamp.project.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	//파라미터 값 추출해서 vo에 저장
%>
	<jsp:useBean id="vo" class="bitcamp.project.vo.PjNoticeVO" />
	<jsp:setProperty property="*" name="vo" />
<%
	//System.out.println("local vo: "+vo);
	//System.out.println("pageContext vo: "+pageContext.getAttribute("vo"));
	
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try {
		ss.update("pjnotice.update", vo);
		//response.sendRedirect("pjnotice.jsp");
		response.sendRedirect("onelist.jsp?pj_idx="+ vo.getPj_idx());
%>
	<script>
        alert("정상적으로 수정 되었습니다.");	
    </script>	
<%
	} catch (Exception e) {
			e.printStackTrace();			
%>
	<script>
		alert("[예외 발생]\n목록페이지로 이동합니다.");
		location.href="../pjnotice";
	</script>
<%
		} finally {
			ss.close();
		}
%>