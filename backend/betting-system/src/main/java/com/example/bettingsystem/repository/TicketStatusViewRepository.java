package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.TicketStatusView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

public interface TicketStatusViewRepository extends PagingAndSortingRepository<TicketStatusView, Long>, JpaRepository<TicketStatusView,Long> {
}
