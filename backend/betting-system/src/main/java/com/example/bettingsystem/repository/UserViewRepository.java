package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.PlayersView;
import com.example.bettingsystem.views.UsersView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

public interface UserViewRepository extends PagingAndSortingRepository<UsersView, Long>, JpaRepository<UsersView,Long> {
}
