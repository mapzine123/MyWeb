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
           let requestJson = new Object(); // 입력 데이터를 JSON으로 변경
           requestJson.name = inputName;
           httpRequest = new XMLHttpRequest(); // 통신에 사용될 XMLHttpRequest 객체 저의
           httpRequest.onreadystatechange = () => {
               // XMLHttpRequest.readyState : 요청상태를 나타내는 숫자
               // XMLHttpRequest.DONE : 서버로 모든 응답을 받았고, 이를 처리할 준비가 된 상수
               if(httpRequest.readyState === XMLHttpRequest.DONE) {
                   // httpRequest.status : 응답 상태코드
                   if(httpRequest.status === 200) {
                       let result = httpRequest.response; // 서버로부터 받은 객체
                       document.getElementById("name").innerText = result.name;
                       document.getElementById("age").innerText = result.age;
                   } else {
                       alert('request가 뭔가 잘못됨');
                   }
               }
           };
           // POST 방식으로 요청
           // XMLHttpRequest.open(요청방식, 요청 URL, 비동기 처리 여부)
           httpRequest.open('POST', '/app/postAgeByName', true);
           // 응답 타입 미리 정의
           httpRequest.responseType = 'json';

           httpRequest.setRequestHeader('Content-Type', 'application/json');
           // JSON 형식의 객체를 stringify해서 서버로 전송
           httpRequest.send(JSON.stringify(requestJson));
        });
    }
</script>
</html>
