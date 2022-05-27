<%--
  Created by IntelliJ IDEA.
  User: mapzi
  Date: 2022-05-20
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="<c:url value='/image/upload'/>" method="post" enctype="multipart/form-data">
      <p>파일 : <input type="file" name="filename"></p>
      <p><input type="submit" value="파일올리기"></p>
  </form>

<%-- 이미지경로 sql을 따로 만들어서, 게시물 번호를 key값으로 하여 불러오면 됨 --%>
</body>
</html>
