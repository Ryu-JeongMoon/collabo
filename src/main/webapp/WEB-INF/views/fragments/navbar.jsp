<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container d-flex align-items-center">
    <h1 class="logo me-auto"><a href="/">WooMooL</a></h1>
    <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            <li><a class="active" href="/">HOME</a></li>
            <li><a href="/board/getFundingList">펀딩</a></li>
            <li><a href="/board/getPurchaseList">구매</a></li>
            <li class="dropdown"><a href="/board/index"><span>커뮤니티</span> <i
                    class="bi bi-chevron-down"></i></a>
                <ul>
                    <li><a href="/board/getBoardList?flag_nq=N">공지사항</a></li>
                    <li><a href="/board/getBoardList?flag_nq=Q">Q&A</a></li>
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
                </div>
            </a>
            <!-- chat -->
            <a href="/chat" class="navbar-tool d-none d-lg-flex">
                <!-- <span class="navbar-tool-label yith_wcwl_count">0</span> -->
                <div class="navbar-tool-icon-box">
                    <i class="fa fa-bell" aria-hidden="true"></i>
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
