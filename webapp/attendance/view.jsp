<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.servlet.attendance.vo.AttVO"%>
<%@page import="com.servlet.attendance.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
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
	<meta name="viewpoint" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
				integrity="undefined" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<title>상세 페이지 화면</title>
	<script>
		function update_go(frm){
			frm.action = "update.jsp";
			frm.submit();
		}
		function delete_go(frm){
			confirm("정말로 삭제하시겠습니까?")
			if (true) {
				frm.action = "deleteAction.jsp?a_idx=${a_idx }";
				frm.submit();
			} else {
				history.back();
			}
			
		}
		
	</script>

</head>
<body>
<%@include file ="navbar.jsp" %>

<h2 class="text-center">상세화면</h2>
<hr>
<div class="container">
	<div class="py-5 text-center">
	<form method="post" action="download.jsp" >
		<table class="table table-hover" border="1">
		<thead>
			<tr>
				<th colspan="3" style="background-color: #325d88; color:white; text-align: center;" >게시판 글 보기</th>
			</tr>		
		</thead>
		<tbody>
			<tr class="table-active">
				<th scope="row">글 제목</th>
				<td>
					<div class="form-group">
                        <fieldset>
                            <input class="form-control" name="post_no" id="post_no" type="text" value="${AttVO.a_title }"
                                   readonly="">
                        </fieldset>
                    </div>
				</td>
			</tr>
			<tr class="table-active">
				<th scope="row">분류</th>
				<td>
					<div class="form-group">
                        <fieldset>
                            <input class="form-control" name="post_no" id="post_no" type="text" value="${AttVO.a_type }"
                                   readonly="">
                        </fieldset>
                    </div>
				</td>
			</tr>
			<tr class="table-active">
				<th scope="row">글쓴이</th>
				<td>
					<div class="form-group">
                        <fieldset>
                            <input class="form-control" name="post_no" id="post_no" type="text" value="${AttVO.a_writer }"
                                   readonly="">
                        </fieldset>
                    </div>
				</td>
			</tr>
			<tr class="table-active">
				<th scope="row">작성일</th>
				<td>
					<div class="form-group">
                        <fieldset>
                            <input class="form-control" name="post_no" id="post_no" type="text" value="${AttVO.write_date }"
                                   readonly="">
                        </fieldset>
                    </div>
				</td>
			</tr>
			<tr class="table-active">
				<th scope="row">글 내용</th>
				<td>
					<div class="form-group" style="height:200px">
                        <fieldset>
                            <input class="form-control" name="post_no" id="post_no" type="text" value="${fn:replace(AttVO.a_content, cn, br)}"
                                   readonly=""  style="height:200px">
                        </fieldset>
                    </div>
				</td>
			</tr>
			<tr class="table-active">
				<th>첨부 파일</th>
				<td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="reg_date" id="reg_date" type="text"
                                    pattern="yyyy.MM.dd  hh:mm:ss" value="업로드된 파일.jpg">
                                  
                        </fieldset>
                    </div>
                </td>
<%-- 				<td colspan="2">${AttVO.file_name } --%>
<%-- 				<a href = "download.jsp?path=upload&name=<%=mr.getFilesystemName("file_name")%>"> --%>
<%-- 					다운로드할 파일(<%=mr.getOriginalFileName("file_name") %>)</a> --%>
<!-- 				</td> -->

			</tr>
			<tr class="table-active">
				<th >확인 여부</th>
				<td>
                    <div class="form-group">
                        <fieldset>
                           <button type="button" class="btn btn-outline-primary form-control">${AttVO.status }</button>
                        </fieldset>
                    </div>
                </td>
			</tr>
		</tbody>
		</table>
		
		<button class="btn btn-primary btn-lg" onclick="update_go(this.form)" type="button">
			수정
        </button>
		<button class="btn btn-danger btn-lg" onclick="delete_go(this.form)" type="button">
			삭제
        </button>
		<button class="btn btn-secondary btn-lg" onclick="location.href='list.jsp'" type="button">
			목록
        </button>
	</form>
	</div>

</div>



</body>
</html>