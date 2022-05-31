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
    <div class="boardContainer">
        <div class="loginNav">
            <ul>
                <c:if test="${sessionScope.uid == null}">
                    <li><a href="<c:url value='/login/login'/>">Login</a></li>
                    <li><a href="<c:url value='/login/register'/>">Join</a></li>
                </c:if>
                <c:if test="${sessionScope.uid != null}">
                    <a href="<c:url value='/login/logout'/>">Logout</a>
                </c:if>
                <li><a class="myPage" href="<c:url value='/user/myPage'/>">MyPage</a></li>
                <li><a href="#">Order</a></li>
                <li><a href="#">Cart</a></li>
                <li><a href="<c:url value="/board/boardList" />">Community</a></li>
                <li><a href="#" class="menuIcon"><i class="fa fa-bars"></i></a></li>
            </ul>
        </div>
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
            <div class="commentBox">
                <div class="commenter">코멘터</div>
                <span class="comment">댓글댓글댓글댓글댓글댓글댓글댓글</span>
                <div class="commentInfo">
                    <span class="update cInfo">2015.03.26. 15:15</span>
                    <span class="pCommentBtn cInfo">답글쓰기</span>
                </div>
            </div>
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
</body>

</html>
