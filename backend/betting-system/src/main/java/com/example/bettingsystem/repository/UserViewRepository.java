package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.UsersView;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserViewRepository extends PagingAndSortingRepository<UsersView, Long> {
}
