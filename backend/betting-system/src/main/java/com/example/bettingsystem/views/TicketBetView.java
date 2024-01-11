package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(schema = "public", name = "ticket_bet_view")
public class TicketBetView {

    @Id
    public Long id;

    @Column(name = "coefficient")
    public Double coefficient;

    @Column(name = "hometeam")
    public String homeTeam;

    @Column(name = "awayteam")
    public String awayTeam;

    @Column(name = "date")
    public LocalDateTime date;

    @Column(name = "combination")
    public String combination;

//    @Column(name = "username")
//    public String username;

    public Long getId() {
        return id;
    }
}
