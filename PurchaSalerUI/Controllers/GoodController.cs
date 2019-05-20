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
            //判断当前用户有没有开设店铺
            if (s != null)
            {
                return View("AddGoods");//转到发布商品视图 

            }
            else
            {
                return RedirectToAction("AddShop", "Shop");//转到添加商铺视图
            }
        }
    }
}