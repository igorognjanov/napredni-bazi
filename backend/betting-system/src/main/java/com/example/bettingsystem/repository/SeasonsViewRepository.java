package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.SeasonsView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

public interface SeasonsViewRepository extends PagingAndSortingRepository<SeasonsView, Long>, JpaRepository<SeasonsView,Long> {
}
