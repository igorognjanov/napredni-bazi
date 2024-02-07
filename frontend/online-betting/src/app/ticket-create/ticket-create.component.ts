import {Component, HostListener, OnInit} from '@angular/core';
import { ServiceService } from '../service.service';
import { PaginationService } from '../pagination.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
import {FormBuilder, FormsModule, UntypedFormGroup, Validators} from "@angular/forms";
import {Bets, Coach, Judge, MatchRequest, Season, Stadium, Team} from "../interface/interface";
import {MatSnackBar} from "@angular/material/snack-bar";

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
    private formBuilder: FormBuilder,
    private _snackBar: MatSnackBar
  ) {
  }

  private get _formDefinition() {
    return this.formBuilder.group({
      bets: ['', [Validators.required]],
      stake: ['', [Validators.required]]
    });
  }


  ngOnInit(): void {
    this.service.getAllBets().subscribe((value) => this.bets = value)

  }

  submitForm() {
    this.service.saveTicket({bets: this.form.get('bets')!!.value,stake: this.form.get('stake')!!.value}).subscribe({
        next: () => {
          this._snackBar.open("Successfully saved", "Close", {
            duration: 2000, // Duration in milliseconds
          });
          this.form.reset()
        },
        error:()=>{
          this._snackBar.open("Error", "Close", {
            duration: 2000, // Duration in milliseconds
          });
        }
      }
    )
  }
}
