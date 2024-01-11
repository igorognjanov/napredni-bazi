package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "judges")
public class JudgesView {
    @Id
    private Long id;

    @Column(name = "last_name")
    public String lastName;

    @Column(name = "first_name")
    public String firstName;

    public Long getId() {
        return id;
    }

}
