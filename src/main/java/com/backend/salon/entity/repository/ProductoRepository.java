package com.backend.salon.entity.repository;


import com.backend.salon.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepository extends JpaRepository<Product, Long> {
    }

