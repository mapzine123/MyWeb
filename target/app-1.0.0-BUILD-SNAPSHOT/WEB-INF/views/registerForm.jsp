<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value="/css/registerForm.css" />">
</head>

<body>
<div class="bodyContainer">
    <div class="flexContainer">
        <div class="join">
            <p>Join</p>
        </div>
        <div class="joinForm">
            <form class="registerForm" action="<c:url value='/login/register'/>" method="POST">
                <label class="inputLbl" for="name">
                    <span>이름</span>
                    <input type="text" name="name" id="name" autocomplete="off">
                </label>
                <label class="inputLbl" for="uid">
                    <span>아이디</span>
                    <input type="text" name="uid" id="uid" autocomplete="off">
                </label>
                <label class="inputLbl" for="pwd">
                    <span>비밀번호</span>
                    <input type="password" name="pwd" id="pwd" autocomplete="off">
                </label>
                <label class="inputLbl" for="pwdCheck" >
                    <span>비밀번호 확인</span>
                    <input type="password" name="pwdCheck" id="pwdCheck" autocomplete="off">
                </label>
                <label class="inputLbl" for="email">
                    <span>이메일</span>
                    <input type="email" name="email" id="email" autocomplete="off">
                </label>
                <label id="checkLbl" for="check">
                    <input type="checkbox" name="" id="check">
                    <span>14세 이상입니다.<p id="required">필수</p></span>
                </label>

                <div class="btnContainer">
                    <div class="registerBtn">회원가입</div>
                    <div class="cancelBtn">취소</div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="<c:url value='/js/registerForm.js'/>"></script>
</body>
</html>
