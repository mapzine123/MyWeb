document.addEventListener("DOMContentLoaded", function() {
    let loginBtn = document.querySelector(".loginBtn");
     loginBtn.addEventListener("click", login);

     function login(event) {
         event.preventDefault();
         let form = document.querySelector("#loginForm");
         form.submit();
     }


});