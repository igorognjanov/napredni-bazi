package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.Match;
import com.example.bettingsystem.views.MatchesView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MatchRepository extends JpaRepository<Match,Long> {

}