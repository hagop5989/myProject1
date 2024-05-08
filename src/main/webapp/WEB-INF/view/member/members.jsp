<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1>Members</h1>
<b>
    <div style="background: skyblue">메세지 : ${message}</div>
</b>
<hr>
<%--특정인 조회--%>
<form action="/member/select">
    <input type="text" name="search" placeholder="이름을 입력하세요!">
    <input type="submit" value="조회">
</form>

<div style="margin-left: 10px;"><h2>데이터 입력 & 조회 & 수정 & 삭제</h2>
    <%--수정--%>
    <form:form action="${selected == null ? '/member/insert':'/member/update'}" method="post" modelAttribute="member">

        <div><span>dbId:</span>
            <input type="number" value="${selected != null ? selected.dbId:1}" readonly>
        </div>
        <div><span>userId:</span>
            <form:input path="userId" type="text" value="${selected != null ? selected.userId: '기본값'}"/>
            <form:errors path="userId"/>
        </div>
        <div><span>password:</span>
            <form:input path="password" type="text" value="${selected != null ? selected.password : '1234'}" name="password"/>
            <form:errors path="password"/>

        </div>
        <c:if test="${selected == null}"> <input type="submit" value="입력"></c:if>
        <input type="hidden" name="prevName" value="${selected.userId}">
        <input style="background:lightslategrey; " type="submit" value="수정">
    </form:form>

    <%--삭제--%>
    <form action="/member/delete" method="post">
        <input style="background:lightcoral; " type="submit" value="삭제">
        <div><input type="hidden" value="${selected.userId}" name="userId"></div>
    </form>










<hr>
<h3>Member 목록</h3>
<form action="/member/members">
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
<c:forEach items="${members}" var="member">
        <tr>
            <td> ${member.dbId}</td>
            <td> ${member.userId}</td>
            <td> ${member.password}</td>
        </tr>
</c:forEach>
    </tbody>
</table>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>
