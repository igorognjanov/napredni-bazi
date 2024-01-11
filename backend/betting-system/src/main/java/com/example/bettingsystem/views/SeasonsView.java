package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "seasons")
public class SeasonsView {
    @Id
    private Long id;

    @Column(name = "year_started")
    public String yearStarted;

    @Column(name = "legue_name")
    public String leagueName;

    public Long getId() {
        return id;
    }
}
