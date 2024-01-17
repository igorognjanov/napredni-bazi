package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "stadium")
public class StadiumView {
    @Id
    private Long id;

    @Column(name = "name")
    public String name;

//    @Column(name = "location")
//    public String location;

    public Long getId() {
        return id;
    }
}
