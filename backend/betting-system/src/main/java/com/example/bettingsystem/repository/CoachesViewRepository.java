package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.CoachesView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoachesViewRepository extends PagingAndSortingRepository<CoachesView, Long> {
}
