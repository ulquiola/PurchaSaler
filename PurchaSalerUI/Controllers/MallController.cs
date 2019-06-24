using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Models;
using PurchaSalerUI.ViewModel;

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

            //var shopCart = shopCartManager.GetShopCarts(UserID);
            PurchaSalerEntities db = new PurchaSalerEntities();
            var cart = from a in db.ShopCarts
                       where a.UserID==UserID
                       join b in db.Goods on a.GoodID equals b.GoodID
                       select new View_ShopCart
                       {
                           GoodPhoto = b.GoodPhoto,
                           GoodTitle = b.GoodTitle,
                           Price = a.Price,
                           Amount = a.Amount,
                           Total = a.Total
                       };
            return View(cart);

        }

        public ActionResult GoodsDetails(int GoodId)
        {
            var goodDetails = goodsManager.GetGoodById(GoodId);
            ViewBag.photo = goodDetails.GoodPhoto;
            ViewBag.Title = goodDetails.GoodTitle;
            ViewBag.Desc = goodDetails.GoodDescribe;
            ViewBag.Price = goodDetails.Price;
            ViewBag.Account = goodDetails.Amount;
            Session["GoodId_Cart"] = goodDetails.GoodID;
            return View();
        }
        [HttpPost]
        public ActionResult AddCart(ShopCart shopCart)
        {
            shopCart.UserID = Convert.ToInt32(Session["UserID"]);
            shopCart.GoodID = Convert.ToInt32(Session["GoodId_Cart"]);
            int count = shopCartManager.GetshopcartCount(shopCart.UserID, shopCart.GoodID);
            if (count>0)
            {
                return Content("<script>alert('该商品已在购物车中！');window.location.href = document.referrer;</script>");
            }
            else
            {                
                shopCart.Amount = Convert.ToInt32(Request["Jm_Amount"]);
                shopCart.Price = Convert.ToDecimal(Request["Price"]);
                shopCart.Total = shopCart.Amount * shopCart.Price;
                shopCartManager.AddCart(shopCart);
                return Content("<script>alert('购物车添加成功！');window.location.href = document.referrer;</script>");
            }

        }
    }
}