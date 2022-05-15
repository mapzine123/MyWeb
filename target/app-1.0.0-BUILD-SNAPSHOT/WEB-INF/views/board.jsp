<%--
  Created by IntelliJ IDEA.
  User: mapzi
  Date: 2022-05-14
  Time: 오후 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
    <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/board.css'/>">
</head>
<body>
<div class="bodyContainer">
    <div class="headerContainer">
        <h3 class="title">${boardDto.btitle}</h3>
        <span class="nickname">${boardDto.bauthor}</span> |
        <span class="regDate">${boardDto.reg_date}</span>
        <span class="viewCount">${boardDto.view_count}</span>
    </div>
    <hr>
    <div class="contentBox">
        <div class="content">${boardDto.bcontent}</div>
    </div>
</div>
<script src="script.js"></script>
</body>
</html>
