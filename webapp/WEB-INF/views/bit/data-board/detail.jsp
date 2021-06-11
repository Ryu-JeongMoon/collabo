<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <title>�� ������</title>
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

    footer {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        padding: 15px 0;
        text-align: center;
    }

</style>
<body>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<%@ include file="../html/navbar.jsp" %>

<%-------------------------------------------------------------------------------------------------------------------------------------%>

<div class="container">
    <div class="py-5 text-center">
        <h2>�� ��</h2>
    </div>
    <form action="delete" method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">�� ��ȣ</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="post_no" id="post_no" type="text" value="${list.post_no}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">�ۼ���</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="reg_date" id="reg_date" type="text"
                                   value="<fmt:formatDate pattern="yyyy.MM.dd  hh:mm:ss" value="${list.reg_date}"></fmt:formatDate>"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">�۾���</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="writer_name" id="writer_name" type="text"
                                   value="${list.writer_name}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">����</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="post_title" id="post_title" type="text"
                                   value="${list.post_title}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>����</th>
                <td>
                    <%--                    <textarea name="post_content" id="post_content" cols="30" rows="10"--%>
                    <%--                              placeholder="${list.post_content}" readonly="" ></textarea>--%>
                    <div class="form-group">
                        <fieldset>
                            <input size="40" width="100" class="form-control" id="post_content" name="post_content"
                                   type="text" value="${list.post_content}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
                <%--                <td><input type="text" size="100" name="post_content"></td>--%>
            </tr>
            <tr class="table-active">
                <th>÷������</th>
                <td>
                    <div class="form-group">
                        <%--                        <fieldset>--%>
                        <%--                            <input class="form-control" id="attached_file" name="attached_file" type="text" value="${list.attached_file}"--%>
                        <%--                                   readonly="">--%>
                        <%--                        </fieldset>--%>
                        <%--                        <a download="" href="<c:url value="/upload/${list.attached_file}"/>">${list.attached_file}</a>--%>
                        <a download=""
                           href="<c:url value="http://localhost:8080/upload/${list.attached_file}"/>">${list.attached_file}</a>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>��ȸ��</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="hit" name="hit" type="text" value="${list.hit}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="col">
            <c:if test="${login == list.writer_name}">
                <c:if test="${!empty param.p}">
                    <button class="btn btn-primary btn-lg"
                            onclick="location.href='update?post_no=${list.post_no}&p=${param.p}&f=${param.f}&k=${param.k}'"
                            type="button">����
                    </button>
                </c:if>
                <c:if test="${empty param.p}">
                    <button class="btn btn-primary btn-lg"
                            onclick="location.href='update?post_no=${list.post_no}'"
                            type="button">����
                    </button>
                </c:if>
                <button class="btn btn-danger btn-lg"
                    <%--                onclick="location.href='delete?post_no=${list.post_no}'"--%>
                        onclick="button_event(this.form);"
                        formmethod="post"
                        type="button">����
                </button>
            </c:if>
            <c:if test="${login == null || login != list.writer_name}">
                <button class="btn btn-danger btn-lg" onclick="alert('������ �ۼ��� �۸� ������ �� �ֽ��ϴ�.');" type="reset">����
                </button>
                <button class="btn btn-danger btn-lg" onclick="alert('������ �ۼ��� �۸� ������ �� �ֽ��ϴ�.');" type="reset">����
                </button>
            </c:if>
            <c:if test="${!empty param.p || !empty param.f}">
                <button class="btn btn-secondary btn-lg"
                        onclick="location.href='list?p=${param.p}&f=${param.f}&k=${param.k}'"
                        type="button">�������
                </button>
            </c:if>
            <c:if test="${empty param.p && empty param.f}">
                <button class="btn btn-secondary btn-lg"
                        onclick="location.href='list'"
                        type="button">�������
                </button>
            </c:if>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="../html/footer.jsp" %>
</footer>

<%--�ڹٽ�ũ��Ʈ���� form ��ü�� �迭 �����̹Ƿ� form ��ü �� � ������ Ư���ؼ� ó���ؾ���--%>
<script type="text/javascript">
    function button_event(frm) {
        if (confirm("���� �����Ͻðڽ��ϱ�??") == true) {    //Ȯ��
            //document.form[0].submit();
            frm.submit();
        } else {   //���
            return false;
        }
    }
</script>
</body>
</html>