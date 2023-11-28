package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.MatchesView;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MatchesRepository extends PagingAndSortingRepository<MatchesView, Long> {
    Page<MatchesView> findAllByHomeTeamLikeOrAwayTeamLike(String homeTeam, String awayTeam, Pageable pageable);
}

