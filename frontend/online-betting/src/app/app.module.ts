import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {MatchesViewComponent} from './matches-view/matches-view.component';
import {HttpClientModule} from "@angular/common/http";
import {TiketsStatusComponent} from './tikets-status/tikets-status.component';
import {TicketBetComponent} from './ticket-bet/ticket-bet.component';
import {HomeComponent} from './home/home.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {MatPaginatorModule} from "@angular/material/paginator";
import {PaginationComponent} from './pagination/pagination.component';
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import { NavComponent } from './nav/nav.component';
import {MatchesCreateComponent} from "./matches-create/matches-create.component";
import {TicketCreateComponent} from "./ticket-create/ticket-create.component";

@NgModule({
  declarations: [
    AppComponent,
    MatchesViewComponent,
    TiketsStatusComponent,
    TicketBetComponent,
    HomeComponent,
    PaginationComponent,
    NavComponent,
    MatchesCreateComponent,
    TicketCreateComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MatPaginatorModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
