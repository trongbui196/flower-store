using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebApplication3.Models;
using X.PagedList;

namespace WebApplication3.Controllers
{
    public class AdminController : Controller
    {
        QltiemhoaContext db = new QltiemhoaContext();

        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("username") == null)
            {
                return View();
            }
            else { return RedirectToAction("Dashboard", "Admin"); }
        }
        [HttpPost]
        public IActionResult Index(Adminn cus)
        {
            if (HttpContext.Session.GetString("username") == null)
            {
                var u = db.Customers.Where(x => x.CustomerUsername.Equals(cus.AdminUsername) && x.CustomerPassword.Equals(cus.AdminPassword)).FirstOrDefault();
                if (u != null)
                {
                    HttpContext.Session.SetString("username", u.CustomerUsername.ToString());
                    return RedirectToAction("Dashboard", "Admin");
                }

            }
            return View();
        }
        
        public IActionResult Dashboard()
        {
            return View();
        }
        public IActionResult admincustomer(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.Customers.AsNoTracking().OrderBy(x => x.CustomerId);
            PagedList<Customer> lstt = new PagedList<Customer>(lst, pageNumber, pageSize);
            return View(lstt);

        }
        public IActionResult adminorder(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.Orderrs.AsNoTracking().OrderBy(x => x.OrderId);
            PagedList<Orderr> lstt = new PagedList<Orderr>(lst, pageNumber, pageSize);
            return View(lstt);
        }
        public IActionResult adminflower(int? page)
        {
            int pageSize = 12;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lst = db.Flowers.AsNoTracking().OrderBy(x => x.FlowerId);
            PagedList<Flower> lstt = new PagedList<Flower>(lst, pageNumber, pageSize);
            return View(lstt);
        }
        [Route("addflower")]
        [HttpGet]
        public IActionResult addflower()
        {
            ViewBag.kindid = new SelectList(db.KindFlowers.ToList(), "KindId", "KindName");
            return View();
        }
        [Route("addflower")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult addflower(Flower flwer)
        {
            
                db.Flowers.Add(flwer);
                db.SaveChanges();
                return RedirectToAction("adminflower");
            
        }
        [Route("addcustomer")]
        [HttpGet]
        public IActionResult addcustomer()
        {
            return View();
        }
        [Route("addcustomer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult addcustomer(Customer cus)
        {

            
                db.Customers.Add(cus);
                db.SaveChanges();
                return RedirectToAction("admincustomer");

            

        }

        [Route("addorder")]
        [HttpGet]
        public IActionResult addorder()
        {
            return View();
        }
        [Route("addorder")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult addorder(Orderr cus)
        { 
                db.Orderrs.Add(cus);
                db.SaveChanges();
                return RedirectToAction("admincustomer");

            }
            

      
        [Route("Editcustomer")]
        [HttpGet]
        public IActionResult Editcustomer(int idsp)
        {

            var sp = db.Customers.Find(idsp);
            return View(sp);
        }
        [Route("Editcustomer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Editcustomer(Customer cus)
        {
            
                db.Entry(cus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("admincustomer");
            
        }
        [Route("Editflower")]
        [HttpGet]
        public IActionResult Editflower(int idsp)
        {

            var sp = db.Flowers.Find(idsp);
            return View(sp);
        }
        [Route("Editflower")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Editflower(Flower flower)
        {
           
                db.Entry(flower).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("flowercustomer");
           
        }
        [Route("Editorder")]
        [HttpGet]
        public IActionResult Editorder(int idsp)
        {

            var sp = db.Orderrs.Find(idsp);
            return View(sp);
        }
        [Route("Editorder")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Editorder(Orderr cus)
        {
            
                db.Entry(cus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("adminorder");
           
        }
        [Route("delflower")]
        [HttpGet]
        public IActionResult delflower(int id)
        {
            var x=db.Flowers.Where(x=>x.FlowerId == id);
            db.Remove(x);
            return RedirectToAction("adminflower");
        }
        [Route("delcustomer")]
        [HttpGet]
        public IActionResult delcustomer(int id)
        {
            var x = db.Customers.Where(x => x.CustomerId == id);
            db.Remove(x);
            return RedirectToAction("admincustomer");
        }
        [Route("delorder")]
        [HttpGet]
        public IActionResult delorder(int id)
        {
            var x = db.Orderrs.Where(x => x.OrderId == id);
            db.Remove(x);
            return RedirectToAction("adminorder");
        }
    }
}
