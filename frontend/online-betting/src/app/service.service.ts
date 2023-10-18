import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  constructor(private http: HttpClient) {
  }

  getMatches(): Observable<any> {
    return this.http.get<any>('api/matches');
  }

  getAllTicketStatuses(): Observable<any> {
    return this.http.get<any>('api/ticket-status');
  }

  openTiket(tiketId: number){
    return this.http.get<any>(`api/ticket-bets-search/${tiketId}`)
  }


}
