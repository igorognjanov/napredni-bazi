package com.example.bettingsystem.views;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "Matches")
public class Match {

    @Id
    public Long id;

    @Column(name = "hometeam")
    public Long homeTeam;

    @Column(name = "awayteam")
    public Long awayTeam;

    @Column(name = "stadiumid")
    public Long stadium;

    @Column(name = "result")
    public String result;

    @Column(name = "judgeid")
    public Long judge;

    @Column(name = "match_date")
    public Date date;

    public Long getId() {
        return id;
    }
}
