<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta name="viewpoint" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<meta charset="UTF-8">
	<title>수정화면</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script>
		function go_back() {
			history.back();
		}
		
		//radio value값 가지고 오기  ????모르겠음
		function getRadioValue(){
			var a_type = $('#a_type').val();
			var btn-check = $(".btn-check").val();
			if (a_type = checked) {
				btn-check = a_type;
				
			}
			return btn-check;
		}
	</script>
</head>
<body>
<h2>글 수정화면</h2>
	<hr>
<div id="container">
	
	<div class="row">
		<form method="post" action="updateAction.jsp?a_idx=${AttVO.a_idx }">
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
					<td></td>
						<input type="hidden" id="a_type" name="a_type" value="${AttVO.a_type}" />
						<div class="form-group" style="text-align: center; margin: 0 auto;" >
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="a_type" id="sick" autocomplete="off" 
									${(AttVO.a_type == "sick")?"selected":""}>
  									<label class="btn btn-outline-primary" for="sick">병결</label>
								<input type="radio" class="btn-check" name="a_type" id="half" autocomplete="off" 
									${(AttVO.a_type == "half")?"checked":""}>
  									<label class="btn btn-outline-primary" for="half">조퇴</label>
								<input type="radio" class="btn-check" name="a_type" id="job" autocomplete="off" 
									${(AttVO.a_type == "job")?"checked":""}>
  									<label class="btn btn-outline-primary" for="job">취업활동</label>
								<input type="radio" class="btn-check" name="a_type" id="untact" autocomplete="off" 
									${(AttVO.a_type == "untact")?"checked":""}>
  									<label class="btn btn-outline-primary" for="untact">비대면</label>
							</div>
						</div>
					<td>
				</tr>
				<tr>
					<th style="width: 120px">글 제목</th>
					<td><input type="text" class = "form-control" value="${AttVO.a_title }" name="a_title" maxlength="50" ></td>
				</tr>
				<tr>
					<th style="width: 120px">작성자</th>
					<td><input type="text" class = "form-control" value="${AttVO.a_writer }" name="a_writer" maxlength="50" ></td>
				</tr>
				<tr>
					<th style="width: 120px">글 내용</th>
					<td><textarea class = "form-control"  name="a_content" maxlength="2048" style="height : 350px"><c:out value='${AttVO.a_content }' escapeXml="false" /></textarea></td>
				</tr>
				<tr>
					<td style="width: 110px">첨부파일</td>
					<td>
					  <div class="form-group">
					      <input class="form-control" type="file" id="formFile">
					  </div>
					 </td>
					 
				</tr>
<!-- 				각각 tr에 넣어줘야 위 아래로 글쓰는 표가 된다 -->
			</tbody>
			</table>
			<input type="submit" href="updateAction.jsp" class="btn btn-warning" value="수정 완료">
			<input type="button" class="btn btn-secondary" value="뒤로 가기" onclick="go_back()">
			
		</form>
		</div>
	</div>



</body>
</html>
