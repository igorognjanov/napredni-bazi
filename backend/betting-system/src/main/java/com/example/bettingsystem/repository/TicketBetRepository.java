package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.TicketBet;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface TicketBetRepository extends JpaRepository<TicketBet, Long> {


    @Query("SELECT t FROM TicketBet t WHERE t.tiketId = :tiketId")
    List<TicketBet> findByTiketId(@Param("tiketId") Long tiketId);

    @Transactional
    @Query(value = "SELECT insert_ticket_function(:p_stake, :p_return, :p_odd, :p_userid)", nativeQuery = true)
    Integer insertTicketFunction(
            @Param("p_stake") Integer p_stake,
            @Param("p_return") Integer p_return,
            @Param("p_odd") Integer p_odd,
            @Param("p_userid") Integer p_userid
    );

    @Transactional
    @Query(value = "SELECT insert_ticketBet_function(:p_tiketId, :p_betId)", nativeQuery = true)
    void insertTicketBetFunction(
            @Param("p_tiketId") Integer p_tiketId,
            @Param("p_betId") Integer p_betId
    );
}
