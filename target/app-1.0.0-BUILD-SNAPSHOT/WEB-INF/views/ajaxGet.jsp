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
        httpRequest.onreadystatechange = () => { // httpRequest의 readystate가 변경되면 함수 실행
            if(httpRequest.readyState === XMLHttpRequest.DONE) {
                if(httpRequest.status === 200) { // 200번 응답 ( 정사처리 ) 가 돌아오면 실행
                    let result = httpRequest.response;
                    document.getElementById("name").innerText = result.name;
                    document.getElementById("age").innerText = result.age;
                } else { // 응답 실패시 실행
                    alert('Request Error');
                }
            }
        };
        // GET방식으로 name 파라미터와 함께 요청
        httpRequest.open('GET', '/app/getAgeByName?inputName=' + inputName);
        // ResponseType을 미리 정의 ( 이걸로 돌려주세요 )
        httpRequest.responseType = "json";
        // 서버에 전송
        httpRequest.send();
    })
</script>
</html>
