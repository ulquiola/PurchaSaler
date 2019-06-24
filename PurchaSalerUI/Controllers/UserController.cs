using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using BLL;
using System.IO;
using System.Data.Entity.Validation;
using System.Diagnostics;

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
                Session["UserID"] = uinfo.UserID;
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
            usermanager.InsertUser(man);
            return RedirectToAction("Login", "User");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult UpdateUserInfo(int UserID)
        {
            var uinfo= usermanager.GetUserInfoByID(UserID);
            ViewBag.Avatar = uinfo.Avatar;
            ViewBag.UserName = uinfo.UserName;
            ViewBag.Tel = uinfo.Tel;
            ViewBag.Email = uinfo.Email;
            return View();
        }
        [HttpPost]
        public ActionResult UpdateUserInfo(User user)
        {
            HttpPostedFileBase image = Request.Files["image0"];
            string SavePath = Server.MapPath("~/Content/img/avatar/");
            string imageName =image.FileName;//获取图片名
            image.SaveAs(Path.Combine(SavePath, imageName));//储存图片到物理路径

            user.Avatar = "/Content/img/avatar/" + imageName;
            user.UserName =Request["name0"];
            user.Tel =Request["tel0"];
            user.Email =Request["email0"];
            usermanager.UpdateUserInfo(user);
            return RedirectToAction("UpdateUserInfo", "User",new { UserID=Convert.ToInt32(Session["UserID"])});

            
        }
    }
}