using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SzymonKonopkaLab6MVC.Models
{
    public class mvcCourseModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public Nullable<int> DayLength { get; set; }
    }
}