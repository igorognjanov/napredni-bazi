package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.MatchesView;
import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.SeasonsView;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface SeasonsViewRepository extends PagingAndSortingRepository<SeasonsView, Long>, JpaRepository<SeasonsView,Long> {
    List<SeasonsView> findAllByYearStarted(String s);
}
