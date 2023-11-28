import { Component, Input } from '@angular/core';
import { PaginationService } from '../pagination.service';

@Component({
  selector: 'app-pagination',
  templateUrl: './pagination.component.html',
  styleUrls: ['./pagination.component.css'],
})
export class PaginationComponent {
  @Input() currentPage: number = 1;

  constructor(private paginationService: PaginationService) {}

  nextPage() {
    this.currentPage++;
    this.paginationService.setCurrentPage(this.currentPage);
  }

  prevPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.paginationService.setCurrentPage(this.currentPage);
    }
  }
}
