package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.MatchesView;
import com.example.bettingsystem.views.PlayersView;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;

public interface MatchesRepository extends PagingAndSortingRepository<MatchesView, Long>, JpaRepository<MatchesView,Long> {
    Page<MatchesView> findAllByHomeTeamLikeOrAwayTeamLike(String homeTeam, String awayTeam, Pageable pageable);

    @Transactional
    @Query(value = "SELECT insert_match_function(:p_judgeid, :p_stadiumid, :p_seasonid, :p_hometeam, :p_awayteam, :p_date)", nativeQuery = true)
    void insertMatchFunction(
            @Param("p_judgeid") Integer p_judgeid,
            @Param("p_stadiumid") Integer p_stadiumid,
            @Param("p_seasonid") Integer p_seasonid,
            @Param("p_hometeam") Integer p_hometeam,
            @Param("p_awayteam") Integer p_awayteam,
            @Param("p_date") Date p_date
    );
}

