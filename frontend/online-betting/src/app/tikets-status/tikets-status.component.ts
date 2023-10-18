import {Component, OnInit} from '@angular/core';
import {ServiceService} from "../service.service";
import {NavigationExtras, Route, Router} from "@angular/router";

@Component({
  selector: 'app-tikets-status',
  templateUrl: './tikets-status.component.html',
  styleUrls: ['./tikets-status.component.css']
})
export class TiketsStatusComponent implements OnInit {
  data: any[] = [];


  constructor(private service: ServiceService,
              private router:Router) {
  }

  ngOnInit(): void {
    this.service.getAllTicketStatuses().subscribe(
      matches => {
        this.data = matches.content;
      }
    );
  }

  openTiket(tiketId: number) {
    this.router.navigate(['/tiket-bets', tiketId]);
  }


}
