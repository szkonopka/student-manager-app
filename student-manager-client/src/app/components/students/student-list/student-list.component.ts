import { Component, OnInit } from '@angular/core';

import { StudentService } from '../shared/student.service';
import { Student } from '../shared/student.model';
import { PagerService } from '../shared/pager.service';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.sass']
})
export class StudentListComponent implements OnInit {

  constructor(private studentService : StudentService) { }

  ngOnInit() {
    this.studentService.getStudentList();
  }

  showForEdit(student: Student) {
    this.studentService.selectedStudent = Object.assign({}, student);
  }

  onDelete(id: number) {
    if(confirm("Are you sure?") == true) {
      this.studentService.deleteStudent(id).
      subscribe(x => {
        this.studentService.getStudentList();
      });
    }
  }

  showStudentDetails(id: number) {
    this.studentService.getStudentDetail(id);
  }

}
