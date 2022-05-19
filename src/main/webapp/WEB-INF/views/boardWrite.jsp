<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/css/boardWrite.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/reset.css'>">
</head>

<body>
<div class="bodyContainer">
    <form action="" method="POST">
        <input type="text">
        <br>
        <textarea id="textarea"></textarea>
        <br>
        <input type="submit" value="글쓰기">
    </form>
</div>
<script src="script.js"></script>
</body>

</html>
