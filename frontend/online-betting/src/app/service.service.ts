import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from "@angular/common/http";
import {Observable} from "rxjs";

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

  getMatchesForTeam(team: string, page: number): Observable<any> {
    const params = new HttpParams().set('page', page.toString());
    return this.http.get<any>(`api/matches/${team}`, {params});
  }

  getAllTicketStatuses(page:number): Observable<any> {
    const params = new HttpParams().set('page', page.toString());
    return this.http.get<any>(`api/ticket-status`,{params});
  }

  openTiket(tiketId: number) {
    return this.http.get<any>(`api/ticket-bets-search/${tiketId}`)
  }


}
