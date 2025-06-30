package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;

import com.example.demo.domain.User;
import com.example.demo.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {
    private final UserService userService;
    

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")   
    public String getHomePage(Model model){
        String message = userService.handleHello();
        model.addAttribute("message", message);
        
        return "hello";
    }
    
    @RequestMapping("/admin/user")
    public String userTable(Model model) {
        List<User> userList = this.userService.getAllUsers();
        model.addAttribute("users", userList);
        return "admin/user/table-user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserView(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id); // Lấy từ database
        model.addAttribute("user", user); //truyền qua view
        return "admin/user/show"; // Trả về trang show.jsp
    }

    //Update user
    @GetMapping("/admin/user/update/{id}") //Lấy data từ sql lên view
    public String getUserUpdate(Model model, @PathVariable long id){
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "/admin/user/update"; //Trả về trang update.jsp
    }

    @PostMapping("/admin/user/update") // đẩy data từ view xuống sql, link giống với thuộc tính action trong update.jsp
    public String postUserUpdate(Model model,@ModelAttribute("user") User hoidanit){
        User user = this.userService.getUserById(hoidanit.getId());
        if(user!=null){
            user.setAddress(hoidanit.getAddress());
            user.setFullName(hoidanit.getFullName());
            user.setPhone(hoidanit.getPhone());
            this.userService.handleSaveUser(hoidanit); //Lưu vào database
        }
        return "redirect:/admin/user/"+hoidanit.getId();
    }



    //Create New User

    @RequestMapping("/admin/user/create")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method=RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User hoidanit ) {
        System.out.println("run here " + hoidanit);
        this.userService.handleSaveUser(hoidanit);
        return "redirect:/admin/user";
    }
    
    
}
