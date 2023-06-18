package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.TicketStatusView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TicketStatusViewRepository extends PagingAndSortingRepository<TicketStatusView, Long> {
}
