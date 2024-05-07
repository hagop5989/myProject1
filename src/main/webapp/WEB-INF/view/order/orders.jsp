<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Orders</h1>

<%--<b>--%>
<%--    <div style="background: skyblue">메세지 : ${message}</div>--%>
<%--</b>--%>
<%--<hr>--%>
<%--&lt;%&ndash;특정 조회&ndash;%&gt;--%>
<%--<form action="/order/select">--%>
<%--    <input type="text" name="search" placeholder="이름을 입력하세요!">--%>
<%--    <input type="submit" value="조회">--%>
<%--</form>--%>

<%--<div style="margin-left: 10px;"><h2>데이터 입력 & 조회 & 수정 & 삭제</h2>--%>
<%--    &lt;%&ndash;수정&ndash;%&gt;--%>
<%--    <form action="${selected == null ? '/order/insert':'/order/update'}" method="post">--%>

<%--        <div><span>OrderId:</span>--%>
<%--            <input type="number" value="${selected != null ? selected.dbId:1}" readonly>--%>
<%--        </div>--%>
<%--        <div><span>userId:</span>--%>
<%--            <input type="text" value="${selected != null ? selected.userId: "기본값"}" name="userId">--%>
<%--        </div>--%>
<%--        <div><span>password:</span>--%>
<%--            <input type="text" value="${selected != null ? selected.password : "1234"}" name="password">--%>
<%--        </div>--%>
<%--        <c:if test="${selected == null}"> <input type="submit" value="입력"></c:if>--%>
<%--        <input type="hidden" name="prevName" value="${selected.userId}">--%>
<%--        <input style="background:lightslategrey; " type="submit" value="수정">--%>
<%--    </form>--%>

<%--    &lt;%&ndash;삭제&ndash;%&gt;--%>
<%--    <form action="/order/delete" method="post">--%>
<%--        <input style="background:lightcoral; " type="submit" value="삭제">--%>
<%--        <div><input type="hidden" value="${selected.userId}" name="userId"></div>--%>
<%--    </form>--%>


<hr>
<h3>order 목록</h3>
<form action="/order/orders">
    <button>조회</button>
</form>
<table>
    <thead>
    <tr style="background: lightslategrey; font-weight: bold; text-align: center;">
        <td>dbId</td>
        <td>userId</td>
        <td>password</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orders}" var="order">
        <tr>
            <td> ${order.orderId}</td>
            <td> ${order.orderItem}</td>
            <td> ${order.orderQuantity}</td>
            <td> ${order.orderTotalPrice}</td>
            <td> ${order.orderCustomerName}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
