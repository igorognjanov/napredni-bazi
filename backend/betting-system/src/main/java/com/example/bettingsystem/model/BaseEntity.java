package com.example.bettingsystem.model;

import jakarta.persistence.*;

@Entity
public class BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "id")
    public Long id;

}
