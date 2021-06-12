<%@page import="com.bc.bit.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장
	입력성공시 : 목록페이지로 이동(list.jsp)
	입력실패(예외) : 메세지 표시 후 이전화면(입력페이지) 이동
--%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출해서 VO에 저장
%>
	<jsp:useBean id="BITVO" class="com.bc.bit.vo.BITVO" />
	<jsp:setProperty property="*" name="BITVO"/>
<%
	System.out.println(">> BITVO : " +BITVO);

	//2. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true); //자동커밋상태(실행시 자동으로 커밋)
	
	//3. 매퍼의 insert SQL실행
	try {
		ss.insert("BIT.insert", BITVO);
		//4. 페이지 이동 처리(정상처리시)
%>
	<script>
	alert("정상입력이 완료되었습니다. \n목록페이지로 이동합니다.");
	location.href="../C_list";
	</script>
<%
	} catch (Exception e){
		//4. 페이지 이동 처리(예외발생)
		e.printStackTrace();
%>
	<script>
	alert("[예외발생] 입력 중 예외가 발생했습니다 \n"
			+ "담당자(8282)에게 연락하세요. \n"
			+ "이전페이지로 이동합니다.");
	history.back();
	</script>
<%
	}finally{
		ss.close(); //작업 끝나고 나면 close 처리
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>