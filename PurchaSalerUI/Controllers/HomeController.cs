using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Models;
using PurchaSalerUI.ViewModel;

namespace PurchaSalerUI.Controllers
{
    public class HomeController : Controller
    {
        PurchaSalerEntities db = new PurchaSalerEntities();

        public ActionResult Index()
        {
            //var data = db.Goods.OrderByDescending(g => g.GoodID).Take(20).ToList();
            //return View(data);
            var data = (from a in db.Goods
                         join b in db.Shops on a.ShopID equals b.ShopID
                         join c in db.Users on b.UserID equals c.UserID
                         select new GoodViewModel()
                         {
                            GoodPhoto=a.GoodPhoto,
                            GoodDescribe=a.GoodDescribe,
                            Price=(float)a.Price,
                            ShopName=b.ShopName,
                            Avatar=c.Avatar,
                            UserName=c.UserName
                         }).ToList();
            return View(data);
        }

        //public ActionResult Index(string searchstring,int?page)
        //{
        //    var data = from g in db.Goods
        //               select g;
        //    if (!String.IsNullOrEmpty(searchstring))
        //    {
        //        data = data.Where(g => g.GoodTitle.Contains(searchstring));
        //    }
        //    else
        //    {
        //        page = 1;
        //    }
        //    int pageSize = 3;
        //    int pageNumber = (page ?? 1);
        //    return View(data.ToPagedList(pageNumber, pageSize));
        //}

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