package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.BetsView;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.lang.reflect.Array;
import java.util.List;

public interface BetsViewRepository extends PagingAndSortingRepository<BetsView, Long>, JpaRepository<BetsView,Long> {
    List<BetsView> findAllByIdIn(Integer[] list);
}
