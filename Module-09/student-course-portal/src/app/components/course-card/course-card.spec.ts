import { ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { MockStore, provideMockStore } from '@ngrx/store/testing';
import { beforeEach, describe, expect, it, vi } from 'vitest';

import { CourseCardComponent } from './course-card';
import { Course } from '../../models/course.model';
import { enrollInCourse } from '../../store/enrollment/enrollment.actions';
import { selectEnrolledIds } from '../../store/enrollment/enrollment.selectors';

describe('CourseCardComponent', () => {
  let component: CourseCardComponent;
  let fixture: ComponentFixture<CourseCardComponent>;
  let store: MockStore;

  const mockCourse: Course = {
    id: 1,
    name: 'Angular',
    code: 'ANG101',
    credits: 4,
    gradeStatus: 'passed',
    level: 'Beginner',
    price: 15000,
    startDate: new Date('2026-01-10'),
    duration: 3
  };

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CourseCardComponent],
      providers: [provideMockStore({ selectors: [{ selector: selectEnrolledIds, value: [] }] })]
    }).compileComponents();

    store = TestBed.inject(MockStore);
    fixture = TestBed.createComponent(CourseCardComponent);
    component = fixture.componentInstance;
    component.course = mockCourse;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should render course input data', () => {
    const title = fixture.nativeElement.querySelector('h2')?.textContent?.trim();
    const code = fixture.nativeElement.querySelector('p')?.textContent?.trim();

    expect(title).toBe('Angular');
    expect(code).toBe('ANG101');
  });

  it('should emit enrollRequested and dispatch enroll action when the button is clicked', () => {
    const dispatchSpy = vi.spyOn(store, 'dispatch');
    const emitSpy = vi.spyOn(component.enrollRequested, 'emit');
    const button = fixture.debugElement.query(By.css('button')).nativeElement;

    button.click();

    expect(dispatchSpy).toHaveBeenCalledWith(enrollInCourse({ courseId: 1 }));
    expect(emitSpy).toHaveBeenCalledWith(1);
  });

  it('should update the rendered course data when the input changes', () => {
    component.course = { ...mockCourse, name: 'React', code: 'REA101' };
    fixture.componentRef.setInput('course', component.course);
    fixture.detectChanges();

    const title = fixture.nativeElement.querySelector('h2')?.textContent?.trim();
    const code = fixture.nativeElement.querySelector('p')?.textContent?.trim();

    expect(title).toBe('React');
    expect(code).toBe('REA101');
  });
});
