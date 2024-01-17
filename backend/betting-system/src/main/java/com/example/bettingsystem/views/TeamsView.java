package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "teams")
public class TeamsView {
    @Id
    private Long id;

    @Column(name = "name")
    public String name;

//    @Column(name = "location")
//    public String location;
//
//    @Column(name = "league")
//    public String league;

    @Column(name = "stadium")
    public String stadium;

//    @Column(name = "year_league")
//    public String yearLeague;

    public Long getId() {
        return id;
    }
}
