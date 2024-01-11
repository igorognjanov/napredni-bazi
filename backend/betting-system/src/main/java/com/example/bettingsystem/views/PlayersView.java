package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(schema = "public", name = "players")
public class PlayersView {
    @Id
    private Long id;

    @Column(name = "first_name")
    public String firstName;

    @Column(name = "last_name")
    public String lastName;

    @Column(name = "date_of_birth")
    public LocalDateTime dateOfBirth;

    @Column(name = "country")
    public String country;

    @Column(name = "name")
    public String name;

    @Column(name = "from")
    public LocalDateTime from;

    @Column(name = "to")
    public LocalDateTime to;

    public Long getId() {
        return id;
    }
}
