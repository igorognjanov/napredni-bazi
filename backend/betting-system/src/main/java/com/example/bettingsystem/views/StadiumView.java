package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "Stadium")
public class StadiumView {
    @Id
    private Long id;

    @Column(name = "Name")
    public String name;

    @Column(name = "Location")
    public String location;

    public Long getId() {
        return id;
    }
}
