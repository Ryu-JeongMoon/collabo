<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
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
<script>
	function save_go(frm){
		//DB 수정 작업 요청
		frm.action = "modify_ok.jsp";
		frm.submit();
	}
</script>
</head>
<body>
<div id="bit">
	<h2>공지사항 : 수정</h2>
	<hr>
	<p><a href="../C_list">[ 목록으로 이동 ]</a></p>

	<form method="post" action="modify_ok.jsp?b_idx=${BITVO.b_idx }">
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${BITVO.writer }"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="${BITVO.subject }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60">${BITVO.content }</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="save_go(this.form)">
					<input type="reset" value="다시작성">
					<input type="hidden" name="b_idx" value="${BITVO.b_idx }">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>

</div>
</body>
</html>