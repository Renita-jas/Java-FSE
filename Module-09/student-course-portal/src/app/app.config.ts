import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';
import { provideStore, provideState } from '@ngrx/store';
import { provideEffects } from '@ngrx/effects';
import { provideStoreDevtools } from '@ngrx/store-devtools';

import { routes } from './app.routes';
import { courseFeatureKey, courseReducer } from './store/course/course.reducer';
import { CourseEffects } from './store/course/course.effects';
import { enrollmentFeatureKey, enrollmentReducer } from './store/enrollment/enrollment.reducer';

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection(),
    provideRouter(routes),
    provideHttpClient(),
    // root store and register feature states via provideState
    provideStore(),
    provideState(courseFeatureKey, courseReducer),
    provideState(enrollmentFeatureKey, enrollmentReducer),
    provideEffects([CourseEffects]),
    provideStoreDevtools({ maxAge: 25 })
  ]
};