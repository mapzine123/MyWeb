<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="<c:url value="/css/boardList.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/reset.css"/>">
</head>

<body>
<div class="bodyContainer">
    <table class="boardList">
        <thead>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>시간</th>
        </thead>
        <tbody>
        <c:forEach var="boardDto" items="${list}">
            <tr>
                <td>${boardDto.bno}</td>
                <td>${boardDto.btitle}</td>
                <td>${boardDto.bauthor}</td>
                <td>${boardDto.view_count}</td>
                <td>${boardDto.reg_date}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="<c:url value="js/boardJs.js"/>"></script>
</html>
