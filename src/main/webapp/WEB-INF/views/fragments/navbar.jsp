<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="fixed-top" th:fragment="header">
<div class="container d-flex align-items-center">
    <h1 class="logo me-auto" style="color: #2a52be;" onclick="location.href='/'">WooMooL</h1>
    <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            <li><a class="active" href="/">홈 화면</a></li>
            <li><a href="/board/getFundingList">펀딩</a></li>
            <li><a href="/board/getPurchaseList">구매</a></li>
            <li class="dropdown"><a href="#"><span>커뮤니티</span> <i
                    class="bi bi-chevron-down"></i></a>
                <ul>
                    <li><a href="/board/getBoardList?flag_nq=N">공지사항</a></li>
                    <li><a href="/board/getBoardList?flag_nq=Q">Q&A</a></li>
                </ul>
            </li>
            <!-- <li><a href="contact.html">마이페이지</a></li> -->
        </ul>
        <div class="navbar-toolbar d-flex align-items-center order-lg-3">
            <!-- chat -->
            <a href="/chat" class="navbar-tool d-none d-lg-flex">
                <!-- <span class="navbar-tool-label yith_wcwl_count">0</span> -->
                <div class="navbar-tool-icon-box">
                    <i class="fa fa-comments" aria-hidden="true"></i>
                    <!-- ::before -->
                </div>
            </a>
            <!-- 장바구니 -->
            <a href="/cart/list" class="navbar-tool d-none d-lg-flex">
                <div class="navbar-tool-icon-box">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                </div>
            </a>
            <!-- 마이페이지 -->
            <a href="/members/myPage" class="navbar-tool d-none d-lg-flex"/>
            <div class="navbar-tool-icon-box">
                <i class="fa fa-user" aria-hidden="true"></i>
            </div>
        </div>
    </nav>
    <!-- .navbar -->

    <c:if test="${sessionScope.loginMember == null}">
        <a href="/login" class="get-started-btn">로그인</a>
    </c:if>
    <c:if test="${sessionScope.loginMember != null}">
        <a href="/logout" class="get-started-btn">로그아웃</a>
    </c:if>
</div>
</header>