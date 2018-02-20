import { Component, OnInit } from '@angular/core';
import { StudentService } from '../shared/student.service';

@Component({
  selector: 'app-student-details',
  templateUrl: './student-details.component.html',
  styleUrls: ['./student-details.component.sass']
})
export class StudentDetailsComponent implements OnInit {

  constructor(private studentService: StudentService) { }

  ngOnInit() {
    this.studentService.getStudentDetail(1);
  }

}
