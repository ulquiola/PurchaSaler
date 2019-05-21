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
                //获取当前用户店铺ID
                Session["ShopID"] = s.ShopID;

                //获取分类的id和对应的分类名
                PurchaSalerEntities db = new PurchaSalerEntities();
                ViewBag.categoryid = new SelectList(db.Categories, "CategoryID", "CategoryName");

                return View("AddGoods");//转到发布商品视图 

            }
            else
            {
                return RedirectToAction("AddShop", "Shop");//转到添加商铺视图
            }
        }
        [HttpPost]
        //[Bind(Include = "GoodID,ShopID,CategoryID,GoodTitle,GoodPhoto,GoodDescribe,Quality,Price")]
        public ActionResult AddGoods(Good goods)
        {
            goods.ShopID = Convert.ToInt32(Session["ShopID"]);
            return Content(goods.CategoryID.ToString());
            //GoodsManager goodsManager = new GoodsManager();
            //goodsManager.AddGoods(goods);

            //return RedirectToAction("Index","Home");
        }
    }
}