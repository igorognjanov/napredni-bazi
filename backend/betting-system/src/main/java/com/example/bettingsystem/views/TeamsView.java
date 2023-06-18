package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "teams")
public class TeamsView extends BaseEntity {

    @Column(name = "name")
    public String name;

    @Column(name = "location")
    public String city;

    @Column(name = "league")
    public String league;

    @Column(name = "stadium")
    public String stadium;

    @Column(name = "year_league")
    public String yearLeague;

}
