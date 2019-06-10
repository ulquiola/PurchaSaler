using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Models;

namespace PurchaSalerUI.Controllers
{
    public class MallController : Controller
    {
        GoodsManager goodsManager = new GoodsManager();
        ShopCartManager shopCartManager = new ShopCartManager();
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult ShopCart(int UserID)
        {
            UserID = Convert.ToInt32(Session["UserID"]);
            var shopCart = shopCartManager.GetShopCarts(UserID);
            return View(shopCart);
        }

        public ActionResult GoodsDetails(int GoodId)
        {
            var goodDetails = goodsManager.GetGoodById(GoodId);
            ViewBag.photo = goodDetails.GoodPhoto;
            ViewBag.Title = goodDetails.GoodTitle;
            ViewBag.Price = goodDetails.Price;
            Session["GoodId_Cart"] = goodDetails.GoodID;
            return View();
        }
        [HttpPost]
        public ActionResult AddCart(ShopCart shopCart)
        {
            shopCart.UserID = Convert.ToInt32(Session["UserID"]);
            shopCart.GoodID = Convert.ToInt32(Session["GoodId_Cart"]);
            int count = shopCartManager.GetshopcartCount(shopCart.UserID, shopCart.GoodID.Value);
            if (count>0)
            {
                return Content("<script>alert('该商品已在购物车中！');window.location.href = document.referrer;</script>");
            }
            else
            {                
                shopCart.Amount = Convert.ToInt32(Request["number"]);
                shopCart.Price = Convert.ToDecimal(Request["Price"]);
                shopCart.Total = shopCart.Amount * shopCart.Price;
                shopCartManager.AddCart(shopCart);
                return Content("<script>alert('购物车添加成功！');window.location.href = document.referrer;</script>");
            }

        }
    }
}