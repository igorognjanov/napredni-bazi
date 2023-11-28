package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(name = "tiketbet")
public class TicketBet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tiketid", nullable = false)
    private Long tiketId;

    public Long getId() {
        return id;
    }

    public Long getBettingCoefficientsId() {
        return bettingCoefficientsId;
    }
    public Long getTiketId(){
        return tiketId;
    }

    @Column(name = "bettingcoefficientsid", nullable = false)
    private Long bettingCoefficientsId;


    @Override
    public String toString() {
        return "TicketBet{" +
                "id=" + id +
                ", tiketId=" + tiketId +
                ", bettingCoefficientsId=" + bettingCoefficientsId +
                '}';
    }
}

