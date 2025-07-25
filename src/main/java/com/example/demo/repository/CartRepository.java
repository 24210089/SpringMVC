package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(com.example.demo.domain.User user);
}
