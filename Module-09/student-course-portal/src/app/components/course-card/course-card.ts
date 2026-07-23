import { Component, EventEmitter, Input, OnInit, Output, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HighlightDirective } from '../../directives/highlight';
import { DurationPipe } from '../../pipes/duration-pipe';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';
import { enrollInCourse, unenrollFromCourse } from '../../store/enrollment/enrollment.actions';
import { selectEnrolledIds } from '../../store/enrollment/enrollment.selectors';

@Component({
  selector: 'app-course-card',
  standalone: true,
  imports: [
    CommonModule,
    HighlightDirective,
    DurationPipe
  ],
  templateUrl: './course-card.html',
  styleUrl: './course-card.css'
})
export class CourseCardComponent implements OnInit {

  @Input() course: any;
  @Output() enrollRequested = new EventEmitter<number>();

  private store = inject(Store) as Store<any>;

  enrolledIds$!: Observable<number[]>;

  ngOnInit() {
    this.enrolledIds$ = this.store.select(selectEnrolledIds);
  }

  enroll() {
    this.store.dispatch(enrollInCourse({ courseId: this.course.id }));
    this.enrollRequested.emit(this.course.id);
  }

  unenroll() {
    this.store.dispatch(unenrollFromCourse({ courseId: this.course.id }));
  }

  get cardClasses() {
    return {
      beginner: this.course?.level === 'Beginner',
      intermediate: this.course?.level === 'Intermediate',
      advanced: this.course?.level === 'Advanced'
    };
  }
}