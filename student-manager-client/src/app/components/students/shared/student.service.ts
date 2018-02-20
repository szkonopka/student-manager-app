import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions, RequestMethod } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import { Student } from './student.model';
import { StudentDetail } from './student-detail';
import { PagerService } from './pager.service';
@Injectable()
export class StudentService {

  public selectedStudent: Student;
  public selectedStudentDetails : StudentDetail[];

  public studentList: Student[]; 
  public pagedStudentList: Student[];
  private portUrlStudents : string;
  private portUrlDetails : string;
  pager: any = {};

  constructor(private http : Http, private pagerService : PagerService) { 
    this.portUrlStudents = 'http://localhost:57053/api/students/';
    this.portUrlDetails = 'http://localhost:57053/api/studentcourses/';
  }

  postStudent(student : Student) {
    var body = JSON.stringify(student);
    var headerOptions = new Headers({'Content-Type': 'application/json'});
    var requestOptions = new RequestOptions({method: RequestMethod.Post, headers: headerOptions});
    return this.http.post(this.portUrlStudents, body, requestOptions).map(x => x.json());
  }

  putStudent(student, id) {
    var body = JSON.stringify(student);
    var headerOptions = new Headers({'Content-Type': 'application/json'});
    var requestOptions = new RequestOptions({method: RequestMethod.Put, headers: headerOptions});
    return this.http.put(this.portUrlStudents + id, body, requestOptions).map(res => res.json());
  }

  deleteStudent(id) {
    return this.http.delete(this.portUrlStudents + id).map(del => del.json());
  }

  getStudentList() {
    this.http.get(this.portUrlStudents).map((data : Response) => {
      return data.json() as Student[];
    }).toPromise().then(x => {
      this.studentList = x;
      //this.setPage(1);
    })
  }

  setPage(page: number) {
    if(page < 1 || page > this.pager.totalPages) {
      return;
    }
    this.pager = this.pagerService.getPager(this.studentList.length, page);
    this.pagedStudentList = this.studentList.slice(this.pager.startIndex, this.pager.endIndex + 1);
  }

  getStudentDetail(id : number) {
    this.http.get(this.portUrlDetails + id).map((data : Response) => {
      return data.json() as StudentDetail[];
    }).toPromise().then(x => {
      this.selectedStudentDetails = x;
    });
  }
}


