package com.example.bettingsystem.views;

import jakarta.persistence.*;

@Entity
@Table(schema = "public", name = "tikets_status")
public class TicketStatusView {
    @Id
    private Long id;

    @Column(name = "state")
    public String state;

    @Column(name = "username")
    public String username;

    @Column(name = "user_id")
    public Long userId;

    @Column(name = "return")
    public Long total_return;

    @Column(name = "odd")
    public Double odd;

    @Column(name = "stake")
    public String stake;

    public Long getId() {
        return id;
    }
}
