<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세</title>
<script>
	function updateBoard(frm) {
		location.href = "updateBoard.do?no=${board.no}";
	}
	
	function deletaBoard(frm) {
		location.href = "deleteBoard.do?no=${board.no}&flag_nq=${board.flag_nq}";
	}
	
	function cancelAnswer(frm) {
		location.href = "getBoard.do?no=${board.no}";
	}
	
	function insertAnswer(frm){
		//var text = document.getElementById('text').value;
		//var board_no = document.getElementById('board_no').value;
		var formData = $("form[name=answer]").serialize();
		$.ajax({  
			url : 'insertAnswer.do',
			data : formData,
			type : 'POST',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: "json",
			success : function(answer){
				$("#answer").html("<p id='text'>"+answer.text+"</p><input type='button' value='삭제' onclick='deleteAnswer(this)'><input type='button' value='수정' onclick='modifyAnswer(this)'>");
			}, 
			error : function (e){
				alert("wirte 실패");
			}
		});
		
	}
	
	function modifyAnswer(frm) {
		var text = $("#text");
		$("#answer").html("<textarea id='text' rows='6' cols='60' name='text'>"+text.text()+"</textarea><input type='button' onclick='updateAnswer(this)' value='답변 수정'><input type='button' onclick='cancelAnswer(this)' value='취소'>");
	}
	
	function updateAnswer(frm) {
		var formData = $("form[name=answer]").serialize();
		$.ajax({  
			url : 'updateAnswer.do',
			data : formData,
			type : 'POST',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(){
				location.reload();
			}, 
			error : function (e){
				alert("실패");
			}
		});
	}
	
	function deleteAnswer(frm) {
		var formData = $("form[name=answer]").serialize();
		$.ajax({  
			url : 'deleteAnswer.do',
			data : formData,
			type : 'POST',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(){
				location.reload();
			}, 
			error : function(){
				alert("실패");
			}
		});
		
	}
	
</script>
</head>
<body>
	<div id="container">
		<h1>글상세(getBoard.jsp)</h1>
		<p><a href="logout.do">Log-out</a></p>
		<hr>
		
		<form  action="download" method="post">
		<input type="hidden" name="no" value="${board.no}">
		<table>
			<tr>
				<td class="center">
					<input type="button" value="글 수정" onclick="updateBoard(this)">
				</td>
				<td class="center">
					<input type="button" value="글 삭제" onclick="deletaBoard(this)">
				</td>
			</tr>
			<c:if test="${not empty file}">
				<c:forEach var="file" items="${file}">
					<tr>
						<td><a href="fileDownload.do?file_no=${file.file_no }">${file.org_file_name }</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<th width="70">제목</th>
				<td>
					${board.title}
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					${board.writer }
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					${board.content}
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td >${board.regdate }</td>
			</tr>
			
		</table>
		</form>
		<form name="answer">
		<input type="hidden" name="no" value="${board.no}">
		<c:if test="${fn:contains(board.flag_nq, 'Q') && empty answer}">
			<div id="answer">
				<textarea name="text" id="text" rows="6" cols="60"></textarea>
				<input type="button"onclick="insertAnswer(this)" value="답변 등록">
			</div>
		</c:if>
		
		<c:if test="${not empty answer }">
			<div id="answer">
			<p id='text'>${answer.text}</p>
				<input type='button' value='삭제' onclick='deleteAnswer(this)'>
				<input type='button' value='수정' onclick='modifyAnswer(this)'>
			</div>
		</c:if>
		</form>
		<p>
			<a href="getBoardList.do?no=${board.no}&flag_nq=${board.flag_nq}">글 목록</a>		
		</p>
	</div>
</body>
</html>