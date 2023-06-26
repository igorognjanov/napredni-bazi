import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {MatchesViewComponent} from "./matches-view/matches-view.component";

const routes: Routes = [
  {path: 'matches-view', component: MatchesViewComponent},
  {path: '**', component: MatchesViewComponent}
]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule {
}
