import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-student-profile',
  imports: [CommonModule],
  templateUrl: './student-profile.html',
  styleUrl: './student-profile.css',
})
export class StudentProfile {
  student = {
    name: 'Ava Thompson',
    email: 'ava.thompson@studentportal.com',
    major: 'Computer Science',
    semester: '6th Semester',
    joinDate: 'January 2024',
    bio: 'An enthusiastic learner focused on modern web development, UI design, and practical project work.'
  };

  highlights = [
    'Completed 12 courses',
    'Average grade: A',
    'Enrolled in 3 active programs'
  ];
}
