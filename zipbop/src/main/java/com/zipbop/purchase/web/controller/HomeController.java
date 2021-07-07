package com.zipbop.purchase.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(HttpServletRequest request) {
        HttpSession session = request.getSession();

        // session에 ID 값 넣는 로직
        session.setAttribute("id", "hong");
        return "home";
    }

    @GetMapping("/hello")
    public String hello(HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("id = " + id);
        return "hello";
    }
}
