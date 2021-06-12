<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력화면</title>
</head>
<body>
<style>
	#bit table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bit table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bit table th, #bit table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
</style>
<div id="bit">
	<h2>공지사항 : 입력화면</h2>
	<hr>
	<p><a href="../C_list">[ 목록으로 이동 ]</a></p>
	
	<!-- enctype 쓰면 전송 안됨 -->
	<form method="post" action="write_ok.jsp"> 
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
				<input type="file" value="파일 선택" name="file">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" value="저 장">
					<input type="reset" value="취 소">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	
</div>
</body>
</html>