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
    [RoutePrefix("api/grades")]
    public class GradesController : ApiController
    {
        [HttpGet, Route("")]
        [ResponseType(typeof(IEnumerable<Grades>))]
        public IHttpActionResult Get()
        {
            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                return Ok(ctx.Grades.ToList());
            }
        }

        [HttpGet, Route("{id:int}")]
        [ResponseType(typeof(Grades))]
        public IHttpActionResult Get(int id)
        {
            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                return Ok(ctx.Grades.FirstOrDefault(g => g.ID == id));
            }
        }

        [HttpPost, Route("")]
        public IHttpActionResult Post([FromBody]Grades grade)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var maxId = ctx.Grades.ToList().Select(g => g).Max(x => x.ID);
                grade.ID = maxId + 1;

                ctx.Grades.Add(grade);
                return Ok(ctx.SaveChanges());
            }
        }

        [HttpPut, Route("{id:int}")]
        public IHttpActionResult Put([FromBody]Grades grade, int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var gradeToEdit = ctx.Grades.FirstOrDefault(g => g.ID == id);

                gradeToEdit.LetterEquivalent = grade.LetterEquivalent;
                gradeToEdit.NumberEquivalent = grade.NumberEquivalent;
                return Ok(ctx.SaveChanges());
            }
        }

        [HttpDelete, Route("{id:int}")]
        public IHttpActionResult Delete(int id)
        {
            using (StudentsDBEntities ctx = new StudentsDBEntities())
            {
                var gradeToDelete = ctx.Grades.FirstOrDefault(g => g.ID == id);
                var gradesAndCourses = from studentCourses in ctx.StudentCourses where studentCourses.GradeID == id select studentCourses;
                foreach (StudentCourses element in gradesAndCourses)
                {
                    ctx.StudentCourses.Remove(element);
                }
                ctx.Grades.Remove(gradeToDelete);
                return Ok(ctx.SaveChanges());
            }
        }
    }
}

