import {Component, HostListener, OnInit} from '@angular/core';
import { ServiceService } from '../service.service';
import { PaginationService } from '../pagination.service';
import {ActivatedRoute, ParamMap, Router} from '@angular/router';
import { switchMap } from 'rxjs/operators';
import {FormsModule} from "@angular/forms";
import {MatSnackBar} from "@angular/material/snack-bar";

@Component({
  selector: 'app-matches-view',
  templateUrl: './matches-view.component.html',
  styleUrls: ['./matches-view.component.css'],
})
export class MatchesViewComponent implements OnInit {
  data: any[] = [];
  page: number = 1;
  searchTerm: string = '';

  constructor(
    private service: ServiceService,
    private paginationService: PaginationService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.route.queryParamMap
      .pipe(
        switchMap((params: ParamMap | null) => {
          const pageParam = params?.get('page');
          const page = pageParam ? +pageParam : 1;
          this.page = page;
          this.paginationService.setCurrentPage(page);
          if (this.searchTerm) {
            return this.service.getMatchesForTeam(this.searchTerm, page);
          } else {
            return this.service.getMatches(page);
          }
        })
      )
      .subscribe((matches) => {
        this.data = matches.content;
      });
  }

  search() {
    console.log("search by team",this.searchTerm);
    this.service.getMatchesForTeam(this.searchTerm, this.page).subscribe((matches) => {
      this.data = matches.content;
    });
  }

  addMatch() {
    this.router.navigate(["/matches-create"])
  }

  addTicket() {
    this.router.navigate(["/ticket-create"])
  }

    openMatch(id: number) {
        this.router.navigate(["/open-match"],{
            queryParams: { id: id }
        })
    }
}
