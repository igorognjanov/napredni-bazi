package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.CoachesView;
import com.example.bettingsystem.views.PlayersView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

public interface CoachesViewRepository extends PagingAndSortingRepository<CoachesView, Long>, JpaRepository<CoachesView,Long> {
}
