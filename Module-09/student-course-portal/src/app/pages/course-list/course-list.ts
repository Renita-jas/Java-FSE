import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { Store } from '@ngrx/store';
import { Observable } from 'rxjs';

import { CourseCardComponent } from '../../components/course-card/course-card';
import { Course } from '../../models/course.model';
import { loadCourses } from '../../store/course/course.actions';
import { selectAllCourses, selectCoursesLoading, selectCoursesError } from '../../store/course/course.selectors';
import { enrollInCourse, unenrollFromCourse } from '../../store/enrollment/enrollment.actions';
import { selectEnrolledIds } from '../../store/enrollment/enrollment.selectors';

@Component({
  selector: 'app-course-list',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    CourseCardComponent
  ],
  templateUrl: './course-list.html',
  styleUrl: './course-list.css'
})
export class CourseListComponent implements OnInit {

  private store = inject(Store) as Store<any>;

  courses$!: Observable<Course[]>;
  loading$!: Observable<boolean>;
  error$!: Observable<string | null>;
  enrolledIds$!: Observable<number[]>;

  ngOnInit(): void {
    this.courses$ = this.store.select(selectAllCourses);
    this.loading$ = this.store.select(selectCoursesLoading);
    this.error$ = this.store.select(selectCoursesError);
    this.enrolledIds$ = this.store.select(selectEnrolledIds);

    this.store.dispatch(loadCourses());
  }

  enroll(id: number) {
    this.store.dispatch(enrollInCourse({ courseId: id }));
  }

  unenroll(id: number) {
    this.store.dispatch(unenrollFromCourse({ courseId: id }));
  }

}