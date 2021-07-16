<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../fragments/head.html" %>
    <meta charset="UTF-8">
    <link href="/css/funding/detail.css" rel="stylesheet" type="text/css">
    <script src="/js/funding/funding_update.js" type="text/javascript"></script>
    <title>펀딩 오픈 수정</title>
</head>

<body>

<%-- navbar --%>
<jsp:include page="../fragments/navbar.jsp" flush="false"/>

<div id="container">
    <h1>펀딩 오픈 수정페이지</h1>
    <hr>
    <form action="updateBoard?product_no=${funding.product_no}" method="post">
        <table class="center">
            <thead>
            <tr>
                <th>지역</th>
                <td>
                    <select name="region" required>
                        <option value="">선택</option>
                        <option value="Seoul">서울</option>
                        <option value="Gyeonggi-do">경기</option>
                        <option value="Incheon">인천</option>
                        <option value="Gangwon-do">강원</option>
                        <option value="Chungcheongbuk-do">충북</option>
                        <option value="Chungcheongnam-do">충남</option>
                        <option value="Sejong">세종</option>
                        <option value="Daejeon">대전</option>
                        <option value="Jeollabuk-do">전북</option>
                        <option value="Jeollanam-do">전남</option>
                        <option value="Gwangju">광주</option>
                        <option value="Gyeongsangbuk-do">경북</option>
                        <option value="Gyeongsangnam-do">경남</option>
                        <option value="Daegu">대구</option>
                        <option value="Ulsan">울산</option>
                        <option value="Busan">부산</option>
                        <option value="Jeju-do">제주</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>상품명</th>
                <td>
                    <input type="text" name="product_no" hidden value="${funding.product_no}">
                    <input type="text" name="product_name" maxlength="25" size="30" placeholder="${funding.product_name }" required>
                </td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>사업자명</th>
                <td>
                    <input type="text" value="${funding.id }" size="30" readonly>
                </td>
            </tr>
            <tr>
                <th>마감일</th>
                <td>
                    <input type="date" name="deadLine" size="30" required>
                </td>
            </tr>
            <tr>
                <th>목표금액</th>
                <td>
                    <input type="number" value="${funding.goal_money }" size="30" readonly>
                </td>
            </tr>
            </tbody>
        </table>

        <!-- int형인 애들을 위해 hidden input -->
        <input type="text" hidden value="${funding.goal_money}" name="goal_money">
        <input type="text" hidden value="${funding.save_money}" name="save_money">
        <input type="text" hidden value="${funding.percent}" name="percent">

        <hr>
        <h3>리워드 입력</h3>

        <div id="room_type">
            <div class="form-group">
                <label for="reward_name">리워드</label>
                <input type="text" id="reward_name" name="reward_name" class="form-control" maxlength="25" required>
                <input type="text" hidden name="reward_no" value="${funding.reward_no}">
                <label for="reward_price">가격</label>
                <input type="number" id="reward_price" name="reward_price" class="form-control" maxlength="6" oninput="maxLengthCheck(this)" placeholder="최대 90만원까지 입력 가능합니다." required >
                <input type="button" value="추가" onclick="add_div()"><br/>
            </div>
            <input type="button" value="삭제" onclick="remove_div(this)">
        </div>
        <div id="field"></div>

        <hr>
        <h3>상품 설명</h3>
        <table>
            <tr>
                <td colspan="2">
                    <textarea rows="30" cols="100" placeholder="${funding.content }" name="content" required></textarea>
                </td>
            </tr>
        </table>

        <hr>
        <div class="center">
            <input type="submit" value="수정 완료">
            <input type="reset" value="다시 작성">
            <input type="button" value="목록으로 이동" onclick="location.href='../board/getFundingList'">
        </div>
    </form>
</div>

<!-- footer -->
<%@ include file="../fragments/footer.jsp" %>

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="/assets/vendor/aos/aos.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="/assets/vendor/purecounter/purecounter.js"></script>
<script src="/assets/vendor/swiper/js/swiper-bundle.min.js"></script>
<!-- Template Main JS File -->
<script src="/assets/js/main.js"></script>
<!-- Funding JS -->
<script src="/js/funding/funding_open.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>