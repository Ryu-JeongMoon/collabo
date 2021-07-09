<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

   <head>
      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">
     
      <title>UMUL MARKET</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>


.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
</style>
</head>
<body>
<!-- 네비바 그냥 모양잡는 정도로만 템플릿 잡아둔거라 다 갈아 엎으셔두 되어요 온니 -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

        <h1 class="logo me-auto"><a href=#>WooMool</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a class="active" href="getFundingList.do">펀딩</a></li>
                <li><a href="getPerchaseList.do">구매</a></li>
                <li class="dropdown"><a href="#"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="getBoardList.do?flag_nq=N"">공지사항</a></li>
                        <li><a href="getBoardList.do?flag_nq=Q">Q&A</a></li>
                        <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">Deep Drop Down 1</a></li>
                                <li><a href="#">Deep Drop Down 2</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- <li><a href="contact.html">마이페이지</a></li> -->
            </ul>
            <!-- 검색 -->
            <div class="navbar-toolbar d-flex align-items-center order-lg-3">
                <a href="search.html" class="navbar-tool d-none d-lg-flex">
                    <div class="navbar-tool-icon-box">
                        <i class="fa fa-search" aria-hidden="true"></i>
                        <!-- ::before -->
                        </i>
                    </div>
                </a>
                <!-- 알람 -->
                <a href="/chat" class="navbar-tool d-none d-lg-flex">
                    <!-- <span class="navbar-tool-label yith_wcwl_count">0</span> -->
                    <div class="navbar-tool-icon-box">
                        <i class="fa fa-bell" aria-hidden="true"></i>
                        <!-- ::before -->
                        </i>
                    </div>
                </a>
                <!-- 장바구니 -->
                <a href="cart.html" class="navbar-tool d-none d-lg-flex">
                    <!-- <span class="navbar-tool-label yith_wcwl_count">0</span> -->
                    <div class="navbar-tool-icon-box">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <!-- ::before -->
                        </i>
                    </div>
                </a>
                <!-- 마이페이지 -->
                <a href="/members/mypage(uuid=${session.loginMember.uuid})" class="navbar-tool d-none d-lg-flex">
                    <!-- <span class="navbar-tool-label yith_wcwl_count">0</span> -->
                    <div class="navbar-tool-icon-box">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <!-- ::before -->
                        </i>
                    </div>
                </a>
            </div>
        </nav><!-- .navbar -->

        <a href="login.html" class="get-started-btn">로그인</a> 
       <%--  <c:choose>
          <c:when test = "${id == null }">
          <a href="#">회원가입</a>
          <a href="login.jsp">로그인</a>
          </c:when>
          
          <c:when test = "${id == 'ADMIN' }">
          &nbsp;관리자님&nbsp;
          <a href="#">로그아웃</a>
          </c:when>
          
          <c:when test = "${id != null }">
         &nbsp;${id }님&nbsp;
          <a href="#">로그아웃</a>
          </c:when>
           
          
       </c:choose>--%>

    </div>
</header>
</body>
</html>