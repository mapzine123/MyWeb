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
    <br/>
    <div class="pagingContainer">
        <div class="pagingNav">
            <c:if test="${totalCnt == null || totalCnt == 0}">
                <div>게시물이 없습니다.</div>
            </c:if>
            <c:if test="${totalCnt != null || totalCnt != 0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value='/board/boardList${ph.sc.getQueryString(ph.beginPage - 1)}'/>}"><</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i == ph.sc.page ? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value='/board/boardList${ph.sc.getQueryString(ph.engPage + 1)}'/>">></a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
</body>
<script src="<c:url value="js/boardJs.js"/>"></script>
<script>
    alert("hi");
</script>
</html>
