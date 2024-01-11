package com.example.bettingsystem.repository;


import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.TeamsView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamsViewRepository extends PagingAndSortingRepository<TeamsView, Long>, JpaRepository<TeamsView,Long> {
}
