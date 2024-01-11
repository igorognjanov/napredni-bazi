package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "coaches")
public class CoachesView {
    @Id
    private Long id;

    @Column(name = "first_name")
    public String firstName;

    @Column(name = "last_name")
    public String lastName;

    @Column(name = "team")
    public String teamName;

    public Long getId() {
        return id;
    }
}
