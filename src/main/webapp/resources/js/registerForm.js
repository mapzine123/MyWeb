document.addEventListener("DOMContentLoaded", function() {
    let registerBtn = document.querySelector(".registerBtn");
    let cancelBtn = document.querySelector(".cancelBtn");

    let pwd = document.querySelector("#pwd");
    let pwdCheck = document.querySelector("#pwdCheck");

    pwdCheck.addEventListener("blur", pwdChecked);
    registerBtn.addEventListener("click", register);


    function pwdChecked() {
        if(pwd.value !== pwdCheck.value) {
            pwdCheck.classList.add("wrong");
        } else {
            pwdCheck.classList.remove("wrong");
        }
    }

    function register(event) {
        if(pwd.value === pwdCheck.value && pwd.value.length !== 0) {
            let form = document.querySelector(".registerForm");
            form.submit()
        } else {
            alert("비밀번호를 확인해주세요.");
        }
    }
});