import { Injectable } from '@angular/core';
import { Actions, createEffect, ofType } from '@ngrx/effects';
import { catchError, map, of, switchMap } from 'rxjs';
import { CourseService } from '../../services/course';
import { loadCourses, loadCoursesSuccess, loadCoursesFailure } from './course.actions';

@Injectable()
export class CourseEffects {
  loadCourses$;

  constructor(
    private actions$: Actions,
    private courseService: CourseService
  ) {
    this.loadCourses$ = createEffect(() =>
      this.actions$.pipe(
        ofType(loadCourses),
        switchMap(() =>
          this.courseService.getCourses().pipe(
            map(courses => loadCoursesSuccess({ courses })),
            catchError(error =>
              of(loadCoursesFailure({ error: error.message || 'Failed to load courses' }))
            )
          )
        )
      )
    );
  }
}
