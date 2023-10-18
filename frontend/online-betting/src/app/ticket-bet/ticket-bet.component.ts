import {Component, OnInit} from '@angular/core';
import {ActivatedRoute} from "@angular/router";
import {ServiceService} from "../service.service";

@Component({
  selector: 'app-ticket-bet',
  templateUrl: './ticket-bet.component.html',
  styleUrls: ['./ticket-bet.component.css']
})
export class TicketBetComponent implements OnInit {

  id: number = 0;

  tiket: any;

  constructor(private route: ActivatedRoute,
              private service: ServiceService) {
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.id = +params['id'];
    });
    this.service.openTiket(this.id).subscribe(data => {
      console.log(data)
      this.tiket = data
    });
  }
}
