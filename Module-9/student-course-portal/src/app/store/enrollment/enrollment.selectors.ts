import { createFeatureSelector, createSelector } from '@ngrx/store';
import { EnrollmentState } from './enrollment.reducer';
import { CourseState, courseFeatureKey } from '../course/course.reducer';
import { selectAllCourses } from '../course/course.selectors';

export const enrollmentFeatureKey = 'enrollment';

export const selectEnrollmentState = createFeatureSelector<EnrollmentState>(enrollmentFeatureKey);

export const selectEnrolledIds = createSelector(
  selectEnrollmentState,
  state => state.enrolledCourseIds
);

export const selectEnrolledCourses = createSelector(
  selectAllCourses,
  selectEnrolledIds,
  (courses, enrolledIds) => courses.filter(course => enrolledIds.includes(course.id))
);
