<%--
  Created by IntelliJ IDEA.
  User: mapzi
  Date: 2022-05-25
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>AJAX POST TEST</h1>
    Name : <input type="text" id="inputName"/>
    <h2><span id="name"></span>의 나이는 <span id="age"></span> 입니다.</h2>
    <button id="ajaxCall" type="button">호출</button>
</body>
<script type="text/javascript">
    window.onload = function() {
        let httpRequest;
        document.getElementById("ajaxCall").addEventListener('click', () => {
           let inputName = document.getElementById("inputName").value;
           let requestJson = new Object();
           requestJson.name = inputName;
           httpRequest = new XMLHttpRequest();
           httpRequest.onreadystatechange = () => {
               if(httpRequest.readyState === XMLHttpRequest.DONE) {
                   if(httpRequest.status === 200) {
                       let result = httpRequest.response;
                       document.getElementById("name").innerText = result.name;
                       document.getElementById("age").innerText = result.age;
                   } else {
                       alert('request가 뭔가 잘못됨');
                   }
               }
           };
           httpRequest.open('POST', '/app/postAgeByName', true);
           httpRequest.responseType = 'json';
           httpRequest.setRequestHeader('Content-Type', 'application/json');
           httpRequest.send(JSON.stringify(requestJson));
        });
    }
</script>
</html>
