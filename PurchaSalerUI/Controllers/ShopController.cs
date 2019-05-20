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
       public ActionResult AddShop()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddShop(Shop s)
        {
            int userid = Convert.ToInt32(Session["UserID"]);
            //将当前userid插入到model中
            s.UserID = userid;
            //添加商铺
            shopManager.AddShop(s);
            return RedirectToAction("AddGoods", "Good");//转到发布商品视图
        }
    }
}