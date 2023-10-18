package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.TicketBetView;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Repository
public interface TicketBetViewRepository extends PagingAndSortingRepository<TicketBetView, Long> {

    @Procedure("ticket_bets_search(:id)")
    TicketBetView ticketBetsSearchProcedure(@PathVariable("id") long id);

    List<TicketBetView> findAllById(Long id);

    @Query(value = "select * from ticket_bet_view tbv where tbv.id = :id;", nativeQuery = true)
    List<TicketBetView> getAllByIds(@Param("id") Long id);
}
