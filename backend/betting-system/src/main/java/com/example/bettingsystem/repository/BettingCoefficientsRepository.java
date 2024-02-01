package com.example.bettingsystem.repository;

import com.example.bettingsystem.views.BettingCoefficient;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BettingCoefficientsRepository extends JpaRepository<BettingCoefficient,Long> {
    List<BettingCoefficient> findAllByMatchesId(Long aLong);
}