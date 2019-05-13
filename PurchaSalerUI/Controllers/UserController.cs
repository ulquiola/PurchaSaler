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

            if (u>0)
            {
                Session["UserID"] = man.UserID;
                Session["UserName"] = man.UserName;

                return Content("登陆成功！！！");
            }
            else
            {
                return Content("用户名或密码错误！！！");
            }
        }
    }
}