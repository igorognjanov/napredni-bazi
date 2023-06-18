package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.BetsView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BetsViewRepository extends PagingAndSortingRepository<BetsView, Long> {

}
