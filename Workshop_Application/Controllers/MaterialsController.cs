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
    public class MaterialsController : Controller
    {
        private Entities db = new Entities();

        // GET: Materials
        [Authorize(Roles = "Admin,Trainer,Participant")]
        public ActionResult Index()
        {
            var materials = db.Materials.Include(m => m.Workshop);
            return View(materials.ToList());
        }

        // GET: Materials/Details/5
        [Authorize(Roles = "Admin,Trainer,Participant")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material material = db.Materials.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            return View(material);
        }

        // GET: Materials/Create
        [Authorize(Roles = "Admin,Trainer")]
        public ActionResult Create()
        {
            ViewBag.WorkshopId = new SelectList(db.Workshops, "WorkshopId", "WorkshopTitle");
            return View();
        }

        // POST: Materials/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaterialId,MaterialDesc,MaterialPath,WorkshopId")] Material material)
        {
            if (ModelState.IsValid)
            {
                db.Materials.Add(material);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.WorkshopId = new SelectList(db.Workshops, "WorkshopId", "WorkshopTitle", material.WorkshopId);
            return View(material);
        }

        // GET: Materials/Edit/5
        [Authorize(Roles = "Admin,Trainer")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material material = db.Materials.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            ViewBag.WorkshopId = new SelectList(db.Workshops, "WorkshopId", "WorkshopTitle", material.WorkshopId);
            return View(material);
        }

        // POST: Materials/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaterialId,MaterialDesc,MaterialPath,WorkshopId")] Material material)
        {
            if (ModelState.IsValid)
            {
                db.Entry(material).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.WorkshopId = new SelectList(db.Workshops, "WorkshopId", "WorkshopTitle", material.WorkshopId);
            return View(material);
        }

        // GET: Materials/Delete/5
        [Authorize(Roles = "Admin,Trainer")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material material = db.Materials.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            return View(material);
        }

        // POST: Materials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Material material = db.Materials.Find(id);
            db.Materials.Remove(material);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
