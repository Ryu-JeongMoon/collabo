<%@page import="com.zipbop.funding.impl.FundingDAOMybatis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#container { width: 700px; margin: 0 auto; }
	#img {text-align: center; }
	h1, h4 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border : 1px solid black;
		margin : 0 auto;
		text-align: center;		
	}
	.center {text-align: center; }
	.reward td {text-align: left;}
	
</style>
<script>
let totalValue = 0;  //기본금액 + 옵션금액
let totalTag; //최종금액 표시할 객체

window.onload = function(){  //문서 로딩해오기
   // console.log(document.getElementById("total"));
    totalTag = document.getElementById("total");
    
    totalValue = parseInt(totalTag.value);   
   // console.log(totalValue+999);   //연산되는지 확인
    console.log("현재 총 가격:"+totalValue);
};  
function sum(opt) {
	//console.log("sum() 실행: "+opt.id);
   let optValue = parseInt(opt.value.split("/")[1]);
    
   console.log("checked: "+opt.id); //선택한 리워드 이름
   console.log("optValue: "+optValue); //선택한 리워드 가격
   
    if (opt.checked) {   //옵션 체크 상태: 금액 더하기
        totalValue += optValue;
    } else {    //옵션 체크 해제 상태: 금액 빼주기
        totalValue -= optValue;
    }
    console.log("현재 총 가격:"+totalValue);

    //화면에 결과값 표시
    totalTag.value = totalValue;
};

	<%--게시글 수정--%>
function update_go() {
	var con = confirm("\n수정하시겠습니까?\n◈ 악용 방지를 위해 목표 금액은 수정이 불가합니다. ◈");
	if(con == true) {
		location.href="fundingUpdate.jsp";
	} else {
		alert("취소되었습니다.");
	}
}
	<%--게시글 삭제--%>
function delete_go() {
	var con = confirm("삭제하시겠습니까?");
	if (con == true) {
		location.href="deleteBoard.do?product_no=${funding.product_no}";
	} else {
		alert("취소되었습니다.");
	}
} 
	<%-- 펀딩 참여 전 확인알림 --%>
function alert_go(frm) {
	var con = 
		confirm("\n◈ 펀딩 참여 전 확인하세요! ◈\n\n펀딩은 예약 결제 신청 후,\n100% 달성 시 지정 결제일에 결제됩니다."
			+"\n펀딩은 쇼핑과 달리 결제가 진행된 이후에는\n단순 변심으로 인한 취소나 환불이 어려울 수 있습니다.\n");
	if (con == true) {
		frm.submit();
	} else {
		alert("취소되었습니다.")
	}
}
</script>
</head>
<body>
<div id="container">
	<!-- 제목에 상품이름 뜨게 -->
	<h1>[${funding.region }]&nbsp;&nbsp;${funding.product_name }</h1> 
	<hr>
<div>
    <img src="try.jpg" alt="상품이미지">
</div>
	<hr>
	<h4>
	<c:if test="${funding.d_day >= 0}">
		<font color="tomato">[진행 중]</font>
	</c:if>
	<c:if test="${funding.d_day < 0}">
		<font color="tomato">[종료]</font>
	</c:if>
	현재까지 <font color="tomato"><fmt:formatNumber value="${funding.supporter }" pattern="#,###,###,###"/>명</font>이 펀딩에 참여해주셨습니다!
	</h4>
	<c:if test="${funding.d_day >= 0}" >
	<h4>&#9203; 마감일 <font color="tomato">${funding.deadLine }</font>까지 
		<font color="tomato">${funding.d_day }일</font> 남음 &#9203;
	</h4>
	</c:if>
	<c:if test="${funding.d_day < 0}">
		<h4>&#10060; 이미 <font color="tomato">종료된 펀딩</font>입니다 &#10060;</h4>
	</c:if>
<form action="fundingEnter.do" method="post">
<table class="center">
	<thead>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>사업자명</th>
			<th>목표금액</th>
			<th>달성금액</th>
		</tr>	
	</thead>
	<tbody>
		<tr>
			<td>${funding.product_no }</td>
			<td>[${funding.region }]&nbsp;&nbsp;${funding.product_name }</td>
			<td>${funding.id }</td>
			<td>${funding.goal_money}원</td>	
			<td><fmt:formatNumber value="${funding.save_money }" pattern="#,###,###,###"/>원</td>
		</tr>
	</tbody>
</table>
<hr>
<table class="reward">
	<tr>
		<th>리워드 선택</th>		
		<td>
		<c:forEach var="name_price_map" varStatus="status" items="${name_price_map}">
			<label for="${name_price_map.key }">
			<input type="checkbox" value="${name_price_map.key } / ${name_price_map.value}"
					id="${name_price_map.key }" name="list${status.index }" class="opt" onclick="sum(this)">
			${name_price_map.key } <fmt:formatNumber value="${name_price_map.value}" pattern="#,###,###,###"/>원
			</label><br>
		</c:forEach>
		</td>
	</tr>		
	<tr>
		<th>총 금액</th>
		<td>
		<input type="text" value="0" id="total" name="totalSum" readonly>원
		</td>
	</tr>	
</table>	
	<hr>
	<div class="center" >
	<c:if test="${funding.d_day >= 0}">
		<input type="button" value="펀딩 참여하기" onclick="alert_go(this.form)">
	</c:if>
	<c:if test="${funding.d_day < 0}">
		<input type="button" disabled='disabled' value="펀딩 참여하기">
	</c:if>
		<input type="button" value="목록으로 이동" onclick="location.href='fundingList.jsp'">
	</div>	
	<p>
		<textarea rows="30" cols="100" readonly>
			${funding.content }
		</textarea>
	</p>
	</form>
	<%-- 수정/삭제--%>
	<c:if test="${sessionScope.id == null || funding.id != sessionScope.id}">
   		<button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 수정할 수 있습니다.');" type="reset">수정
   		</button>
   		<button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 삭제할 수 있습니다.');" type="reset">삭제
   		</button>
    </c:if>
	<c:if test="${funding.id == sessionScope.id}">
		<input class="center" type="button" value="수정" onclick="update_go(this.form)">
		<input class="center" type="button" value="삭제" onclick="delete_go(this.form)">
	</c:if>
</div>
</body>
</html>
