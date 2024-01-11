import {Component, HostListener, OnInit} from '@angular/core';
import { ServiceService } from '../service.service';
import { PaginationService } from '../pagination.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
import {FormBuilder, FormsModule, UntypedFormGroup, Validators} from "@angular/forms";
import {Bets, Coach, Judge, MatchRequest, Season, Stadium, Team} from "../interface/interface";

@Component({
  selector: 'app-matches-view',
  templateUrl: './ticket-create.component.html',
  styleUrls: ['./ticket-create.component.css'],
})
export class TicketCreateComponent implements OnInit {
  form: UntypedFormGroup = this._formDefinition

  bets : Bets[] = []


  constructor(
    private service: ServiceService,
    private paginationService: PaginationService,
    private route: ActivatedRoute,
    private formBuilder: FormBuilder
  ) {
  }

  private get _formDefinition() {
    return this.formBuilder.group({
      bets: ['', [Validators.required]],
      stake: ['', [Validators.required]]
    });
  }


  ngOnInit(): void {
    this.service.getAllBets().subscribe((value) => this.bets = value.content)

  }

  submitForm() {
    this.service.saveTicket({bets: this.form.get('bets')!!.value,stake: this.form.get('stake')!!.value}).subscribe()
  }
}
