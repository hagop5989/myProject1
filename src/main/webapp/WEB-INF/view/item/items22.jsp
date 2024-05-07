<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
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

</style><body>
<h1>아이템</h1>
<b>
    <div style="background: skyblue">메세지 : ${message}</div>
    <c:if test="${not empty error}">
        <div style="background: lightcoral">오류 : ${error}</div>
    </c:if>
</b>
<hr>
<%--특정인 조회--%>
<form action="/item/select">
    <input type="text" name="search" placeholder="아이템명을 입력하세요!">
    <input type="submit" value="조회">
</form>
<div style="margin-left: 10px;"><h2>아이템 입력 & 조회 & 수정 & 삭제</h2>
    <%--수정--%>
    <form action="${selected == null ? '/item/insert':'/item/update'}" method="post">

        <div><span>itemId:</span>
            <input type="number" value="${selected != null ? selected.itemId:1}" readonly>
        </div>
        <div><span>itemName:</span>
            <input type="text" value="${selected != null ? selected.itemName: "기본값"}" name="itemName">
            ${fieldError.defaultMessage}
        </div>
        <div><span>itemPrice:</span>
            <input type="text" value="${selected != null ? selected.itemPrice : "2000"}" name="itemPrice">
        </div>
        <c:if test="${selected == null}"> <input type="submit" value="입력"></c:if>
        <input type="hidden" name="prevName" value="${selected.itemId}">
        <input style="background:lightslategrey; " type="submit" value="수정">
    </form>

    <%--삭제--%>
    <form action="/item/delete" method="post">
        <input style="background:lightcoral; " type="submit" value="삭제">
        <div><input type="hidden" value="${selected.itemId}" name="itemId"></div>
    </form>


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
</html>
