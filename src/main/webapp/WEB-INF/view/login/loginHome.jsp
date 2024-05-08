<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<style>
    a {
        /*text-decoration: none;*/
        color: black;
    }
    .logHomeDivWrap1 {
        display: flex;
    }
    .logHomeDivWrap1>div {
        width: 300px;
        height: 300px;
        line-height: 300px;
        border: 1px solid black;
        border-radius: 15px;
        text-align: center;
        font-size: 3rem;
        margin: 10px;
    }
</style>
<body>
<c:import url="../../fragment/navbar.jsp"/>
<h1>로그인</h1>
로그인 완료되었습니다
반갑습니다 ${loginMember.userId} 님
<hr>
<div class="logHomeDivWrap1">
    <div class="div_flex">
        <a href="/item/items">Item</a>
    </div>

    <div class="div_flex">
        <a href="/member/members">Member</a>
    </div>

    <div class="div_flex">
        <a href=/order/orders>Order</a>
    </div>

    <div class="div_flex">
        <a href=/board/boards>board</a>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
