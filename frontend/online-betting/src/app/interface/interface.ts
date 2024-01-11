export interface Judge {
  id: number;
  firstName: string;
  lastName: string;
}

export interface Season {
  id: number;
  yearStarted: string;
  leagueName: string;
}

export interface Team {
  id: number;
  "name": string;
  "city": string;
  "league": string;
  "stadium": string;
  "yearLeague": string;
}

export interface Coach {
  id: number;
  "firstName": string;
  "lastName": string;
  "teamName": string;
}

export interface Stadium {
  id: number;
  "Name": string;
  "Location": string;
}

export interface MatchRequest {
  judge: number;
  stadium: number;
  season: number;
  homeTeam: number;
  awayTeam: number;
  date: string;
}

export interface Bets {
  id: number;
  homeTeam: string;
  awayTeam: string;
  combination: string;
  coefficient: string;
  state: string;
  result: string;
  date: string;
}

export interface TicketRequest {
  stake: number;
  bets: number[];
}
