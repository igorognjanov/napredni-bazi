import {Component, HostListener, OnInit} from '@angular/core';
import {ServiceService} from '../service.service';
import {PaginationService} from '../pagination.service';
import {ActivatedRoute, ParamMap} from '@angular/router';
import {switchMap} from 'rxjs/operators';
import {FormBuilder, FormsModule, UntypedFormGroup, Validators} from "@angular/forms";
import {Coach, Judge, MatchRequest, Season, Stadium, Team} from "../interface/interface";

@Component({
  selector: 'app-matches-view',
  templateUrl: './matches-create.component.html',
  styleUrls: ['./matches-create.component.css'],
})
export class MatchesCreateComponent implements OnInit {
  form: UntypedFormGroup = this._formDefinition

  judges: Judge[] = []
  seasons: Season[] = []
  teams: Team[] = []
  coaches: Coach[] = []
  stadiums: Stadium[] = []

  constructor(
    private service: ServiceService,
    private paginationService: PaginationService,
    private route: ActivatedRoute,
    private formBuilder: FormBuilder
  ) {
  }

  private get _formDefinition() {
    return this.formBuilder.group({
      homeTeam: ['', [Validators.required]],
      awayTeam: ['', [Validators.required]],
      stadium: ['', [Validators.required]],
      season: ['', [Validators.required]],
      judge: ['', [Validators.required]],
      date: ['', Validators.required],
      // league: ['', Validators.required],
      // leagueYear: ['', Validators.required]
    });
  }


  ngOnInit(): void {
    this.service.getAllJudges().subscribe((value) => this.judges = value.content)
    this.service.getAllSeasons().subscribe((value) => this.seasons = value.content)
    this.service.getAllTeams().subscribe((value) => {
      this.teams = value.content
      console.log(value.content)
    })
    this.service.getAllCoaches().subscribe((value) => this.coaches = value.content)
    this.service.getAllStadiums().subscribe((value) => this.stadiums = value.content)
    // this.route.queryParamMap
    //   .pipe(
    //     switchMap((params: ParamMap | null) => {
    //       const pageParam = params?.get('page');
    //       const page = pageParam ? +pageParam : 1;
    //       this.page = page;
    //       this.paginationService.setCurrentPage(page);
    //       if (this.searchTerm) {
    //         return this.service.getMatchesForTeam(this.searchTerm, page);
    //       } else {
    //         return this.service.getMatches(page);
    //       }
    //     })
    //   )
    //   .subscribe((matches) => {
    //     this.data = matches.content;
    //   });
  }

  // @HostListener('window:scroll', ['$event'])
  // onScroll(event): void {
  //   // Load more options when the user scrolls to the bottom
  //   const scrollPosition = window.innerHeight + window.scrollY;
  //   const documentHeight = document.documentElement.offsetHeight;
  //
  //   if (scrollPosition >= documentHeight && !this.isLoading) {
  //     this.loadOptions();
  //   }
  // }

  submitForm() {
    console.log(this.form)
    const matchRequest: MatchRequest = {
      judge: this.form.get('judge')!!.value,
      stadium: this.form.get('stadium')!!.value,
      season: this.form.get('season')!!.value,
      homeTeam: this.form.get('homeTeam')!!.value,
      awayTeam: this.form.get('awayTeam')!!.value,
      date: this.form.get('date')!!.value,
    };
    this.service.saveMatch(matchRequest).subscribe()
  }
}
