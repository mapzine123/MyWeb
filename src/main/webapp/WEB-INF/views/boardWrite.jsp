<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/boardWrite.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
</head>

<body>
<div class="bodyContainer">
    <%@include file="jspf/navi.jspf" %>
    <div class="contentContainer">
        <form action="<c:url value='/board/write'/>" method="POST">
            <input type="text" name="btitle" placeholder="제목을 입력하세요.">
            <br>
            <textarea id="textarea" name="bcontent" placeholder="본문을 입력하세요."></textarea>
            <br>
            <input type="submit" value="글쓰기">
        </form>
    </div>

</div>
<script src="script.js"></script>
</body>
</html>