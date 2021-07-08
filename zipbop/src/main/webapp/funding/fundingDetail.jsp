<%@page import="com.zipbop.funding.impl.FundingDAOMybatis"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WooMool MARKET</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- 아이콘 넣기 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- =======================================================
  * Template Name: Mentor - v4.3.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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
	<%-- 펀딩 참여 전 확인알림 체크박스 먼저 검사--%>	
function alert_go(frm) {
	var check = $('.check:checked');
	//console.log(check);
	
	if(check.length > 0) {
		var con = 
			confirm("\n◈ 펀딩 참여 전 확인하세요! ◈\n\n펀딩은 예약 결제 신청 후,\n100% 달성 시 지정 결제일에 결제됩니다."
				+"\n펀딩은 쇼핑과 달리 결제가 진행된 이후에는\n단순 변심으로 인한 취소나 환불이 어려울 수 있습니다.\n");
		if (con == true) {
			frm.submit();
		} else {
			alert("취소되었습니다.")
		}
	} else {
		alert("리워드를 선택해주세요.");
	}
}

	<%--로그인 없이 펀딩참여하기=>로그인 이동--%>
function alert_login() {
	var con = confirm("로그인이 필요한 서비스입니다.");
		location.href="login.jsp";
}
</script>
</head>
<body>
  
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">WooMool</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="index.html">HOME</a></li>
          <li><a class="active" href="funding.html">펀딩</a></li>
          <li><a href="shopping.html">구매</a></li>
          <li class="dropdown"><a href="#"><span>커뮤니티</span>> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">Q&A</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="contact.html">마이페이지</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <a href="courses.html" class="get-started-btn">로그인</a>

    </div>
  </header><!-- End Header -->
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
	
	<!-- 진척도 -->
	<div class="center">
		<progress style="width:70%;height:30px" value="${funding.percent }" max="100" >${funding.percent }</progress>
	</div>
	<div>
		<small style="text-align: left;">
			<fmt:formatNumber value="${funding.goal_money}" pattern="#,###,###,###"/>원 목표
		</small>
		<small style="text-align: right;">
			<font style="text-align: right;" color="blue"><fmt:formatNumber value="${funding.save_money }" pattern="#,###,###,###"/>원</font>		
		</small>
	</div>
<form action="fundingEnter.do" method="post">
<table class="center">
	<thead>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>사업자명</th>
			<%--  <th>목표금액</th>
			<th>달성금액</th>--%>
		</tr>	
	</thead>
	<tbody>
		<tr>
			<td>${funding.product_no }</td>
			<td>${funding.product_name }</td>
			<td>${funding.id }</td>
			<%--<td><fmt:formatNumber value="${funding.goal_money}" pattern="#,###,###,###"/>원</td>	
			<td><fmt:formatNumber value="${funding.save_money }" pattern="#,###,###,###"/>원</td>--%>
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
					id="${name_price_map.key }" name="list${status.index }" class="opt check" onclick="sum(this)">
			${name_price_map.key }&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${name_price_map.value}" pattern="#,###,###,###"/>원
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
	<c:if test="${sessionScope.id == null}">
   		<input type="button" value="펀딩 참여하기" onclick="alert_login(this.form)">
    </c:if>
	<c:if test="${sessionScope.id != null && funding.d_day >= 0}">
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
<!-- ======= Footer ======= -->
   <footer id="footer">
    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>WooMool Market</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
          우물마켓(주) | 대표이사 김유연 | 02-707-1480 | Designed by <a href="https://bootstrapmade.com/">TEEMEE</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="https://www.instagram.com/woomool.market/" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>