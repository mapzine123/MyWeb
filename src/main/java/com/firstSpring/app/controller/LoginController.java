package com.firstSpring.app.controller;

import com.firstSpring.app.domain.UserDto;
import com.firstSpring.app.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.http.HttpResponse;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private LoginService loginService;

    @GetMapping("/logout")
    public String logout(HttpSession session, Model m) {
        session.removeAttribute("uid");
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "loginForm";
    }

    @PostMapping("/login")
    public String login(UserDto dto, boolean rememberId, Model m, HttpSession session, RedirectAttributes rattr, HttpServletResponse response) {

        try {
            UserDto current = loginService.loginUser(dto);

            if(current == null) {
                throw new Exception("logERR");
            }

            if(rememberId) {
                Cookie cookie = new Cookie("uid", dto.getUid());
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("uid", dto.getUid());
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }

            session.setAttribute("uid", current.getUid());
            rattr.addFlashAttribute("msg", "LOG_OK");
            return "redirect:/";

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("uid", dto.getUid());
            rattr.addFlashAttribute("msg", "LOG_ERR");
            return "redirect:/login/login";
        }
    }

    @GetMapping("/register")
    public String register() {
        return "registerForm";
    }

    @PostMapping("/register")
    public String register(UserDto dto, Model m, RedirectAttributes rattr) {
        String msg = "REG_OK";
        try {
            int rowCnt = loginService.register(dto);
            if(rowCnt != 1) {
                throw new Exception();
            }
            return "redirect:/login/login";
        } catch (Exception e) {
            e.printStackTrace();
            msg = "REG_ERR";
            return "redirect:/login/register";
        } finally {
            rattr.addFlashAttribute("userDto", dto);
            rattr.addFlashAttribute("msg", msg);
        }

    }
}

