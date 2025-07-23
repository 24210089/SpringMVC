package com.example.demo.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.RegisterDTO;
import com.example.demo.domain.User;
import com.example.demo.service.UserService;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class RegisterController {
    private UserService userService;
    private PasswordEncoder passwordEncoder;

    public RegisterController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("NewRegisterDTO", new RegisterDTO());
        return "client/reg/RegisterForm";
    }

    @PostMapping("/register")
    public String postRegisterPage(Model model, @ModelAttribute("NewRegisterDTO") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        User user = this.userService.registerDTOtoUser(registerDTO);
        // Kiểm tra nếu có lỗi validation
        if (bindingResult.hasErrors()) {
            return "client/reg/RegisterForm";
        }

        if (this.userService.checkEmailExist(user.getEmail())) {
            bindingResult.rejectValue("email", "error.email", "Email đã tồn tại");
            return "client/reg/RegisterForm";
        }

        if (!registerDTO.getPassword().equals(registerDTO.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "error.confirmPassword", "Mật khẩu xác nhận không khớp");
            return "client/reg/RegisterForm";
        }
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);

        user.setRole(this.userService.getRoleByName("USER"));

        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

}
