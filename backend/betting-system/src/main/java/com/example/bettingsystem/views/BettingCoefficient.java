package com.example.bettingsystem.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "bettingcoefficients")
public class BettingCoefficient {
    @Id
    private Long id;

    @Column(name = "coefficient")
    public Float coefficient;

    @Column(name = "state")
    public String state;

    @Column(name = "matchesid")
    public Long matchesId;

    @Column(name = "bettingcombinationsid")
    public Long bettingCombinationsId;

    public Long getId() {
        return id;
    }
}
