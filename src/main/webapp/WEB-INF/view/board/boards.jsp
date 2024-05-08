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
        display: block;
        text-decoration: none;
        color: black;
    }

    td,tr {
        width: 180px;
        border: 1px solid black;
        text-align: center;
        padding: 5px;
    }
    td {
        padding: 10px;
        height: 20px;
    }
    .wrap1 {
        display: flex;
        justify-content: center;
    }
    .pageNumbers {
        display: flex;
        justify-content: center;
    }
    tr:hover {
        background: black;
        color: white;
    }
    a:hover {
        color: white;
    }
</style>
<body>
<c:import url="../../fragment/navbar.jsp"/>

<div style="text-align: center; margin: 20px;">
<button><a href="/board/insert">글쓰기</a></button>
</div>
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

        <tbody>
        <c:forEach items="${boards}" var="board">
            <c:url value="/board/boardDetail" var="viewLink">
                <c:param name="boardId" value="${board.boardId}"/>
            </c:url>
            <tr>
                <td>${board.boardId}</td>
                <td>
                    <a href="${viewLink}">
                    ${board.title}</a>
                </td>
                <td>${board.writer}</td>
                <td>${board.inserted}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<div class="pageNumbers">
    <form action="/board/boards">
        <c:if test="${nowPage != 1}">
            <button type="submit" name="page" value="1">first</button>
            <button type="submit" name="page" value="${prvPg}"> <<</button>
        </c:if>
        <c:forEach var="i" begin="${firstPg}" end="${lastPg * 10>sizeNum ? sizeNum/10  : lastPg}">
            <button type="submit" name="page" value="${i}">${i}</button>
        </c:forEach>
        <c:if test="${nowPage != sizeNum}">
            <button type="submit" name="page" value="${nxtPg}"> >></button>
            <button type="submit" name="page" value="${sizeNum}">last</button>
        </c:if>
    </form>

</div>


</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>
