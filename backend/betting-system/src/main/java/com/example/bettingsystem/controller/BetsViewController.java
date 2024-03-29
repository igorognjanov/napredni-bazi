package com.example.bettingsystem.controller;

import com.example.bettingsystem.repository.*;
import com.example.bettingsystem.request.MatchRequest;
import com.example.bettingsystem.request.TicketRequest;
import com.example.bettingsystem.views.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
@CrossOrigin("https://localhost:8080")
public class BetsViewController {

    public TicketBetRepository ticketBetRepository;
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
    public StadiumViewRepository stadiumViewRepository;
    public MatchRepository matchRepository;
    public BettingCoefficientsRepository bettingCoefficientsRepository;

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
            UserViewRepository userViewRepository,
            TicketBetRepository ticketBetRepository,
            StadiumViewRepository stadiumViewRepository,
            MatchRepository matchRepository,
            BettingCoefficientsRepository bettingCoefficientsRepository
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
        this.ticketBetRepository = ticketBetRepository;
        this.stadiumViewRepository = stadiumViewRepository;
        this.matchRepository = matchRepository;
        this.bettingCoefficientsRepository = bettingCoefficientsRepository;
    }

    @GetMapping("/matches")
    public Page<MatchesView> getAllMatches(@RequestParam(defaultValue = "1") int page) {
        return matchesRepository.findAll(PageRequest.of(page - 1, 50,  Sort.by(Sort.Order.desc("id"))));
    }

    @GetMapping("/match/{id}")
    public Optional<MatchesView> getMatcheById(@PathVariable Long id) {
        return matchesRepository.findById(id);
    }

    @PutMapping("/match/{id}")
    public void updateState(@PathVariable Long id, @RequestBody String state) {
        Match match = matchRepository.findById(id).get();
        match.result = state;
        matchRepository.save(match);
        List<Long> betComb = this.bettingCoefficientsRepository.findAllByMatchesId(id).stream().map(BettingCoefficient::getId).collect(Collectors.toList());

        ticketBetRepository.findAllByBettingCoefficientsIdIn(betComb)
                .stream()
                .map(TicketBet::getTiketId)
                .forEach(ticketId -> ticketBetViewRepository.callTicketBetsSearch(ticketId));
    }

//    @GetMapping("/matches/{search-string}")
//    public Page<MatchesView> searchMatches(@RequestParam(defaultValue = "1") int page, @PathVariable(value = "search-string") String text) {
//        return matchesRepository.findAllByAwayTeamOrHomeTeam(text, PageRequest.of(page-1, 50));
//    }

//    @GetMapping("/matches/team-like/{team}")
//    public List<MatchesView> findAllMatchesByTeamNameLike(@PathVariable(value = "team")){
//        List<Long> teamsIds = teamRepository.findAll();
//    }

    @PostMapping("/match")
    public void saveMatch(@RequestBody MatchRequest request) {
        matchesRepository.insertMatchFunction(request.judge, request.stadium, request.season, request.homeTeam, request.awayTeam, request.date);
    }

    @PostMapping("/ticket")
    public void saveTicket(@RequestBody TicketRequest request) {
//        Integer odd = betsViewRepository.findAllByIdIn(request.bets).stream().map(betsView -> betsView.coefficient).reduce(1.0,(a, b) -> a * b).intValue();
        Integer tiketId = ticketBetRepository.insertTicketFunction(request.stake, 0, 0, 5);
        for (Integer bet :
                request.bets) {
            ticketBetRepository.insertTicketBetFunction(tiketId, bet);
        }
    }


    @GetMapping("/matches/team/{team}")
    public Page<MatchesView> getAllMatchesForTeam(@PathVariable(value = "team") String team,
                                                  @RequestParam(defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 50); // Subtract 1 from page because it is 0-based
        return matchesRepository.findAllByHomeTeamLikeOrAwayTeamLike(team, team, pageable);
    }


    @GetMapping("/coaches")
    public Page<CoachesView> getAllCoaches(@RequestParam(defaultValue = "1") int page) {
        return coachesViewRepository.findAll(PageRequest.of(page - 1, 50));
    }

    @GetMapping("/judges")
    public Page<JudgesView> getAllJudges(@RequestParam(defaultValue = "1") int page) {
        return judgesViewRepository.findAll(PageRequest.of(page - 1, 50));
    }

    @GetMapping("/bets")
    public List<BetsView> getAllBets(@RequestParam(defaultValue = "1") int page) {
//        return betsViewRepository.findAll(PageRequest.of(page-1, 50));
        return betsViewRepository.findAll(Sort.by(Sort.Order.desc("id")));
    }

    @GetMapping("/players")
    public Page<PlayersView> getAllPlayers(@RequestParam(defaultValue = "1") int page) {
        return playersViewRepository.findAll(PageRequest.of(page - 1, 50));
    }

    @GetMapping("/seasons")
    public Page<SeasonsView> getAllSeasons(@RequestParam(defaultValue = "1") int page) {
        return seasonsViewRepository.findAll(PageRequest.of(page - 1, 50));
    }

    @GetMapping("/teams")
    public List<TeamsView> getAllTeams(@RequestParam(defaultValue = "1") int page) {
        return teamsViewRepository.findAll();
    }

    @GetMapping("/teams-list")
    public List<TeamsView> getAllTeamsList() {
//        Pageable pageable = PageRequest.of(1, 10);
        return teamsViewRepository.findAll();
    }

    @GetMapping("/judges-list")
    public Page<JudgesView> getAllJudgesList() {
        Pageable pageable = PageRequest.of(1, 20);
        return judgesViewRepository.findAll(pageable);
    }

    @GetMapping("/coaches-list")
    public Page<CoachesView> getAllCoachesList() {
        Pageable pageable = PageRequest.of(1, 20);
        return coachesViewRepository.findAll(pageable);
    }

    @GetMapping("/seasons-list")
    public List<SeasonsView> getAllSeasonList() {
        return seasonsViewRepository.findAllByYearStarted("2022");
    }

    @GetMapping("/stadium-list")
    public Page<StadiumView> getAllStadiumList(@RequestParam(defaultValue = "1") int page) {
        return stadiumViewRepository.findAll(PageRequest.of(page - 1, 20));
    }

    @GetMapping("/ticket-bets")
    public Page<TicketBetView> getAllTicketBets(@RequestParam(defaultValue = "1") int page) {
        return ticketBetViewRepository.findAll(PageRequest.of(page-1, 50, Sort.by(Sort.Order.desc("id"))));
    }

    @GetMapping("/ticket-status")
    public Page<TicketStatusView> getAllTicketStatus(@RequestParam(defaultValue = "1") int page) {
        return ticketStatusViewRepository.findAll(PageRequest.of(page - 1, 50));
    }

    @GetMapping("/ticket/{id}")
    public Optional<TicketStatusView> getTicketById(@PathVariable Long id) {
        return ticketStatusViewRepository.findById(id);
    }

    @GetMapping("/users")
    public Page<UsersView> getAllUsers(@RequestParam(defaultValue = "1") int page) {
        return userViewRepository.findAll(PageRequest.of(page - 1, 50));
    }

    @GetMapping("/ticket-bets-search/{id}")
    public List<TicketBetView> getTicketBetsForTiket(@PathVariable("id") Long id) {
        ticketBetViewRepository.callTicketBetsSearch(id);
        List<TicketBet> ticketBets = ticketBetRepository.findByTiketId(id);
        List<Long> tiketBetIds = ticketBets.stream().map(TicketBet::getId).collect(Collectors.toList());
        return ticketBetViewRepository.findAllByIdIn(tiketBetIds);
    }

}
