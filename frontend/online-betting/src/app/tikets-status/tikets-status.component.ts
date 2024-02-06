import {Component, OnInit} from '@angular/core';
import {ServiceService} from "../service.service";
import {ActivatedRoute, NavigationExtras, ParamMap, Route, Router} from "@angular/router";
import {switchMap} from "rxjs/operators";
import {PaginationService} from "../pagination.service";
import {EMPTY} from "rxjs";

@Component({
  selector: 'app-tikets-status',
  templateUrl: './tikets-status.component.html',
  styleUrls: ['./tikets-status.component.css']
})
export class TiketsStatusComponent implements OnInit {
  data: any;
  searchUsername: string = '';
  page: number = 1;

  constructor(private service: ServiceService,
              private router: Router,
              private paginationService: PaginationService,
              private route: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.route.queryParamMap
      .pipe(
        switchMap((params: ParamMap | null) => {
          const pageParam = params?.get('page');
          const page = pageParam ? +pageParam : 1;
          this.page = page;
          this.paginationService.setCurrentPage(page);
          if (this.searchUsername) {
            return EMPTY;
          } else {
            return this.service.getAllTicketStatuses(page);
          }
        })
      )
      .subscribe((tikets) => {
        this.data = tikets.content;
      });
  }

  openTiket(tiketId: number) {
    this.router.navigate(['/tiket-bets', tiketId]);
  }

  addTicket() {
    this.router.navigate(["/ticket-create"])
  }


}
