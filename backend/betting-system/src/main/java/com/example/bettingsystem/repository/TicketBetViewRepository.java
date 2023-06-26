package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.TicketBetView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketBetViewRepository extends PagingAndSortingRepository<TicketBetView, Long> {
}
