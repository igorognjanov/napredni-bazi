package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.SeasonsView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeasonsViewRepository extends PagingAndSortingRepository<SeasonsView, Long> {
}
