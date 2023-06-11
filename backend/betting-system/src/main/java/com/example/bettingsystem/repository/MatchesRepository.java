package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.MatchesView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatchesRepository extends PagingAndSortingRepository<MatchesView, Long> {
}
