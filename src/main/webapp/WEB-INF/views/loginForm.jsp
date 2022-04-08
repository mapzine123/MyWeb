<%--
  Created by IntelliJ IDEA.
  User: mapzi
  Date: 2022-04-08
  Time: 오후 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/loginForm.css'">
    <link rel="stylesheet" href="<c:url value='/css/reset.css'">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="bodyContainer">
<%--    상단 네비바--%>
    <%@include file="jspf/navi.jspf"%>

    <div class="login">
        <h2>Login</h2>
    </div>
    <div class="loginContainer">
        <!-- 회원 / 비회원 구분 -->
        <ul class="isMember">
            <li class="nowSelected"><p>회원</p></li>
            <li><p>비회원</p></li>
        </ul>

        <!-- 로그인 정보 작성 -->
        <div class="loginBox">
            <form id="loginForm" action="">
                <input type="text" name="" placeholder="MEMBER ID" required>
                <input type="password" name="" placeholder="PASSWORD" required>
                <div class="checkboxContainer">
                    <label for="security"><input type="checkbox" name="security" id="security" value=true>보안접속</label>
                </div>
                <a href="" class="loginBtn">로그인</a>
            </form>
            <a href="" class="registerBtn">회원가입</a>
        </div>
    </div>
</div>
</body>
</html>
