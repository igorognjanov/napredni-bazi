package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.JudgesView;
import com.example.bettingsystem.views.PlayersView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface JudgesViewRepository extends PagingAndSortingRepository<JudgesView, Long>, JpaRepository<JudgesView,Long> {
}
