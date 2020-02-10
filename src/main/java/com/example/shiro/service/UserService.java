package com.example.shiro.service;

import com.example.shiro.model.Role;
import com.example.shiro.model.User;
import com.example.shiro.repo.RoleRepository;
import com.example.shiro.repo.UserRepository;
import javassist.NotFoundException;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    public List<User> findAllUsers(){
        return userRepository.findAll();
    }

    public User findById(int id){
        return userRepository.findById(id).orElse(null);
    }

    public void createUser(User user){
        user.setPassword(new Sha256Hash(user.getPassword()).toHex());
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByRoleName("User").orElse(null));
        user.setRoles(roles);
        userRepository.save(user);
    }

    public void updateUser(User user){
        if(userRepository.findById(user.getId()).isPresent()) {
            userRepository.save(user);
        }
    }

    public void deleteUser (int id){
        if(userRepository.findById(id).isPresent()) {
            userRepository.deleteById(id);
        }
    }
}
