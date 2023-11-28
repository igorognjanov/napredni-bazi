package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.TicketBet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface TicketBetRepository extends JpaRepository<TicketBet, Long> {


    @Query("SELECT t FROM TicketBet t WHERE t.tiketId = :tiketId")
    List<TicketBet> findByTiketId(@Param("tiketId") Long tiketId);
}
