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
    a{
        text-decoration: none;
        color: black;
    }
    td,tr {
        width: 150px;
        border: 1px solid black;
        text-align: center;
        padding: 5px;
    }
    td {
        padding: 10px;
        height: 20px;
    }
    .wrap1 {
        justify-content: center;

    }
</style>
<body>
<c:import url="../../fragment/navbar.jsp"/>
<div class="wrap1">
    <table>
        <thead style="font-weight: bold; background-color:lightslategrey;">
        <tr>
            <td>board_id</td>
            <td>title</td>
            <td>writer</td>
            <td>inserted</td>
        </tr>
        </thead>

        <form:form action="/board/insert" method="post" modelAttribute="board">
        <tbody>
        <tr>
            <td><form:input path="boardId" readonly="true"/></td>
            <td><form:input path="title"/></td>
            <td><form:input path="writer"/></td>
            <td><form:input path="inserted" readonly="true"/></td>
        </tr>
        </tbody>
    </table>
    <hr>
    <b>content</b>
    <div>
        <form:textarea path="content" cols="80" rows="10" value="${board.content}"/>
    </div>
    <div class="insertWrap1" style="display: flex">
        <div><input type="submit" value="저장"/></div>
        </form:form>
        <div><button><a href="/board/boards">이전</a></button></div>
    </div>
</div>


</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>