import { Routes } from '@angular/router';

import { Home } from './pages/home/home';
import { CourseListComponent } from './pages/course-list/course-list';
import { CourseDetailComponent } from './pages/course-detail/course-detail';
import { EnrollmentFormComponent } from './pages/enrollment-form/enrollment-form';
import { ReactiveEnrollmentFormComponent } from './pages/reactive-enrollment-form/reactive-enrollment-form';
import { StudentProfile } from './pages/student-profile/student-profile';

import { authGuard } from './guards/auth-guard';
import { unsavedChangesGuard } from './guards/unsaved-changes-guard';

export const routes: Routes = [

  {
    path: '',
    component: Home
  },

  {
    path: 'courses',
    component: CourseListComponent,
    canActivate: [authGuard]
  },

  {
    path: 'courses/:id',
    component: CourseDetailComponent,
    canActivate: [authGuard]
  },

  {
    path: 'enroll',
    component: EnrollmentFormComponent
  },

  {
    path: 'enroll-reactive',
    component: ReactiveEnrollmentFormComponent,
    canDeactivate: [unsavedChangesGuard]
  },

  {
    path: 'profile',
    component: StudentProfile,
    canActivate: [authGuard]
  },

  {
    path: '**',
    redirectTo: ''
  }

];