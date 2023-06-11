package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(schema = "public", name = "bets")
public class BetsView extends BaseEntity {

    @Column(name = "home_team")
    public String homeTeam;

    @Column(name = "away_team")
    public String awayTeam;

    @Column(name = "combination")
    public String combination;

    @Column(name = "coefficient")
    public Double coefficient;

    @Column(name = "state")
    public String state;

    @Column(name = "result")
    public String result;

    @Column(name = "date")
    public LocalDateTime date;

}
