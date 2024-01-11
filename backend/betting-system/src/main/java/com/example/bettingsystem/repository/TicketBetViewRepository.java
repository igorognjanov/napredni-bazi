package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.TicketBet;
import com.example.bettingsystem.views.TicketBetView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.stream.Stream;

@Repository
public interface TicketBetViewRepository extends PagingAndSortingRepository<TicketBetView, Long>, JpaRepository<TicketBetView,Long> {

    @Procedure("ticket_bets_search")
    void callTicketBetsSearch(@Param("ticketid") Long ticketId);

    List<TicketBetView> findAllByIdIn(List<Long> id);
}
