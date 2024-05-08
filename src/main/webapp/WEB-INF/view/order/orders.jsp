<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    tr:hover {
        background-color: black;
        color: white;
        cursor: pointer;
    }

    form {
        display: inline;
    }
    input[readonly] {
        background-color: rgba(135, 206, 250, 0.3); /* 하늘색 배경에 80% 불투명도 적용 */
    }

</style>

<body>
<c:import url="../../fragment/navbar.jsp"/>
<h1>Orders</h1>

<div style="margin-left: 10px;"><h2>데이터 입력 & 조회 & 수정 & 삭제</h2>
<b>
    <div style="background: skyblue">메세지 : ${message}</div>
</b>
    <%--특정 조회--%>
    <form action="/order/select">
        <input type="text" name="search" placeholder="주문번호를 입력하세요!">
        <input type="submit" value="조회">
    </form>
<hr>
<div class="ordersBigWrap1" style="display: flex;">
    <div class="ordersWrap1">


    <%--수정--%>
    <form action="${selected == null ? '/order/insert':'/order/update'}" method="post">

        <div>
            <span>orderItem:</span>
            <select name="orderItem" id="orderItem" onchange="updatePrice()">
                <c:forEach items="${items}" var="item">
                    <option value="${item.itemName}" ${selected != null && item.itemName == selected.orderItem ? 'selected' : ''}>
                            ${item.itemName}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div>
            <span>orderQuantity:</span>
            <input id="orderQuantity" type="text" value="${selected != null ? selected.orderQuantity: ""}"
                   name="orderQuantity" placeholder="item선택->수량입력" onchange="updateTotalPrice()">
        </div>

        <div>
            <span>orderProductPrice:</span>
            <input id ="orderProductPrice" type="text" value="" name="orderProductPrice" readonly placeholder="X">
        </div>



        <div>
            <span>orderTotalPrice:</span>
            <input id="orderTotalPrice" type="text" value="" name="orderTotalPrice" readonly  placeholder="X">
        </div>

        <div>
            <span>orderCustomerName:</span>
            <select name="orderCustomerName" id="orderCustomerName">
            <c:forEach items="${members}" var="member">
                <option value="${member.userId}" ${selected != null && member.userId == selected.orderCustomerName ? 'selected' : ''}>
                                ${member.userId}
                </option>
            </c:forEach>
            </select>
        </div>

        <c:if test="${selected == null}"> <input type="submit" value="입력"></c:if>
        <input type="hidden" name="prevId" value="${selected.orderId}">
        <input style="background:lightslategrey; " type="submit" value="수정">
    </form>

    <%--삭제--%>
    <form action="/order/delete" method="post">
        <input style="background:lightcoral; " type="submit" value="삭제">
        <div><input type="hidden" value="${selected.orderId}" name="orderId"></div>
    </form>
</div>

<div class="ordersWrap2" style="margin-left: 30px;">
    <div>
        <span>할인금액</span>
        <input id="applyDiscount" type="checkbox" onchange="updateTotalPrice()" >
        <input id="discountPrice" type="text" value="" name="" placeholder="금액입력->체크">
    </div>
</div>
    </div>




<hr>
<h3>order 목록</h3>
<form action="/order/orders">
    <button>조회</button>
</form>
<table>
    <thead>
    <tr style="background: lightslategrey; font-weight: bold; text-align: center;">
        <td>orderId</td>
        <td>orderItem</td>
        <td>orderProductPrice</td>
        <td>orderQuantity</td>
        <td>orderTotalPrice</td>
        <td>orderCustomerName</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orders}" var="order">
        <tr>
            <td> ${order.orderId}</td>
            <td> ${order.orderItem}</td>
            <td> ${order.orderProductPrice}</td>
            <td> ${order.orderQuantity}</td>
            <td> ${order.orderTotalPrice}</td>
            <td> ${order.orderCustomerName}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
<script>

    function updateTotalPrice() {
        var orderProductPrice = parseFloat(document.getElementById("orderProductPrice").value);
        var orderQuantity = parseInt(document.getElementById("orderQuantity").value);
        var discountPrice = parseFloat(document.getElementById("discountPrice").value);

        var totalPrice = orderProductPrice * orderQuantity;

        // 할인 금액을 적용
        if (document.getElementById("applyDiscount").checked) {
            totalPrice -= discountPrice;
        }
        document.getElementById("orderTotalPrice").value = totalPrice;
    }

    function updatePrice() {
        var selectedOrderItem = document.getElementById("orderItem").value;
        var encodedOrderItem = encodeURIComponent(selectedOrderItem);

        // AJAX 요청 보내기
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/order/getOrderProductPrice?orderItem=" + encodedOrderItem, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var price = xhr.responseText;
                document.getElementById("orderProductPrice").value = price;
            }
        };
        xhr.send();
    }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>
