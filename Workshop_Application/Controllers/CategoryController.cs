using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Workshop_Application.Models;

namespace Workshop_Application.Controllers
{
    [Authorize(Roles = "Admin")]
    public class CategoryController : Controller
    {
        private Entities db = new Entities();

        // GET: Category
        public ActionResult Index()
        {
            Entities DB = new Entities();
            List<Category> CategoryList = DB.Categories.ToList();
            return View(CategoryList);
        }



        // GET: Category/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }



        // GET: Category/Create
        public ActionResult Create()
        {
            return View();
        }



        // POST: Category/Create
        [HttpPost]
        public ActionResult Create(Category category)
        {
            try
            {
                //Material material = new Material();
                Entities DB = new Entities();
                //material.Material_Id =Int32.Parse( collection["Material_Id"]);
                //material.Material_Description =collection["Material_Description"];
                //material.Material_Path = collection["Material_Path"];
                //material.Workshop_Id = Int32.Parse(collection["Workshop_Id"]);
                DB.Categories.Add(category);
                DB.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }




        // GET: Category/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }



        // POST: Category/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Category category)
        {
            try
            {



                Entities DB = new Entities();
                Category tcategory = DB.Categories.Where(N => N.CategoryId == id).FirstOrDefault();
                tcategory.CategoryId = tcategory.CategoryId;
                tcategory.CategoryName = category.CategoryName;
                ////material1.Material_Path = material.Material_Path;



                DB.SaveChanges();
                //return RedirectToAction("Index");




                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }



        // GET: Category/Delete/5
        public ActionResult Delete(int id)
        {
            Entities DB = new Entities();
            Category category = DB.Categories.Where(N => N.CategoryId == id).FirstOrDefault();
            DB.Categories.Remove(category);
            DB.SaveChanges();
            return RedirectToAction("Index");



        }



        // POST: Category/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Category category)
        {
            try
            {
                // TODO: Add delete logic here



                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
