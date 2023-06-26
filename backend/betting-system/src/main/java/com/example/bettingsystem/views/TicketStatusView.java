package com.example.bettingsystem.views;

import com.example.bettingsystem.model.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "tikets_status")
public class TicketStatusView extends BaseEntity {

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

}
