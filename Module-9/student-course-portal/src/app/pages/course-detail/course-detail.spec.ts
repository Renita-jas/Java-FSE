import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';
import { beforeEach, describe, expect, it } from 'vitest';
import { of } from 'rxjs';

import { CourseDetailComponent } from './course-detail';
import { CourseService } from '../../services/course';

describe('CourseDetailComponent', () => {
  let component: CourseDetailComponent;
  let fixture: ComponentFixture<CourseDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CourseDetailComponent],
      providers: [
        {
          provide: ActivatedRoute,
          useValue: {
            snapshot: {
              paramMap: {
                get: () => '1'
              }
            }
          }
        },
        {
          provide: CourseService,
          useValue: {
            getCourseById: () => of({
              id: 1,
              name: 'Angular',
              code: 'ANG101',
              credits: 4,
              gradeStatus: 'passed',
              level: 'Beginner',
              price: 15000,
              startDate: new Date('2026-01-10'),
              duration: 3
            })
          }
        }
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(CourseDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
