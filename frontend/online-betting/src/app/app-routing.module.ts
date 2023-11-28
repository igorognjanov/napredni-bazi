import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {MatchesViewComponent} from "./matches-view/matches-view.component";
import {TiketsStatusComponent} from "./tikets-status/tikets-status.component";
import {TicketBetComponent} from "./ticket-bet/ticket-bet.component";
import {HomeComponent} from "./home/home.component";
import {MatPaginatorModule} from "@angular/material/paginator";

const routes: Routes = [
  {path: 'matches-view', component: MatchesViewComponent},
  {path: 'tikets-status', component: TiketsStatusComponent},
  {path: 'tiket-bets/:id', component: TicketBetComponent},
  {path: '**', component: HomeComponent}
]

@NgModule({
  imports: [RouterModule.forRoot(routes), MatPaginatorModule],
  exports: [RouterModule]
})

export class AppRoutingModule {
}
