import { Component, OnInit } from '@angular/core';

import { StudentService } from './shared/student.service';
import { PagerService } from 'app/components/students/shared/pager.service';
@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.sass'],
  providers: [StudentService, PagerService]
})
export class StudentsComponent implements OnInit {

  constructor(
    private studentService : StudentService
  ) { 
    
  }

  ngOnInit() {
  }

}
