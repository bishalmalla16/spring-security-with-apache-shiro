package com.example.shiro.controller;

import com.example.shiro.model.Role;
import com.example.shiro.model.User;
import com.example.shiro.repo.RoleRepository;
import com.example.shiro.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/update")
    public String update(@RequestParam(defaultValue = "0") int id, Model model){
        User existingUser = userService.findById(id);
        if(isUserNull(id, model))
            return "error";
        model.addAttribute("user", existingUser);
        List<Role> roleList = roleRepository.findAll();
        model.addAttribute("roleList", roleList);
        return "update_user";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult,Model model){
        if(bindingResult.hasErrors())
            return "index";
        userService.updateUser(user);
        model.addAttribute("users", userService.findAllUsers());
        return "user_list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(defaultValue = "0") int id, Model model){
        if(isUserNull(id, model))
            return "error";
        userService.deleteUser(id);
        return "redirect:/users";
    }

    private boolean isUserNull(int id, Model model){
        User user = userService.findById(id);
        if(user == null){
            Map<String, Object> errorMap = new HashMap<>();
            errorMap.put("status", HttpStatus.NOT_FOUND.value());
            errorMap.put("message", "User with id " + id + " not found.");
            model.addAttribute("errors", errorMap);
            return true;
        }
        return false;
    }
}
