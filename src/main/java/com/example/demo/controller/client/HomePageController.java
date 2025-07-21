package com.example.demo.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.Product;
import com.example.demo.service.ProductService;

@Controller
public class HomePageController {
    private ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> product = this.productService.getAllProduct();
        model.addAttribute("products", product);
        return "client/homepage/show";
    }

    @GetMapping("/403")
    public String accessDenied() {
        return "client/reg/403";
    }

}
