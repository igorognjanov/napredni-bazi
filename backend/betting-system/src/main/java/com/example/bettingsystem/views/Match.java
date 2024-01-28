package com.example.bettingsystem.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;


@Entity
@Table(schema = "public", name = "matches")
public class Match {

    @Id
    public Long id;

    @Column(name = "hometeam")
    public String homeTeam;

    @Column(name = "awayteam")
    public String awayTeam;

    @Column(name = "stadiumid")
    public Long stadium;

    @Column(name = "result")
    public String result;

    @Column(name = "judgeid")
    public Long judge;

    @Column(name = "Date")
    public Date Date;

    public Long getId() {
        return id;
    }
}
