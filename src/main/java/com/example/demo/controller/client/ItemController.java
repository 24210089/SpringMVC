package com.example.demo.controller.client;

import com.example.demo.domain.Product;
import com.example.demo.service.CartService;
import com.example.demo.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ItemController {

    private final ProductService productService;
    private final CartService cartService;

    public ItemController(ProductService productService, CartService cartService) {
        this.productService = productService;
        this.cartService = cartService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product productDetail = this.productService.getById(id);
        model.addAttribute("productDetails", productDetail);
        return "client/product/detail";
    }

    // Nhận thông tin từ <button> của add-product-to-cart trong file
    // homepage/show.jsp
    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.cartService.handleAddProductToCart(email, productId);
        return "redirect:/";
    }

}
