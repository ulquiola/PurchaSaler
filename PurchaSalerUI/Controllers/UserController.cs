using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using BLL;

namespace PurchaSalerUI.Controllers
{
    public class UserController : Controller
    {
        UserManager usermanager = new UserManager();
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User man)
        {
            int u = usermanager.Login(man);
            User uinfo = usermanager.GetUserInfo(man.UserName);

            if (u>0)
            {
                Session["UserID"] = man.UserID;
                Session["UserName"] = man.UserName;
                Session["Avatar"] = uinfo.Avatar;

                return RedirectToAction("Index", "Home");
            }
            else
            {
                return Content("用户名或密码错误！！！");
            }
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(User man)
        {
            return Content("1");
        }
    }
}