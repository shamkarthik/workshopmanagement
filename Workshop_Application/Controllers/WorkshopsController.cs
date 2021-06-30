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
    public class WorkshopsController : Controller
    {
        private Entities db = new Entities();

        // GET: Workshops
        public ActionResult Index()
        {
            var workshops = db.Workshops.Include(w => w.Category);
            return View(workshops.ToList());
        }

        // GET: Workshops/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Workshop workshop = db.Workshops.Find(id);
            if (workshop == null)
            {
                return HttpNotFound();
            }
            return View(workshop);
        }
        public ActionResult OnRegisterWorkshop(WorkshopMapViewModel w)
        {

            var pw = new ParticipantWorkshop();
            pw.ParticipantId = (int)Session["Id"];
            pw.WorkshopId = w.w_id;
            pw.ParticipantAttended = 0;
            db.ParticipantWorkshops.Add(pw);
            db.SaveChanges();
            return Redirect("Index");
        }
        [Authorize(Roles = "Admin")]
        public ActionResult AllocateTrainer(int id)
        {
            ViewBag.WorkshopId = id;
            ViewBag.trainer = (from u in db.AspNetUsers
                               join r in db.AspNetUserRoles
                                on u.Id equals r.UserId
                               select new UserRole { UserId = u.Id, UserName = u.UserName, RoleId = r.RoleId }).Where(r => r.RoleId == 3).ToList();
            return View(ViewBag);
        }
        
        public ActionResult AllocateTrainerPost(UserRole u)
        {
            
            TrainerWorkshop trainerWorkshop = new TrainerWorkshop();
            trainerWorkshop.TraineId = u.UserId;
            trainerWorkshop.WorkshopId = u.WorkshopId;
            

            db.TrainerWorkshops.Add(trainerWorkshop);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        // GET: Workshops/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            Entities DB = new Entities();
            
            
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
            return View();
        }

        // POST: Workshops/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Create([Bind(Include = "WorkshopId,WorkshopTitle,WorkshopDate,WorkshopTime,WorkshopDuration,WorkshopSeats,CategoryId")] Workshop workshop)
        {
            if (ModelState.IsValid)
            {
                db.Workshops.Add(workshop);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //db.Workshops.Add(workshop);
            //db.SaveChanges();
            //return RedirectToAction("Index");

            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", workshop.CategoryId);
            return View(workshop);
        }

        // GET: Workshops/Edit/5
        [Authorize(Roles = "Admin,Trainer")]
        

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Workshop workshop = db.Workshops.Find(id);
            if (workshop == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", workshop.CategoryId);
            return View(workshop);
        }

        // POST: Workshops/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "WorkshopId,WorkshopTitle,WorkshopDate,WorkshopTime,WorkshopDuration,WorkshopSeats,CategoryId")] Workshop workshop)
        {
            if (ModelState.IsValid)
            {
                db.Entry(workshop).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", workshop.CategoryId);
            return View(workshop);
        }

        // GET: Workshops/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Workshop workshop = db.Workshops.Find(id);
            if (workshop == null)
            {
                return HttpNotFound();
            }
            return View(workshop);
        }

        // POST: Workshops/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Workshop workshop = db.Workshops.Find(id);
            db.Workshops.Remove(workshop);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult WorkshopParticipant(int id)
        {
            Entities DB = new Entities();
            //int wid = 15;
            var result = (from p in DB.ParticipantWorkshops.ToList()
                          join u in DB.AspNetUsers.ToList() on p.ParticipantId equals u.Id
                          select new WorkshopParticipant
                          {
                              Username = u.UserName,
                              PhoneNumber = u.PhoneNumber,
                              Email = u.Email,
                              WorkshopId = (int)p.WorkshopId,
                              ParticipantAttended = (int)p.ParticipantAttended
                          }).Where(w => w.WorkshopId == id && w.ParticipantAttended == 1).ToList();
          
            return View(result);
        }
        public ActionResult Report(int id)
        {
            Entities DB = new Entities();
            Workshop workshops = DB.Workshops.Where(m => m.WorkshopId == id).FirstOrDefault();
            ViewBag.WId = id;
            return View(workshops);
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
