import { Component, OnInit } from '@angular/core';
import { NgForm } from "@angular/forms";
import { StudentService } from '../shared/student.service';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.sass']
})
export class StudentComponent implements OnInit {
  
  constructor(private studentService : StudentService) { }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form? : NgForm) {
    if(form != null)
      form.reset();
    this.studentService.selectedStudent = {
      ID : null, 
      Name : '', 
      Surname : '', 
      DateOfBirth : null, 
      City : ''
    }
  }

onSubmit(form : NgForm) {
    console.log(form.value);
    if(form.value.ID == null) {
      this.studentService.postStudent(form.value)
      .subscribe(data => {
        this.resetForm(form);
        this.studentService.getStudentList();
      });
    } else {
      this.studentService.putStudent(form.value, form.value.ID)
      .subscribe(data => {
        this.resetForm(form);
        this.studentService.getStudentList();
      });
    }
  }
}
