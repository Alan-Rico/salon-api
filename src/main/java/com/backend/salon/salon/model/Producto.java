package com.backend.salon.salon.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Entity
@Table(name = "productos")
public class Producto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_producto; // Exacto como tu diagrama

    private String nombre;
    private String descripcion;
    private Double precio;
    private Integer stock;
    private String categoria;
}
