package com.example.demo.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.demo.domain.Cart;
import com.example.demo.domain.CartDetail;
import com.example.demo.domain.Product;
import com.example.demo.domain.User;
import com.example.demo.repository.CartDetailRepository;
import com.example.demo.repository.CartRepository;
import com.example.demo.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class CartService {
    private CartRepository cartRepository;
    private CartDetailRepository cartDetailRepository;
    private UserService userService;
    private ProductRepository productRepository;

    public CartService(CartRepository cartRepository, CartDetailRepository cartDetailRepository,
            UserService userService, ProductRepository productRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.productRepository = productRepository;
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        // Kiểm tra User đã có hay chưa
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // Kiểm tra User có Cart chưa? Nếu chưa -> tạo mới
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                // Tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }
            // Lưu cart_detail
            // Tìm product by id
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();
                // Kiểm tra xem sản phẩm có trong giỏ hàng chưa
                CartDetail existingCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (existingCartDetail != null) {
                    // Nếu sản phẩm đã có, set Quantity lên 1

                    existingCartDetail.setQuantity(existingCartDetail.getQuantity() + 1);
                    // Lưu vào database
                    this.cartDetailRepository.save(existingCartDetail);
                    // cập nhật sum trong cart
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    // Nếu sản phẩm chưa có, tạo CartDetail mới
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);
                    this.cartDetailRepository.save(cd);
                }

            }

        }
    }
}
