package com.example.demo.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;

import jakarta.servlet.ServletContext;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    private final UserService userService;
    private final ServletContext servletContext;

    public UserController(UserService userService, ServletContext servletContext) {
        this.userService = userService;
        this.servletContext = servletContext;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        String message = userService.handleHello();
        model.addAttribute("message", message);
        return "hello";
    }

    @GetMapping("/admin/user")
    public String userTable(Model model) {
        List<User> userList = this.userService.getAllUsers();
        model.addAttribute("users", userList);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserView(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    // Update user
    @GetMapping("/admin/user/update/{id}")
    public String getUserUpdate(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/update"; // ✅ Bỏ "/" đầu
    }

    @PostMapping("/admin/user/update")
    public String postUserUpdate(Model model, @ModelAttribute("user") User hoidanit) {
        User user = this.userService.getUserById(hoidanit.getId());
        if (user != null) {
            user.setAddress(hoidanit.getAddress());
            user.setFullName(hoidanit.getFullName());
            user.setPhone(hoidanit.getPhone());
            this.userService.handleSaveUser(user);
        }
        return "redirect:/admin/user/" + hoidanit.getId();
    }

    // Delete user
    @GetMapping("/admin/user/delete/{id}")
    public String getUserDelete(Model model, @PathVariable long id) {
        User deleteUser = this.userService.getUserById(id);
        model.addAttribute("deleteUser", deleteUser);
        return "admin/user/delete"; // ✅ Bỏ "/" đầu
    }

    @PostMapping("/admin/user/delete")
    public String postUserDelete(@ModelAttribute("deleteUser") User dUser) { // ✅ Bỏ Model không cần thiết
        if (dUser != null && dUser.getId() != 0) {
            this.userService.deleteUserById(dUser.getId());
        }
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/create")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") User hoidanit,
            @RequestParam("hoidanitFile") MultipartFile file) {

        // private final ServletContext servletContext;
        byte[] bytes;
        try {
            bytes = file.getBytes();

            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + "avatar");
            if (!dir.exists())
                dir.mkdirs();
            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator +
                    +System.currentTimeMillis() + "-" + file.getOriginalFilename());
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }
}
