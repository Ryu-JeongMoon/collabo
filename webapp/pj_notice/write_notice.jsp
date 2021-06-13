<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">
<title>공지사항 입력화면</title>
</head>
<style>
    * {
        font-family: NanumGothic, 'Malgun Gothic';
    }

    .col {
        display: flex;
        flex-direction: row;
        justify-content: center;
        padding: 10px;
        align-items: center;
    }

    .col button {
        padding: 10px;
        margin: 2px;
    }
</style>
<body>
<%@include file ="navbar.jsp" %>
	<div id="container">
	<div class="py-5 text-center">
        	<h2>공지사항 작성</h2>
    	</div>
 	<form action="write_notice_ok.jsp" method="post" >
			<table class="table table-hover" border="1">
				<tbody>
					<tr class="table-active">
						<th scope="row">제목</th>
						<td>
						 	<div class="form-group">
                        <fieldset>
                            <input class="form-control" id="title" name="title" type="text" placeholder="제목을 입력하세요">
                        </fieldset>
                   			 </div>
						</td>
					</tr>
					<tr class="table-active" size="2">
						<th>내용</th>
						<td>
							<div class="form-group">
								<fieldset>
									<input class="form-control" id="content" name="content" type="text"
                                   placeholder="내용을 입력하세요">
								</fieldset>
							</div>
						</td>
					</tr>
					<tr class="table-active">
						<th>글쓴이</th>
						<td>
							<div class="form-group">
							<fieldset>
						 		<input class="form-control" name="writer" id="writer" value="${login}" readonly
                                   type="text">
                            </fieldset>
                         	</div>          
                       </td>
					</tr>
				</tbody>
			</table>
				<div class="row">
					<div class="col">
						<button class="btn btn-primary btn-lg" type="submit" value="작성 완료">작성 완료</button>
						<button class="btn btn-danger btn-lg" type="reset">취소</button>
						<input class="btn btn-secondary btn-lg" type="button" value="목록으로" onclick="location.href='../pjnotice'">	
					</div>
				</div>
		</form>
	</div>
<footer>
    <%@ include file="footer.jsp" %>
</footer>
</body>
</html>