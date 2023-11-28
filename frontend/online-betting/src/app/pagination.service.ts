import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class PaginationService {
  private currentPageSubject: Subject<number> = new Subject<number>();

  // currentPage$: Observable<number> = this.currentPageSubject.asObservable();

  constructor(private router: Router, private route: ActivatedRoute) {}

  setCurrentPage(page: number) {
    this.currentPageSubject.next(page);
    this.updateQueryParam('page', page);
  }

  private updateQueryParam(key: string, value: any) {
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: { [key]: value },
      queryParamsHandling: 'merge',
    });
  }
}
