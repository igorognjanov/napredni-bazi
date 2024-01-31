import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";
import {Coach, Judge, MatchRequest, Season, Stadium, Team, TicketRequest} from "./interface/interface";

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http: HttpClient) {
  }

  getMatches(page: number): Observable<any> {
    const params = new HttpParams().set('page', page.toString());
    return this.http.get<any>(`api/matches`, {params});
  }

  getMatch(id: any): Observable<any> {
    return this.http.get<any>(`api/match/${id}`);
  }

  updateMatchStatus(id: any, state: any): Observable<any> {
    return this.http.put<any>(`api/match/${id}`, state);
  }

  getMatchesForTeam(team: string, page: number): Observable<any> {
    const params = new HttpParams().set('page', page.toString());
    return this.http.get<any>(`api/matches/team/${team}`, {params});
  }

  getAllTicketStatuses(page:number): Observable<any> {
    const params = new HttpParams().set('page', page.toString());
    return this.http.get<any>(`api/ticket-status`,{params});
  }

  openTiket(tiketId: number) {
    return this.http.get<any>(`api/ticket-bets-search/${tiketId}`)
  }

  getAllJudges(): Observable<any>{
    return this.http.get<any>(`api/judges-list`)
  }

  getAllCoaches(): Observable<any>{
    return this.http.get<any>(`api/coaches-list`)
  }

  getAllTeams(): Observable<any>{
    return this.http.get<any>(`api/teams-list`)
  }

  getAllSeasons(): Observable<any>{
    return this.http.get<any>(`api/seasons-list`)
  }

  getAllStadiums(): Observable<any>{
    return this.http.get<any>(`api/stadium-list`)
  }

  getAllBets(): Observable<any>{
    return this.http.get<any>(`api/bets`)
  }
  // judge,stadium, seasson, homeTeam,awayTeam, date
  saveMatch(request:MatchRequest){
  return this.http.post<any>(`api/match`,request)
}

  saveTicket(request:TicketRequest){
  return this.http.post<any>(`api/ticket`,request)
}

  getTicket(id:number):Observable<any>{
  return this.http.get(`api/ticket/${id}`)
}

}
