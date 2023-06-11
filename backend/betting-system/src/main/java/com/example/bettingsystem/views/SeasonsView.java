package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "seasons")
public class SeasonsView extends BaseEntity {

    @Column(name = "year_started")
    public String yearStarted;

    @Column(name = "legue_name")
    public String leagueName;

}
