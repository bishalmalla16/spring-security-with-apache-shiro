package com.example.shiro.service;

import com.example.shiro.model.Role;
import com.example.shiro.repo.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepository;

    public void addRole(Role role){
//        List<String> permissions = new ArrayList<>();
//        permissions.add("user:view");
//        permissions.add("book:read");
//        role.setPermissions(permissions);
        roleRepository.save(role);
    }
}
