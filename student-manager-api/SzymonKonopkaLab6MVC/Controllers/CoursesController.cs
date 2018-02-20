﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using SzymonKonopkaLab6MVC.Models;

namespace SzymonKonopkaLab6MVC.Controllers
{
    public class CoursesController : Controller
    {
        // GET: Courses
        public ActionResult Index()
        {
            IEnumerable<mvcCourseModel> coursesList;
            HttpResponseMessage response = GlobalVariables.WebApiClient.GetAsync("courses").Result;
            coursesList = response.Content.ReadAsAsync<IEnumerable<mvcCourseModel>>().Result;
            return View(coursesList);
        }
    }
}