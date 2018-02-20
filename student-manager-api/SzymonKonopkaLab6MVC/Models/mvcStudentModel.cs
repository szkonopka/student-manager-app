using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SzymonKonopkaLab6MVC.Models
{
    public class mvcStudentModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string City { get; set; }
    }
}