package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.domain.RegisterDTO;
import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.repository.RoleRepository;
import com.example.demo.repository.UserRepository;

@Service
public class UserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public String handleHello() {
        return "hello";
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    // Mapper RegisterDTO to User
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getLastName() + " " + registerDTO.getFirstName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    // Kiểm tra email đã tồn tại hay chưa
    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    // Lấy ra User by Email
    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
