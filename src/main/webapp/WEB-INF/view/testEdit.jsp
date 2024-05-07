<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>테스트 페이지입니다!!</h1><hr>
<form:form action="/test" method="post" modelAttribute="testObject">

    <form:input path="id" type="text"/> id입력
    <form:errors path="id"></form:errors>
    <hr>
    <form:input path="password" type="text"/>password입력
    <form:errors path="password"></form:errors>
    <hr>
    <button>가입</button>

</form:form>
</body>
</html>
