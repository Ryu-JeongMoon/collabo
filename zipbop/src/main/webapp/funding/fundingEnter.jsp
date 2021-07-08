<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 참여 화면</title>
<style>
	#container { width: 700px; margin: 0 auto; }
	h1, h4 { text-align: center; }
	table { border-collapse: collapse; }
	th, td {
		border : 1px solid black;
		margin : 0 auto;
		text-align: center;
	}
	/* th { background-color: #ccccff; } */
	.center {text-align: center; }
	
</style>
<script>
function validate() {
    let re = /^[a-zA-Z0-9]{4,20}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    let emailRe = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let nameRe = /^[가-힣a-zA-Z]{2,20}$/;
    let phoneRe = /^010\d{8}$/;
    //let ageRe = /^[0-9]{1,3}$/;

    let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");

    // ------------ 이메일 까지 -----------
    if(!check(nameRe,name,"이름은 2~20자의 한글 또는 영문으로 입력해주세요.")) {
        return false;
    }

    if(!check(phoneRe, phone, "전화번호는 010으로 시작하여 10~11자리로 입력해주세요.")) {
        return false;
    }
    
    if(email.value=="") {
         alert("이메일을 입력해 주세요");
         email.focus();
        return false;
     }

     if(!check(emailRe, email, "적합하지 않은 이메일 형식입니다.")) {
         return false;
     }

  	var con = 
		confirm("\n◈ 펀딩 참여 전 확인하세요! ◈\n\n가장 빠른 지정 결제일은 ♤마감 후 일주일 뒤♤ 입니다."
				+"\n지정 결제일에 결제 수단을 선택할 수 있습니다.\n");
	if(con == true) {
		alert("참여가 완료되었습니다.")
	} else {
		alert("취소되었습니다. 목록으로 이동합니다.")
		location.href="fundingList.jsp";
	}
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    // what.value = "";
    what.focus();
}
	document.addEventListener('window.onunload', validate);
	
</script>
</head>
<body>
<div id="container">
	<h1>${funding.product_name }</h1>
	<h4>${funding.id }</h4>
	<hr>
<form action="fundingPayment.do" method="post" onsubmit="alert_go(this.form)">
	<h3>펀딩 내역</h3>
<table>
	<tr>
		<th>구매 번호</th>
		<td>${chk.pay_no }</td>
	</tr>
	<tr>
		<th>선택한 리워드</th>
		<td>
			<c:forEach var="element" items="${list }">
				${element }<br>
				<input type="text" name="choice_reward" value="${element }" hidden="hidden" />
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th>총 금액</th>
		<td><fmt:formatNumber value="${totalSum }" pattern="#,###,###,###"/>원</td>
		<input type="text" hidden name="product_no" value="${funding.product_no }">
		<input type="text" hidden name="total_sum" value="${totalSum }">
	</tr>
</table>
<hr>
	<h3>배송지 입력</h3>
<table>
	<!--  <tr>
		<th>주문 번호</th>
		<td><input type="text" id="pay_no" name="pay_no" value="${pay.pay_no }" readonly></td>
	</tr>-->
	<tr><!-- 후결제 -->
		<th>이름</th>
		<td><input type="text" id="name" name="name" required></td>
		<input type="hidden" value="${sessionScope.id }" id="id" name="id">
	</tr>
	<tr>	
		<th>연락처</th>
		<td><input type="text" id="phone" name="phone" required></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" id="email" name="email" required></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" required></td>
	</tr>
</table>
<hr>
<div class="center">
	<button type="submit" value="펀딩 참여하기" onclick="return validate();">펀딩 참여하기</button>
	<input type="button" value="목록으로 이동" onclick="location.href='fundingList.jsp'"> 
</div>
</form>
</div>
</body>
</html>