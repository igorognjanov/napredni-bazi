package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(schema = "public", name = "users")
public class UsersView extends BaseEntity {

    @Column(name = "first_name")
    public String firstName;

    @Column(name = "last_name")
    public String lastName;

    @Column(name = "email")
    public String email;

    @Column(name = "username")
    public String username;

    @Column(name = "date_of_birth")
    public LocalDateTime dateOfBirth;

    @Column(name = "address")
    public String address;

    @Column(name = "deposit")
    public Long deposit;

    @Column(name = "gender")
    public String gender;

}
