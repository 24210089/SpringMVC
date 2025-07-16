package com.example.demo.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.User;

import jakarta.validation.Valid;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/reg/LoginForm";
    }

    @PostMapping("/login")
    public String postLoginPage(Model model, @ModelAttribute("userLogin") @Valid User user,
            BindingResult bindingResult) {
        return "/";
    }
}
