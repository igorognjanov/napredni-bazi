import {Component, Input, OnInit} from '@angular/core';
import {ServiceService} from "../service.service";
import {HttpClient} from "@angular/common/http";

@Component({
  selector: 'app-matches-view',
  templateUrl: './matches-view.component.html',
  styleUrls: ['./matches-view.component.css']
})
export class MatchesViewComponent implements OnInit {


  data: any[] = [];
  constructor(private service: ServiceService,
              private http: HttpClient) {
  }

  ngOnInit(): void {
    this.service.getMatches().subscribe(
      matches => {
        this.data = matches.content;
      }
    );
  }

  protected readonly matchMedia = matchMedia;
}
