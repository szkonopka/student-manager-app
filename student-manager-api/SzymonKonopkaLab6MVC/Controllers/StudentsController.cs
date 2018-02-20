using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SzymonKonopkaLab6MVC.Models;

namespace SzymonKonopkaLab6MVC.Controllers
{
    public class StudentsController : Controller
    {
        // GET: Students
        public ActionResult Index()
        {
            IEnumerable<mvcStudentModel> studentsList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("students").Result;
            studentsList = response.Content.ReadAsAsync<IEnumerable<mvcStudentModel>>().Result;
            return View(studentsList);
        }
    }
}