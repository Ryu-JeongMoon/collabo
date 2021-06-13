<%@page import="com.servlet.u.model.MemberVO"%>
<%@page import="bitcamp.project.vo.PjNoticeVO"%>
<%@page import="bitcamp.project.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	PjNoticeVO vo = (PjNoticeVO)session.getAttribute("pnVO");
	
	SqlSession ss = DBService.getFactory().openSession(true);
	try {
		ss.delete("pjnotice.delete", vo.getPj_idx());
		
%>		
	<script>
        alert("정상적으로 삭제 되었습니다.");
        location.href = "../pjnotice";					
    </script>
<%
	} catch (Exception e) {
%>
	 <script>
         alert("[예외 발생]\n목록페이지로 이동합니다.");
         location.href = "../pjnotice";
     </script>	
<% 	} finally {
		ss.close();
	}

%>
