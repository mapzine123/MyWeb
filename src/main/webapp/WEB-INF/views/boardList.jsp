<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판</title>
</head>
<body>
<%@include file="jspf/navi.jspf"%>
<table>
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
                <td class="bno">${boardDto.bno}</td>
                <td class="btitle">${boardDto.btitle}</td>
                <td class="bauthor">${boardDto.bauthor}</td>
                <td class="view_count">${boardDto.view_count}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
