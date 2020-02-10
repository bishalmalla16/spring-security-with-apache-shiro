package com.example.shiro.controller;

import com.example.shiro.model.Role;
import com.example.shiro.model.User;
import com.example.shiro.repo.RoleRepository;
import com.example.shiro.service.UserService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleRepository roleRepository;

    @RequiresRoles("Administration")
    @GetMapping("/update")
    public String update(@RequestParam(defaultValue = "0") int id, Model model){
        User existingUser = userService.findById(id);
        model.addAttribute("user", existingUser);
        List<Role> roleList = roleRepository.findAll();
        model.addAttribute("roleList", roleList);
        return "update_user";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult){
        if(bindingResult.hasErrors())
            return "index";
        userService.updateUser(user);
        return "index";
    }
}
