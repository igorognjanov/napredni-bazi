package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.BetsView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BetsViewRepository extends PagingAndSortingRepository<BetsView, Long>, JpaRepository<BetsView,Long> {

}
