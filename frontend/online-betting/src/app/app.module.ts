import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MatchesViewComponent } from './matches-view/matches-view.component';
import {HttpClientModule} from "@angular/common/http";
import { TiketsStatusComponent } from './tikets-status/tikets-status.component';

@NgModule({
  declarations: [
    AppComponent,
    MatchesViewComponent,
    TiketsStatusComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
