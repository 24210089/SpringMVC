package com.example.demo.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;

import jakarta.validation.Valid;

@Controller
public class LoginController {
    private UserService userService;
    private PasswordEncoder passwordEncoder;

    public LoginController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("userLogin", new User());
        return "client/reg/LoginForm";
    }

    @PostMapping("/login")
    public String postLoginPage(Model model, @ModelAttribute("userLogin") @Valid User user,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/reg/LoginForm";
        }
        return "/";
    }
}
