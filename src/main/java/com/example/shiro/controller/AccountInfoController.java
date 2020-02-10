package com.example.shiro.controller;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountInfoController {

    @RequiresRoles("Administration")
    @RequestMapping("/account-info")
    public String getAccountInfo(){
        return "account_info";
    }
}
