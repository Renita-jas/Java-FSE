import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EnrollmentService {

  private enrolledCourses: number[] = [];

  enroll(courseId: number): void {

    if (!this.enrolledCourses.includes(courseId)) {
      this.enrolledCourses.push(courseId);
    }

  }

  getEnrollments(): number[] {
    return this.enrolledCourses;
  }

}