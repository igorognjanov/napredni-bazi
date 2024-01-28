package com.example.bettingsystem.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "team")
public class Team {
    @Id
    private Long id;

    @Column(name = "name")
    public String name;

    @Column(name = "league_id")
    public Long leagueId;


}
