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
    [RoutePrefix("api/courses")]
    public class CoursesController : ApiController
    {
        [HttpGet, Route("")]
        [ResponseType(typeof(IEnumerable<Courses>))]
        public IHttpActionResult Get()
        {
            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                return Ok(ctx.Courses.ToList());
            }
        }

        [HttpGet, Route("{id:int}")]
        [ResponseType(typeof(Courses))]
        public IHttpActionResult Get(int id)
        {
            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                return Ok(ctx.Courses.FirstOrDefault(c => c.ID == id));
            }
        }

        [HttpPost, Route("")]
        public IHttpActionResult Post([FromBody]Courses course)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var maxId = ctx.Courses.ToList().Select(c => c).Max(x => x.ID);
                course.ID = maxId + 1;

                ctx.Courses.Add(course);
                return Ok(ctx.SaveChanges());
            }
        }

        [HttpPut, Route("{id:int}")]
        public IHttpActionResult Put([FromBody]Courses course, int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var courseToEdit = ctx.Courses.FirstOrDefault(c => c.ID == id);

                courseToEdit.Name = course.Name;
                courseToEdit.DayLength = course.DayLength;
                return Ok(ctx.SaveChanges());
            }
        }

        [HttpDelete, Route("{id:int}")]
        public IHttpActionResult Delete(int id)
        {
            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var courseToDelete = ctx.Courses.FirstOrDefault(c => c.ID == id);
                var gradesAndCourses = from studentCourses in ctx.StudentCourses where studentCourses.CourseID == id select studentCourses;
                foreach (StudentCourses element in gradesAndCourses)
                {
                    ctx.StudentCourses.Remove(element);
                }
                ctx.Courses.Remove(courseToDelete);
                return Ok(ctx.SaveChanges());
            }
        }
    }
}

