<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewpoint" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
				integrity="undefined" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<title>수정화면</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script>
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
<%@include file ="navbar.jsp" %>

<div class="container">
	 <div class="py-5 text-center">
	        <h2>글 수정</h2>
	 </div>
	<form method="post" action="updateAction.jsp?a_idx=${AttVO.a_idx }">
<!-- 		post를 해줘야 화면에 안 보이고 보내진다..? -->
		<table class="table table-hover" border="1">
			<thead>
				<tr>
				</tr>
			</thead>
			<tbody>
				<tr class="table-active">
					<th scope="row">글 제목</th>
					<td>
						<div class="form-group">
	                        <fieldset>
	                            <input class="form-control" name="a_title" type="text"
	                                   value="${AttVO.a_title }">
	                        </fieldset>
	                    </div>
					</td>
				</tr>
				<tr class="table-active">
					<th scope="row">분류</th>
					<td>
						<input type="hidden" id="a_type" name="a_type" value="${AttVO.a_type}" />
						<div class="form-group" style="text-align: center; margin: 0 auto;" >
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="a_type" id="sick" autocomplete="off" 
									${(AttVO.a_type eq "sick")?"checked":""}>
  									<label class="btn btn-outline-primary" for="sick">병결</label>
								<input type="radio" class="btn-check" name="a_type" id="half" autocomplete="off" 
									${(AttVO.a_type eq "half")?"checked":""}>
  									<label class="btn btn-outline-primary" for="half">조퇴</label>
								<input type="radio" class="btn-check" name="a_type" id="job" autocomplete="off" 
									${(AttVO.a_type eq "job")?"checked":""}>
  									<label class="btn btn-outline-primary" for="job">취업활동</label>
								<input type="radio" class="btn-check" name="a_type" id="untact" autocomplete="off" 
									${(AttVO.a_type eq "untact")?"checked":""}>
  									<label class="btn btn-outline-primary" for="untact">비대면</label>
							</div>
						</div>
					</td>
				</tr>
				<tr class="table-active">
					<th scope="row">작성자</th>
					<td>
	                    <div class="form-group">
	                        <fieldset>
	                            <input class="form-control" id="a_writer" name="a_writer" type="text"
	                                   value="${AttVO.a_writer }">
	                        </fieldset>
	                    </div>
                	</td>
				</tr>
				<tr class="table-active">
					<th scope="row">글 내용</th>
						<td>
		                    <div class="form-group">
		                        <fieldset>
		                            <input class="form-control" id="post_content" name="a_content" type="text"
		                                   value='${AttVO.a_content }' maxlength="2048" style="height : 200px">
		                        </fieldset>
		                    </div>
		                </td>
				</tr>
				<tr class="table-active">
					<td scope="row">첨부파일</td>
					<td>
					  <div class="form-group">
					      <input class="form-control" type="file" id="formFile">
					  </div>
					</td>
					 
				</tr>
<!-- 				각각 tr에 넣어줘야 위 아래로 글쓰는 표가 된다 -->
			</tbody>
		</table>
		<div class="row" align="center">	
			<div class="col">
				<button class="btn btn-primary btn-lg"
                        onclick="location.href='updateAction.jsp'"
                        type="submit">완료
                </button>
                <button class="btn btn-danger btn-lg"
                        onclick="alert('입력한 내용을 삭제합니다. 다시 입력 해주세요.');"
                        type="reset">취소
                </button>
<%--                 <c:if test="${!empty pvo.nowPage}"> --%>
<!-- 	                <button class="btn btn-secondary btn-lg" -->
<%-- 	                        onclick="location.href='list?p=${param.p}&f=${param.f}&k=${param.k}'" --%>
<!-- 	                        type="button">목록으로 -->
<!-- 	                </button> -->
<%--                 </c:if> --%>
                <c:if test="${empty pvo.nowPage}">
                    <button class="btn btn-secondary btn-lg"
                            onclick="location.href='list.jsp'"
                            type="button">목록으로
                    </button>
                </c:if>
			</div>
		</div>	
	</form>
</div>

</body>
</html>











