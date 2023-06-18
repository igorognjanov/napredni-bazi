package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "judges")
public class JudgesView extends BaseEntity {

    @Column(name = "last_name")
    public String lastName;

    @Column(name = "first_name")
    public String firstName;

}
