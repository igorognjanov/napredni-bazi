package com.example.bettingsystem.controller;

import com.example.bettingsystem.repository.*;
import com.example.bettingsystem.views.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
@CrossOrigin("https://localhost:8080")
public class BetsViewController {

    public BetsViewRepository betsViewRepository;
    public CoachesViewRepository coachesViewRepository;
    public JudgesViewRepository judgesViewRepository;
    public MatchesRepository matchesRepository;
    public PlayersViewRepository playersViewRepository;
    public SeasonsViewRepository seasonsViewRepository;
    public TeamsViewRepository teamsViewRepository;
    public TicketBetViewRepository ticketBetViewRepository;
    public TicketStatusViewRepository ticketStatusViewRepository;
    public UserViewRepository userViewRepository;

    public BetsViewController(
            BetsViewRepository betsViewRepository,
            CoachesViewRepository coachesViewRepository,
            JudgesViewRepository judgesViewRepository,
            MatchesRepository matchesRepository,
            PlayersViewRepository playersViewRepository,
            SeasonsViewRepository seasonsViewRepository,
            TeamsViewRepository teamsViewRepository,
            TicketBetViewRepository ticketBetViewRepository,
            TicketStatusViewRepository ticketStatusViewRepository,
            UserViewRepository userViewRepository
            ) {
        this.betsViewRepository = betsViewRepository;
        this.coachesViewRepository = coachesViewRepository;
        this.judgesViewRepository = judgesViewRepository;
        this.matchesRepository = matchesRepository;
        this.playersViewRepository = playersViewRepository;
        this.seasonsViewRepository = seasonsViewRepository;
        this.teamsViewRepository = teamsViewRepository;
        this.ticketBetViewRepository = ticketBetViewRepository;
        this.ticketStatusViewRepository = ticketStatusViewRepository;
        this.userViewRepository = userViewRepository;
    }

    @GetMapping("/matches")
    public Page<MatchesView> getAllMatches(@RequestParam(defaultValue = "1") int page) {
        return matchesRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/coaches")
    public Page<CoachesView> getAllCoaches(@RequestParam(defaultValue = "1") int page) {
        return coachesViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/judges")
    public Page<JudgesView> getAllJudges(@RequestParam(defaultValue = "1") int page) {
        return judgesViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/bets")
    public Page<BetsView> getAllBets(@RequestParam(defaultValue = "1") int page) {
        return betsViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/players")
    public Page<PlayersView> getAllPlayers(@RequestParam(defaultValue = "1") int page) {
        return playersViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/seasons")
    public Page<SeasonsView> getAllSeasons(@RequestParam(defaultValue = "1") int page) {
        return seasonsViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/teams")
    public Page<TeamsView> getAllTeams(@RequestParam(defaultValue = "1") int page) {
        return teamsViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/ticket-bets")
    public Page<TicketBetView> getAllTicketBets(@RequestParam(defaultValue = "1") int page) {
        return ticketBetViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/ticket-status")
    public Page<TicketStatusView> getAllTicketStatus(@RequestParam(defaultValue = "1") int page) {
        return ticketStatusViewRepository.findAll (PageRequest.of (page, 50));
    }

    @GetMapping("/users")
    public Page<UsersView> getAllUsers(@RequestParam(defaultValue = "1") int page) {
        return userViewRepository.findAll (PageRequest.of (page, 50));
    }

}
