using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using StudentsDataAccess;
namespace SzymonKonopkaLab6.Controllers
{
    [RoutePrefix("api/studentcourses")]
    public class StudentCoursesController : ApiController
    {
        [HttpGet, Route("{id:int}")]
        public IHttpActionResult Get(int id)
        {
            using(StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var studentResults = from c in ctx.Courses
                                     join sc in ctx.StudentCourses on c.ID equals sc.CourseID
                                     join g in ctx.Grades on sc.GradeID equals g.ID
                                     join s in ctx.Students on sc.StudentID equals s.ID
                                     where sc.StudentID == id
                                     select new { c.ID, c.Name, g.NumberEquivalent, g.LetterEquivalent };
                if (studentResults == null)
                {
                    return NotFound();
                }
                return Ok(studentResults.ToList());
            }
        }
    }
}
