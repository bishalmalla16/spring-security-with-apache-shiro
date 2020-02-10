package com.example.shiro.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String getHomePage(Model model){
        Subject subject = SecurityUtils.getSubject();
        model.addAttribute("subject", subject);
        return "index";
    }

    @RequestMapping("/login")
    public String getLoginPage(){
        return "login";
    }
}
