using Microsoft.AspNetCore.Mvc;
using WebApplication3.Models;

namespace WebApplication3.Controllers
{
    public class AccountController : Controller
    {
        QltiemhoaContext db = new QltiemhoaContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("username") == null)
            {
                return View();
            }
            else { return RedirectToAction("profile", "Home"); }
        }
        [HttpPost]
        public IActionResult Login(Customer cus)
        {
            if (HttpContext.Session.GetString("username") == null)
            {
                var u = db.Customers.Where(x => x.CustomerUsername.Equals(cus.CustomerUsername) && x.CustomerPassword.Equals(cus.CustomerPassword)).FirstOrDefault();
                if (u != null)
                {
                    HttpContext.Session.SetString("username", u.CustomerUsername.ToString());
                    return RedirectToAction("Index", "Home");
                }

            }
            return View();
        }
        public IActionResult Signup()
        {
            return View();
        }
    }
}
