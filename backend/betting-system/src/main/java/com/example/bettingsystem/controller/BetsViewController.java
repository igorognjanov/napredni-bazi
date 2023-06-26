package com.example.bettingsystem.controller;

import com.example.bettingsystem.repository.BetsViewRepository;
import com.example.bettingsystem.repository.MatchesRepository;
import com.example.bettingsystem.views.BetsView;
import com.example.bettingsystem.views.MatchesView;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:8080")
public class    BetsViewController {

    public BetsViewRepository betsViewRepository;
    public MatchesRepository matchesRepository;

    public BetsViewController(
            BetsViewRepository betsViewRepository,
            MatchesRepository matchesRepository) {
        this.betsViewRepository = betsViewRepository;
        this.matchesRepository = matchesRepository;
    }

    @GetMapping("/matches")
    public Page<MatchesView> getAllMatches(@RequestParam(defaultValue = "1") int page) {
        return matchesRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/bets")
    public Page<BetsView> getAllBets(@RequestParam(defaultValue = "1") int page) {
        return betsViewRepository.findAll (PageRequest.of (page, 50));
    }
}
