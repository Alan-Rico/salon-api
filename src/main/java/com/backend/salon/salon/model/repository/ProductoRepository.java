package com.backend.salon.salon.model.repository;


import com.backend.salon.salon.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepository extends JpaRepository<Producto, Long> {
    }

