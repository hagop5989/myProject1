<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .error {
        color: red;
        font-weight: bold;
    }
</style>
<body>
<h1>테스트 페이지입니다!!</h1><hr>
<form:form action="/test" method="post" modelAttribute="testObject">

    <form:input path="id" type="number"/> id입력
    <form:errors path="id" cssClass="error"/>

    <hr>
    <form:input path="password" type="number"/>password입력
    <form:errors path="password"  cssClass="error"/>
    <hr>
    <button>가입</button>

</form:form>
</body>
</html>
