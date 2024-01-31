import {Component, HostListener, OnInit} from '@angular/core';
import {ServiceService} from '../service.service';
import {PaginationService} from '../pagination.service';
import {ActivatedRoute, ParamMap} from '@angular/router';
import {switchMap, tap} from 'rxjs/operators';
import {FormBuilder, FormsModule, UntypedFormGroup, Validators} from "@angular/forms";
import {Coach, Judge, MatchRequest, Season, Stadium, Team} from "../interface/interface";
import {of} from "rxjs";
import {MatSnackBar} from "@angular/material/snack-bar";

@Component({
  selector: 'app-update-match',
  templateUrl: './update-match.component.html',
  styleUrls: ['./update-match.component.css'],
})
export class UpdateMatchComponent implements OnInit {
  form: UntypedFormGroup = this._formDefinition

  match: any
  id: number = 0

  constructor(
    private service: ServiceService,
    private paginationService: PaginationService,
    private route: ActivatedRoute,
    private formBuilder: FormBuilder,
    private _snackBar: MatSnackBar
  ) {
    this.route.queryParamMap
      .pipe(
        switchMap((params: ParamMap | null) => {
          const id = params?.get('id');
          return id ? service.getMatch(+id) : of();
        })
      ).subscribe((match) => {
        this.match = match;
        this.id = match.id
      });
  }

  private get _formDefinition() {
    return this.formBuilder.group({
      // result: ['', [Validators.required]],
      status: ['', [Validators.required]]
    });
  }


  ngOnInit(): void {
  }

  submitForm() {
    this.service.updateMatchStatus(this.match.id, this.form.get('status')?.value).subscribe({
        next: () => {
          this._snackBar.open("Successfully saved", "Close", {
            duration: 2000, // Duration in milliseconds
          });
          this.form.reset()
          this.service.getMatch(this.id).subscribe((match) => {
            this.match = match;
          });
        },
        error:()=>{
          this._snackBar.open("Error", "Close", {
            duration: 2000, // Duration in milliseconds
          });
        }
      }
    )
    // this._snackBar.open("TEST", "TEST2", {
    //   duration: 2000, // Duration in milliseconds
    // });
  }
}
