import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  ReactiveFormsModule,
  FormBuilder,
  Validators,
  FormControl,
  AbstractControl,
  ValidationErrors
} from '@angular/forms';

@Component({
  selector: 'app-reactive-enrollment-form',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule
  ],
  templateUrl: './reactive-enrollment-form.html',
  styleUrl: './reactive-enrollment-form.css'
})
// Reactive forms define validation rules in the component using FormBuilder,
// FormGroup, and Validators instead of declaring them in the HTML template.
export class ReactiveEnrollmentFormComponent {

  hasUnsavedChanges = true;

  enrollForm;

  constructor(private fb: FormBuilder) {

    this.enrollForm = this.fb.group({

      studentName: [
        '',
        [Validators.required, Validators.minLength(3)]
      ],

      studentEmail: [
        '',
        [Validators.required, Validators.email],
        [this.simulateEmailCheck]
      ],

      courseId: [
        '',
        [Validators.required, this.noCourseCode]
      ],

      preferredSemester: [
        'Odd',
        Validators.required
      ],

      agreeToTerms: [
        false,
        Validators.requiredTrue
      ],

      additionalCourses: this.fb.array([])

    });

  }

  get additionalCourses() {
    return this.enrollForm.controls.additionalCourses;
  }

  addCourse() {

    this.additionalCourses.push(
      new FormControl('', Validators.required)
    );

    this.hasUnsavedChanges = true;

  }

  removeCourse(index: number) {

    this.additionalCourses.removeAt(index);

    this.hasUnsavedChanges = true;

  }

  onSubmit() {

    if (this.enrollForm.valid) {

      this.hasUnsavedChanges = false;

      alert("Enrollment Successful!");

      console.log(this.enrollForm.value);

      this.enrollForm.reset({

        preferredSemester: 'Odd',

        agreeToTerms: false

      });

      this.additionalCourses.clear();

    }

  }

  noCourseCode(control: AbstractControl): ValidationErrors | null {

    if (control.value?.startsWith('XX')) {

      return { noCourseCode: true };

    }

    return null;

  }

  simulateEmailCheck(control: AbstractControl): Promise<ValidationErrors | null> {

    return new Promise(resolve => {

      setTimeout(() => {

        if (control.value?.includes('test@')) {

          resolve({ emailTaken: true });

        } else {

          resolve(null);

        }

      }, 800);

    });

  }

}