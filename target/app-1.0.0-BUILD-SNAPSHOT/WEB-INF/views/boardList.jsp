<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="<c:url value="/css/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/boardList.css"/>">
</head>

<body>
<%@include file="jspf/navi.jspf"%>

<div class="bodyContainer">
    <div class="searchContainer">
        <form action="<c:url value='/board/boardList'/>" class="searchForm" method="get">
            <select class="searchOption" name="option">
                <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목 + 내용</option>
                <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자만</option>
            </select>
            <input type="text" name="keyword" class="searchInput" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요"/>
            <input type="submit" class="searchButton" value="검색"/>
        </form>
    </div>
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
            <c:if test="${totalCnt != null && totalCnt != 0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value='/board/boardList${ph.sc.getQueryString(ph.beginPage - 1)}'/>}"><</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i == ph.sc.page ? "paging-active" : ""}" href="<c:url value="/board/boardList${ph.sc.getQueryString(i)}"/>">${i}</a>
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
</script>
</html>
