<%@page import="com.servlet.u.model.MemberVO"%>
<%@page import="com.servlet.attendance.DAO.DAO"%>
<%@page import="java.io.PrintWriter"%>
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
// 	int a_index = Integer.parseInt(a_idx);

	SqlSession ss = DBService.getFactory().openSession();
	
	AttVO vo = ss.selectOne("attendance.one", a_idx);
	ss.close();
	System.out.println(" > vo : " + vo);
	
	session.setAttribute("AttVO", vo);
	System.out.println("> session AttVO : " + session.getAttribute("AttVO"));
	
	//로그인 확인
// 	String userID = null;
// 	if (session.getAttribute("userID") != null ) { //id가 있으면 그 아이디 유지하게 하는 것
// 		userID = (String) session.getAttribute("userID");
// 	}
	
// 	if (userID == null ) {
// 		PrintWriter script = response.getWriter();
// 		script.println("<script>");
// 		script.println("alert('로그인을 해주세요')");
// 		script.println("location.href = 'login.jsp'"); //로그인이 안 된 사람은 로그인페이지로 가게
// 		script.println("</script>");
// 	}
// 	//글 확인
// 	if ( a_index == 0 ) {
// 		PrintWriter script = response.getWriter();
// 		script.println("<script>");
// 		script.println("alert('유효하지 않은 글입니다..')");
// 		script.println("location.href = 'list.jsp'"); 
// 		script.println("</script>");
// 	}
// 	MemberVO mvo = new DAO().selectOne(a_idx);
// 	vo = new DAO().selectOne(a_idx); //id값을 가지고 그 글을 가져오는 거임 
// 	if (!id.equals(vo.getId())) {
// 		PrintWriter script = response.getWriter();
// 		script.println("<script>");
// 		script.println("alert('권한이 없습니다.')");
// 		script.println("location.href = 'login.jsp'"); //로그인이 안 된 사람은 로그인페이지로 가게
// 		script.println("</script>");
// 	}

// 	if (request.getParameter("a_idx") != null) {
// 		System.out.println(request.getParameter("a_idx");
// 	}

	//줄바꿈 + taglib prefix="fn"도 해줘야함 
	pageContext.setAttribute("br", "<br>");
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
		
		$(function(){
			$(".chk").on("click",function(){
				console.log("클릭");
				$(this).val("O");
			})
		})
		
	</script>

</head>
<body>
<%@include file ="navbar.jsp" %>
<div class="container">
	<div class="py-5 text-center">
		<h2>글 상세보기</h2>
	</div>
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
                            <input class="form-control" name="a_title" id="a_title" type="text" value="${AttVO.a_title }"
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
                            <input class="form-control" name="a_type" id="a_type" type="text" value="${AttVO.a_type}"
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
                            <input class="form-control" name="a_writer" id="a_writer" type="text" value="${AttVO.a_writer }"
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
                            <input class="form-control" name="write_date" id="write_date" type="text" value="${AttVO.write_date }"
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
                            <input class="form-control" name="write_content" id="write_date" type="text" value="${fn:replace(AttVO.a_content, cn, br)}"
                                   readonly=""  style="height:200px">
                        </fieldset>
                    </div>
				</td>
			</tr>
			<tr class="table-active">
				<th>첨부 파일</th>
				<td>
					<div align="center">
						<a style="text-align:left; ">업로드된 파일.jpg</a>
					</div>
<!--                     <div class="form-group"> -->
<!--                         <fieldset> -->
<!--                             <input class="form-control" name="reg_date" id="reg_date" type="text" -->
<!--                                     pattern="yyyy.MM.dd  hh:mm:ss" value="업로드된 파일.jpg"> -->
<!--                         </fieldset> -->
<!--                     </div> -->
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
                           <input type="button" class="btn btn-outline-primary form-control chk" id="status0" name="status" value='${(AttVO.status==0)?"X":"O" }' />
                        </fieldset>
                    </div>
                </td>
			</tr>
		</tbody>
		</table>
		<div class="col" align="center">
		
			<button class="btn btn-primary btn-lg" onclick="update_go(this.form)" type="button">
				수정
	        </button>
			<button class="btn btn-danger btn-lg" onclick="delete_go(this.form)" type="button">
				삭제
	        </button>
			<button class="btn btn-secondary btn-lg" onclick="location.href='list.jsp'" type="button">
				목록
	        </button>
	    </div>
	</form>
</div>




</body>
</html>