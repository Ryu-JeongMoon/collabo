<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                    <select name="region">
                        <option value="">선택</option>
                        <option value="서울">서울</option>
                        <option value="경기">경기</option>
                        <option value="인천">인천</option>
                        <option value="강원">강원</option>
                        <option value="충북">충북</option>
                        <option value="충남">충남</option>
                        <option value="세종">세종</option>
                        <option value="대전">대전</option>
                        <option value="전북">전북</option>
                        <option value="전남">전남</option>
                        <option value="광주">광주</option>
                        <option value="경북">경북</option>
                        <option value="경남">경남</option>
                        <option value="대구">대구</option>
                        <option value="울산">울산</option>
                        <option value="부산">부산</option>
                        <option value="제주">제주</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>상품명</th>
                <td><input type="text" name="product_name" placeholder="${funding.product_name }"></td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>사업자명</th>
                <td><input type="text" value="${funding.id }" readonly></td>
            </tr>
            <tr>
                <th>마감일</th>
                <td><input type="date" name="deadLine"></td>
            </tr>
            <tr>
                <th>목표금액</th>
                <td>
                    <input type="text" value="${funding.goal_money }" readonly>
                </td>
            </tr>
            </tbody>
        </table>

        <hr>
        <h3>리워드 입력</h3>

        <div id="room_type">
            <div class="form-group">
                <label for="image">리워드</label>
                <input type="text" id="reward_name" name="reward_name" class="form-control"></input>
                <label for="image">가격</label>
                <input type="text" id="reward_price" name="reward_price" class="form-control"></input>
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
                    <textarea rows="30" cols="100" placeholder="${funding.content }" name="content"></textarea>
                </td>
            </tr>
        </table>
        <hr>
        <div class="center">
            <input type="submit" value="수정 완료">
            <input type="reset" value="다시 작성">
            <input type="button" value="목록으로 이동" onclick="location.href='fundingList'">
        </div>
    </form>
</div>

<%-- footer --%>
<jsp:include page="../fragments/footer.jsp" flush="false"/>

</body>
</html>