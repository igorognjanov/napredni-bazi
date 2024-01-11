package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.PlayersView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

public interface PlayersViewRepository extends PagingAndSortingRepository<PlayersView, Long>, JpaRepository<PlayersView,Long> {
}
