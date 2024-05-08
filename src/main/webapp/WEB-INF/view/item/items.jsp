<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<style>
    table, tr, th, td {
        border-collapse: collapse;
        border: 1px solid black;
    }

    span {
        display: block;
        width: 200px;
    }

    td {
        width: 5%;
    }

    form {
        display: inline;
    }

</style>
<body>
<c:import url="../../fragment/navbar.jsp"/>
<h1>Item</h1>
<b>
    <div style="background: skyblue">메세지 : ${message}</div>
    <div style="background: lightcoral">오류 : ${range.item.price}</div>


</b>
<hr>
<%--특정 조회--%>
<form action="/item/select">
    <input type="text" name="search" placeholder="아이템명을 입력하세요!">
    <input type="submit" value="조회">
</form>

<div style="margin-left: 10px;"><h2>아이템 입력 & 조회 & 수정 & 삭제</h2>

    <%--입력 혹은 수정--%>
    <form:form action="${selected == null ? '/item/insert':'/item/update'}" method="post" modelAttribute="item">
        <div><span>itemName:</span>
            <form:input path="itemName" type="text" value="${selected != null ? selected.itemName: '기본값'}"/>
            <form:errors path="itemName"/>
        </div>

        <div><span>itemPrice:</span>
            <form:input path="itemPrice" type="number" value="${selected != null ? selected.itemPrice : '2000'}"/>
            <form:errors path="itemPrice"/>
        </div>

        <c:if test="${selected == null}"> <input type="submit" value="입력"></c:if>
        <input type="hidden" name="prevName" value="${selected.itemId}"/>
    <form:button>수정</form:button>
    </form:form>

    <%--삭제--%>
    <form action="/item/delete" method="post">
        <input style="background:lightcoral; " type="submit" value="삭제">
        <div><input type="hidden" value="${selected.itemId}" name="itemId"></div>
    </form>

<%--전부 조회--%>
<hr>
<h3>Item 목록</h3>
<form action="/item/items">
    <button>조회</button>
</form>
<table>
    <thead>
    <tr style="background: lightslategrey; font-weight: bold; text-align: center;">
        <td>itemId</td>
        <td>itemName</td>
        <td>itemPrice</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${items}" var="item">
        <tr>
            <td> ${item.itemId}</td>
            <td> ${item.itemName}</td>
            <td> ${item.itemPrice}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>



</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>
