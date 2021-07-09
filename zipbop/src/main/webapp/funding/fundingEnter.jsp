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
	<h1>${funding.product_name }</h1>
	<h4>${funding.id }</h4>
	<hr>
<form action="fundingPayment.do" method="post" onsubmit="alert_go(this.form)">
	<h3>펀딩 내역</h3>
<table>
<%-- 	<tr>
		<th>주문 번호</th>
		<td>${chk.pay_no }</td>
	</tr> --%>
	
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