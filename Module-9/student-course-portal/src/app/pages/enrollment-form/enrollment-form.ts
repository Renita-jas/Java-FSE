import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, NgForm } from '@angular/forms';

@Component({
  selector: 'app-enrollment-form',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule
  ],
  templateUrl: './enrollment-form.html',
  styleUrl: './enrollment-form.css'
})
// Template-driven forms use directives like ngModel and NgForm.
// Validation rules are declared in the HTML template.
export class EnrollmentFormComponent {

  student = {

    studentName: '',

    studentEmail: '',

    courseId: '',

    preferredSemester: 'Odd',

    agreeToTerms: false

  };

  submit(form: NgForm) {

    console.log(form.value);

    alert("Enrollment Successful!");

    form.resetForm();

  }

}