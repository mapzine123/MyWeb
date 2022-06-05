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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div class="bodyContainer">
    <%@include file="jspf/navi.jspf" %>
    <div class="boardContainer">
        <div class="headerContainer">
            <h3 class="title">${boardDto.btitle}</h3>
            <div class="nickname">${boardDto.bauthor}</div>
            <span class="regDate cInfo">${boardDto.reg_date}</span>
            <span class="viewCount cInfo">조회 ${boardDto.view_count}</span>
            <span class="commentCount">댓글수</span>
        </div>
        <div class="contentContainer">
            <div class="content">${boardDto.bcontent}</div>
        </div>
        <div class="commentContainer">
            <div class="commentSortContainer">
                <h3 class="commentTitle">댓글</h3>
                <ul class="commentSort">
                    <li><a href="#" class="commentSortBtn">등록순</a></li>
                    <li><a href="#" class="commentSortBtn">최신순</a></li>
                </ul>
            </div>
            <c:forEach var="comment" items="${list}">
                <div class="commentBox">
                    <div class="commenter">${comment.commenter}</div>
                    <span class="comment">${comment.comment}</span>
                    <div class="commentInfo">
                        <span class="update cInfo">${comment.reg_date}</span>
                        <span class="pCommentBtn cInfo">답글쓰기</span>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${sessionScope.uid != null}"> <!-- 로그인 해야 댓글 작성 가능 -->
                <div class="commentWriteContainer">
                    <div class="author">${sessionScope.uid}</div>
                    <div>
                        <textarea id="commentTextarea" name="comment" placeholder="댓글을 입력해보세요."></textarea>
                    </div>
                    <div>
                        <button class="commentSubmit">등록</button>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.uid == null}">
                로그인해주세요.
            </c:if>
        </div>
    </div>
</div>
<script src="<c:url value="/js/board.js"/>"></script>
<script type="text/javascript">
    <%--const submitBtn = document.querySelector(".commentSubmit");--%>
    <%--let httpRequest;--%>
    <%--submitBtn.addEventListener("click", function() {--%>
    <%--    console.log("clicked!");--%>
    <%--    let requestJson = new Object();--%>
    <%--    let comment = document.querySelector("#commentTextarea").value;--%>
    <%--    let bno = ${boardDto.bno};--%>
    <%--    requestJson.comment = comment;--%>
    <%--    requestJson.bno = bno;--%>
    <%--    httpRequest = new XMLHttpRequest();--%>
    <%--    httpRequest.onreadystatechange = () => {--%>
    <%--        if(httpRequest.readyState === XMLHttpRequest.DONE) {--%>
    <%--            if(httpRequest.status === 200) {--%>
    <%--                document.querySelector(".commentContainer").load(window.location.href + '.commentContainer');--%>
    <%--            } else {--%>
    <%--                console.log("error");--%>
    <%--            }--%>
    <%--        }--%>
    <%--    };--%>
    <%--    httpRequest.open('POST', 'app/board/comment', true);--%>
    <%--    httpRequest.responseType = 'json';--%>
    <%--    httpRequest.setRequestHeader('Content-Type', 'application/json');--%>
    <%--    // httpRequest.send(JSON.stringify(requestJson));--%>
    <%--    httpRequest.send();--%>
    // });
    $(document).ready(function () {
        let commentText = document.querySelector("#commentTextarea");
        let comment = {comment: commentText.value};
        let bno = ${boardDto.bno};

        $(".commentSubmit").click(function () {
            $.ajax({
                type: 'POST',
                url: '<c:url value="/board/comment"/>',
                headers: {"content-type": "application/json"},
                dataType: 'text',
                data: JSON.stringify(comment),
                success: function (result) {
                    document.querySelector(".commentContainer").load(window.location.href + '.commentContainer');
                    console.log("success");
                },
                error : function() {
                    console.log("error");
                }
            });
        });
    });
</script>
</body>

</html>
