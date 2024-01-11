package com.example.bettingsystem.views;

import jakarta.persistence.*;


@Entity
@Table(schema = "public", name = "matches_view")
public class MatchesView {

    @Id
    public Long id;

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

    public Long getId() {
        return id;
    }
}
