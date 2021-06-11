<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewpoint" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
<!-- 		post를 해줘야 화면에 안 보이고 보내진다..? -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #ddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eee; text-align: center;">글쓰기 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>분류</td>
					<td>
						<div class="form-group" style="text-align: center; margin: 0 auto;">
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="a_type" id="sick" autocomplete="off" value="병결" checked>
  									<label class="btn btn-outline-primary" for="sick">병결</label>
								<input type="radio" class="btn-check" name="a_type" id="half" autocomplete="off" checked="" value="조퇴">
  									<label class="btn btn-outline-primary" for="half">조퇴</label>
								<input type="radio" class="btn-check" name="a_type" id="job" autocomplete="off" checked="" value="취업활동">
  									<label class="btn btn-outline-primary" for="job">취업활동</label>
								<input type="radio" class="btn-check" name="a_type" id="untact" autocomplete="off" checked="" value="비대면">
  									<label class="btn btn-outline-primary" for="untact">비대면</label>
							</div>
						</div>
					<td>
				</tr>
				<tr>
					<td style="width: 110px"><h5>글 제목</h5></td>
					<td><input type="text" class = "form-control" placeholder="글 제목" name="a_title" maxlength="50" ></td>
				</tr>
				<tr>
					<td style="width: 110px"><h5>글쓴이</h5></td>
					<td><input type="text" class = "form-control" placeholder="글쓴이" name="a_writer" maxlength="50" ></td>
				</tr>
				
				<tr>
					<td style="width: 110px"><h5>글 내용</h5></td>
					<td><textarea class = "form-control" placeholder="글 내용" name="a_content" maxlength="2048" style="height : 350px"><c:out value="${a_content}" /> </textarea></td>
				</tr>
				<tr>
					<td style="width: 110px">첨부파일</td>
					<td>
					  <div class="form-group">
					      <input class="form-control" type="file" id="file" name="file_name">
					  </div>
					 </td>
					 
				</tr>
<!-- 				각각 tr에 넣어줘야 위 아래로 글쓰는 표가 된다 -->

			</tbody>
			</table>
			<button type="submit" class="btn btn-info" value="글쓰기">글쓰기 완료</button>
<!-- 			<input type="submit" href="writeAction.jsp" class="btn btn-primary pull-right" value="글쓰기"> -->
			<input type="button" class="btn btn-secondary" value="뒤로 가기" onclick="go_back()">
			
		</form>
		</div>
	</div>
	<script>
	function go_back() {
// 		alert("go_back 함수 실행 중");
		location.href="list.jsp";
	}
	</script>
</body>
</html>