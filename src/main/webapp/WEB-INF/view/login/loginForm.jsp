<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<h1>로그인</h1>
가입
<form:form action="/login/signIn" method="post" modelAttribute="member">
    <form:input path="userId" />id입력
    <form:errors path="userId"/>
<hr>
    <form:input path="password" />password입력
    <form:errors path="password"/>
<hr>
    <button>회원가입</button>
</form:form>

로그인
<form action="/login/login" method="post">
<input type="text" name="userId" value="">
<input type="text" name="password" value="">
<input type="submit" value="로그인">
</form>




</body>
</html>
