using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using StudentsDataAccess;

namespace SzymonKonopkaLab6.Controllers
{
    [RoutePrefix("api/students")]
    public class StudentsController : ApiController
    {
        [HttpGet, Route("")]
        [ResponseType(typeof(IEnumerable<Students>))]
        public IHttpActionResult Get()
        {
            using(StudentsDBEntities ctx = new StudentsDBEntities())
            {
                return Ok(ctx.Students.ToList());
            }            
        }

        [HttpGet, Route("{id:int}")]
        [ResponseType(typeof(Students))]
        public IHttpActionResult Get(int id)
        {
            using(StudentsDBEntities ctx = new StudentsDBEntities())
            {
                return Ok(ctx.Students.FirstOrDefault(s => s.ID == id));
            }
        }

        [HttpPost, Route("")]
        public IHttpActionResult Post([FromBody]Students student)
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using(StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var maxId = ctx.Students.ToList().Select(s => s).Max(x => x.ID);
                student.ID = maxId + 1;

                ctx.Students.Add(student);
                return Ok(ctx.SaveChanges());
            }
        }

        [HttpPut, Route("{id:int}")]
        public IHttpActionResult Put([FromBody]Students student, int id)
        {
            if(!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using(StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var studentToEdit = ctx.Students.FirstOrDefault(s => s.ID == id);

                studentToEdit.Name = student.Name;
                studentToEdit.Surname = student.Surname;
                studentToEdit.City = student.City;
                studentToEdit.DateOfBirth = student.DateOfBirth;
                return Ok(ctx.SaveChanges());
            }
        }

        [HttpDelete, Route("{id:int}")]
        public IHttpActionResult Delete(int id)
        {
            using(StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var studentToDelete = ctx.Students.FirstOrDefault(s => s.ID == id);
                var gradesAndCourses = from studentCourses in ctx.StudentCourses where studentCourses.StudentID == id select studentCourses;
                foreach(StudentCourses element in gradesAndCourses){
                    ctx.StudentCourses.Remove(element);
                }
                ctx.Students.Remove(studentToDelete);
                return Ok(ctx.SaveChanges());
            }
        }

        protected override void Dispose(bool disposing)
        {
            if(disposing)
            {
                using(StudentsDBEntities ctx = new StudentsDBEntities())
                {
                    ctx.Dispose();
                }
            }
            base.Dispose(disposing);
        }
    }
}
