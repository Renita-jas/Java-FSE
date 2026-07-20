import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CourseCard } from '../../components/course-card/course-card';

@Component({
  selector: 'app-course-list',
  imports: [CommonModule, CourseCard],
  templateUrl: './course-list.html',
  styleUrl: './course-list.css'
})
export class CourseList {

  selectedCourseId:number=0;

  courses=[

    {id:1,name:'Java',code:'CS101',credits:4},

    {id:2,name:'Angular',code:'CS102',credits:3},

    {id:3,name:'Spring Boot',code:'CS103',credits:4},

    {id:4,name:'Python',code:'CS104',credits:3},

    {id:5,name:'Database',code:'CS105',credits:4}

  ];

  onEnroll(courseId:number){

      console.log("Enrolling in course:",courseId);

      this.selectedCourseId=courseId;

  }

}