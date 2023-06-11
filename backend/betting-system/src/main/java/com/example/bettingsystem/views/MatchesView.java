package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "matches_view")
public class MatchesView extends BaseEntity {

    @Column(name = "hometeam")
    public String homeTeam;

    @Column(name = "awayteam")
    public String awayTeam;

    @Column(name = "stadium")
    public String stadium;

    @Column(name = "result")
    public String result;

    @Column(name = "judge")
    public String judge;

    @Column(name = "date")
    public String date;

    @Column(name = "league")
    public String league;

    @Column(name = "league_year")
    public String leagueYear;

}
