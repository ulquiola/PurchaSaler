using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Models;

namespace PurchaSalerUI.Controllers
{
    public class GoodController : Controller
    {
        public ActionResult AddGoods()
        {
            ShopManager shopManager = new ShopManager();
            int userid = int.Parse(Session["UserID"].ToString());
            var s = shopManager.GetShop(userid);
            if (s != null)
            {
                return RedirectToAction("AddGoods", "Good");//转到发布商品视图               
            }
            else
            {
                return RedirectToAction("InsertShop", "Shop");//转到添加商铺视图
            }
        }
    }
}