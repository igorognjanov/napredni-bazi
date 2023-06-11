package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.JudgesView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JudgesViewRepository extends PagingAndSortingRepository<JudgesView, Long> {
}
