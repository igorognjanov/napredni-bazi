package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.TeamsView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamsViewRepository extends PagingAndSortingRepository<TeamsView, Long> {
}
