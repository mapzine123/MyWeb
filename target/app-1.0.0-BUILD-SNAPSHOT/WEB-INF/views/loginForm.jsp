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
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/loginForm.css'/>">
</head>
<body>


<div class="bodyContainer">
    <%--    상단 네비바--%>
    <%@include file="jspf/navi.jspf" %>
    <div class="login">
        <p>Login</p>
    </div>
    <div class="loginContainer">
        <!-- 회원 / 비회원 구분 -->
        <ul class="isMember">
            <li class="nowSelected"><p>회원</p></li>
            <li><p>비회원</p></li>
        </ul>

        <!-- 로그인 정보 작성 -->
        <div class="loginBox">
            <form id="loginForm" action="<c:url value='/login/login'/>" method="POST">
                <input type="text" name="uid" id="inputId" value="${cookie.uid.value}" placeholder="MEMBER ID" required>
                <input type="password" name="pwd" placeholder="PASSWORD" required>
                <div class="checkboxContainer">
                    <label for="rememberId">
                        <input type="checkbox" name="rememberId" id="rememberId" value="on" ${empty cookie.uid.value ? "" : "checked"}>자동로그인
                    </label>
                </div>
                <a class="loginBtn">로그인</a>
            </form>
            <a href="<c:url value='/login/register'/>" class="registerBtn">회원가입</a>
        </div>
    </div>
</div>
<script type="text/javascript" src="<c:url value='/js/loginForm.js'/>"></script>
<script>
    let msg = "${msg}";
    if(msg === "LOG_ERR") {
        alert("아이디나 패스워드가 다릅니다.");
    }
    if(msg === "REG_OK") {
        let uid = document.querySelector("#inputId");
        uid.value = "${userDto.uid}";
    }
</script>
</body>
</html>
