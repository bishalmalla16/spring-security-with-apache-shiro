package com.example.shiro.controller;

import com.example.shiro.model.Role;
import com.example.shiro.model.User;
import com.example.shiro.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/register-role")
    public String getRegistrationForm(Model model){
        Role role = new Role();
        List<String> permissions = new ArrayList<>(5);
        model.addAttribute("role", role);
        model.addAttribute("permissions", permissions);
        return "add_role";
    }

    @PostMapping("/register-role")
    public String createRole(@ModelAttribute @Valid Role role, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors())
            return "add-role";
        roleService.addRole(role);
        return "redirect:/";
    }
}
