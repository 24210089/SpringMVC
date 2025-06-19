package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import com.example.demo.service.UserService;

@Controller
public class UserController {
    private UserService userService;
    
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")   
    public String getHomePage(Model model){
        // Thêm dữ liệu từ service
        String message = userService.handleHello();
        model.addAttribute("message", message);
        
        return "hello"; // ✅ ĐÚNG - không có .jsp
    }
}
