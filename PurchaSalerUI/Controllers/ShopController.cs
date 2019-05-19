using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using BLL;

namespace PurchaSalerUI.Controllers
{
    public class ShopController : Controller
    {
        ShopManager shopManager = new ShopManager();
       public ActionResult InsertShop()
        {
            return View();
        }
        [HttpPost]
        public ActionResult InsertShop(Shop s)
        {
            shopManager.InsertShop(s);
            return RedirectToAction("AddGoods", "Good");//转到发布商品视图
        }
    }
}