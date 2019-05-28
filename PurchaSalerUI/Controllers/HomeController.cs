using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using PurchaSalerUI.Models;

namespace PurchaSalerUI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            PurchaSalerEntities db = new PurchaSalerEntities();
            var goods = db.Goods.OrderBy(g => g.GoodID).Take(4);
            var users = db.Users;
            var shops = db.Shops;
            IndexViewModel indexView = new IndexViewModel();
            indexView.goods = goods;
            indexView.users = users;
            indexView.shops = shops;
            return View(indexView);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

    }
}