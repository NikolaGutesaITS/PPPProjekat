using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using projekat.Models;


namespace projekat.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Prijavljivanje()
        {
            

            return View("Registration");
        }
        //salje potvrdnu poruku posle unosa novog korisnika
        public ActionResult SuccessAddUser()
        {
            return View();
        }
        // za unos novih korisnika
        [HttpPost]
        public ActionResult AddUser(projekat.Models.loginModel userModel)
        {
                using (loginContext db = new loginContext())
                {
                    db.login.Add(userModel);
                    db.SaveChanges();
                //userModel.SuccessAddUser = "Uspesno dodat novi korisnik!";
                
                }

            return View("SuccessAddUser", userModel);

            
        }
        /*public ActionResult ListSchools(projekat.Models.ListaSkola userModel) {
            return View(userModel);
        }*/

        public new ActionResult User()
        {
            ViewBag.Message = "Dobrodosli korisnice";

            return View();
        }
        public ActionResult Admin()
        {
            ViewBag.Message = "Dobrodosli Admine";
            return View();
        }
        public ActionResult User2()
        {
            ViewBag.Message = "Dobrodosli profesore";
            return View();
        }
        //provera sifru i korisnicko ime pri logovanju
        [HttpPost]
        public ActionResult Authorize(projekat.Models.loginModel userModel)
        {
            using (loginContext db=new loginContext())
            {
                var loginDetails = db.login.Where(x => x.username == userModel.username && x.password == userModel.password).FirstOrDefault();

				
                if (loginDetails == null)
                {
                    //userModel.LoginErrorMessage = "Pogresno korisnicko ime ili sifra";
                    return View("Index", userModel);
                }
                else
                {
                    Session["userID"] = loginDetails.id;
					Session["UserName"] = loginDetails.username;
					
					if (loginDetails.userType.Equals("korisnik"))
                    {
                        return RedirectToAction("User", "Home");
                    }
                    else if (loginDetails.userType.Equals("admin"))
                    {
                        return RedirectToAction("Admin", "Home");
                    }
                    else if (loginDetails.userType.Equals("profesor"))
                    {
                        return RedirectToAction("User2", "Home");
                    }
                }
            }
            return View("Index");
        }
        public ActionResult UnosSkola()
        {
            return View();
        }
        //Izbacuje nas iz sistema
        public ActionResult Logout()
        {
            int userId = (int)Session["userID"];
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult vratiView()
        {
            return View("Admin");

        }

       
    }
}