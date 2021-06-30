
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Workshop_Application.Models;

namespace Workshop_Application.Controllers
{
    public class ParticipantController : Controller
    {
        private Entities db = new Entities();

        // GET: Participant
        [Authorize(Roles = "Admin,Participant")]
        public ActionResult Index()
        {
            Entities DB = new Entities();

            var result = (from u in DB.AspNetUsers.ToList()
                          join r in DB.AspNetUserRoles.ToList() on u.Id equals r.UserId
                          select new TrainerRole
                          {
                              Id = u.Id,
                              Email = u.Email,
                              PhoneNumber = u.PhoneNumber,
                              UserName = u.UserName,
                              LastName = u.LastName,
                              Gender = u.Gender,
                              IsActive = u.IsActive,
                              Skillset = u.Skillset,
                              Experience = u.Experience,
                              DOB = u.DOB,
                              RoleId = r.RoleId
                          }).Where(r => r.RoleId == 2).ToList();

            return View(result);
        }
        public ActionResult ParticipantDashboard()
        {
            return View();
        }
        // GET: Participant/Details/5
        [Authorize(Roles = "Admin,Participant")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // GET: Participant/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        // POST: Participant/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName,LastName,Gender,IsActive,Skillset,Experience,DOB")] AspNetUser aspNetUser)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.AspNetUsers.Add(aspNetUser);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(aspNetUser);
        //}
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName,LastName,Gender,IsActive,Skillset,Experience,DOB")] AspNetUser aspNetUser)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.AspNetUsers.Add(aspNetUser);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(aspNetUser);
        //}


        // GET: Participant/Edit/5
        [Authorize(Roles = "Participant")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: Participant/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName,LastName,Gender,IsActive,Skillset,Experience,DOB")] AspNetUser aspNetUser)
        {

            if (ModelState.IsValid)
            {
                

                db.Entry(aspNetUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aspNetUser);
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Edit(int? id,EditViewModel editAspNetUser)
        //{
        //    var x = db.AspNetUsers.Find(id);
        //    if (ModelState.IsValid)
        //    {
        //        var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new MyDbContext()))
        //        x.Email = editAspNetUser.Email;
        //        x.UserName = editAspNetUser.First_Name;
        //        x.LastName = editAspNetUser.Last_Name;
        //        x.Gender = editAspNetUser.Gender;
        //        x.PhoneNumber = editAspNetUser.Mobile;
        //        await manager.UpdateAsync(x);
        //        //db.Entry(editAspNetUser).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(editAspNetUser);
        //}

        // GET: Participant/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            if (aspNetUser == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUser);
        }

        // POST: Participant/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AspNetUser aspNetUser = db.AspNetUsers.Find(id);
            db.AspNetUsers.Remove(aspNetUser);
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
