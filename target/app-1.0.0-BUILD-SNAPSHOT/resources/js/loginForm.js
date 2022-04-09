document.addEventListener("DOMContentLoaded", function() {
     let loginBtn = document.querySelector(".loginBtn");

     alert("hi");

     loginBtn.addEventListener("click", login);

     function login() {
         let form = document.querySelector("#loginForm");
         form.submit();
     }
});