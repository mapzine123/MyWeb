<%--
  Created by IntelliJ IDEA.
  User: mapzi
  Date: 2022-05-25
  Time: 오전 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
    <h2>{name:"abc", age:10}</h2>
    <button id="sendBtn" type="button">SEND</button>
    <h2>Data From Server : </h2>
    <div id="data"></div>
    <script>
        $(document).ready(function() {
            let person = {name : "abc", age : 10};
            let person2 = {};

            $("#sendBtn").click(function() {
                $.ajax({
                    type:'POST', // 전송 방식
                    url: '/app/send', // 요청 URL
                    headers : {"content-type" : "application/json"}, // 해더 값을 K,V 형태로 설정
                    dataType : 'text', // 서버에서 받을 데이터 형식 (xml, json, script, html...)
                    data : JSON. (person), // 서버로 보낼 데이터
                    success : function(result) { // 요청 성공시 실행되는 콜백함수
                        person2 = JSON.parse(result);
                        alert("received = " + result);
                        $("#data").html("name : " + person2.name + ", age : " + person2.age);
                    },
                    error : function() { // 요청 실패시 실행되는 콜백함수
                        alert("error");
                    }
                });
            });

            $("#sendBtn").click(function() {
               $.ajax({
                   type: 'POST',
                   url: '<c:url value="/ajax"/>',
                   headers : {"content-type" : "application/json"},
                   dataType: 'text',
                   data : JSON.stringify(person),
                   success : function(result) {
                       person2 = JSON.parse(result);
                       // 할일
                   },
                   error : function() {
                       // 오류났을 시 할 일
                   }
               });
            });

            $("#sendBtn").mouseover(function() {
               $.ajax({
                   type: 'POST',
                   url: '<c:url value="/ajax"/>',
                   headers : {"content-type" : "application/json"},
                   dataType: 'text',
                   data: JSON.stringify(person),
                   success : function(result) {
                       person2 = JSON.parse(result);
                   },
                   error : function() {
                       alert("오류");
                   }
               });
            });
        });
    </script>
</body>
</html>
