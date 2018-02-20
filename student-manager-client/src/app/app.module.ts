import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { StudentsComponent } from './components/students/students.component';
import { StudentComponent } from './components/students/student/student.component';
import { StudentListComponent } from './components/students/student-list/student-list.component';
import { StudentDetailsComponent } from './components/students/student-details/student-details.component';

@NgModule({
  declarations: [
    AppComponent,
    StudentsComponent,
    StudentComponent,
    StudentListComponent,
    StudentDetailsComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
