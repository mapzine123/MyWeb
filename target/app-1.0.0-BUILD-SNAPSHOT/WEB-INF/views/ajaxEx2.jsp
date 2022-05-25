<%--
  Created by IntelliJ IDEA.
  User: mapzi
  Date: 2022-05-25
  Time: 오후 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        span {
            color : blue;
        }
    </style>
</head>
<body>
    <h1>AJAX GET TEST</h1>
    Name : <input type="text" id="inputName" />
    <button id="ajaxCall">호출</button>
    <h2><span id="name"></span>의 나이는 <span id="age"></span> 입니다.</h2>
</body>
<script type="text/javascript">
    let httpRequest;
    document.getElementById("ajaxCall").addEventListener('click', () => {
        let inputName = document.getElementById("inputName").value;
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = () => {
            if(httpRequest.readyState === XMLHttpRequest.DONE) {
                if(httpRequest.status === 200) {
                    let result = httpRequest.response;
                    document.getElementById("name").innerText = result.name;
                    document.getElementById("age").innerText = result.age;
                } else {
                    alert('Request Error');
                }
            }
        };
        httpRequest.open('GET', '/app/getAgeByName?inputName=' + inputName);
        httpRequest.responseType = "json";
        httpRequest.send();
    })
</script>
</html>
