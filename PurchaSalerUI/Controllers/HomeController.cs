using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Models;
using PurchaSalerUI.ViewModel;
using PagedList;
using System;

namespace PurchaSalerUI.Controllers
{
    /// <summary>
    /// 第一次显示页面时，或者如果用户没有单击分页链接，所有参数都将为 NULL。
    /// 如果单击分页链接后，page变量将包含要显示的页码。
    /// </summary>
    public class HomeController : Controller
    {

        PurchaSalerEntities db = new PurchaSalerEntities();

        public ActionResult Index(int? CategoryID, string currentFilter, string searchString, int? page)
        {
            var data = ( from a in db.Goods
                         join b in db.Shops on a.ShopID equals b.ShopID
                         join c in db.Users on b.UserID equals c.UserID
                         select new GoodViewModel()
                         {
                            GoodTitle=a.GoodTitle,
                            GoodPhoto=a.GoodPhoto,
                            CategoryID = (int)a.CategoryID,
                            GoodDescribe=a.GoodDescribe,
                            Price=(float)a.Price,
                            ShopName=b.ShopName,
                            Avatar=c.Avatar,
                            UserName=c.UserName
                         });
            if (CategoryID>0)
            {
                switch (CategoryID)
                {
                    case 1:
                        data = data.Where(a => a.CategoryID == 1);
                        break;
                    case 2:
                        data = data.Where(a => a.CategoryID == 2);
                        break;
                    case 3:
                        data = data.Where(a => a.CategoryID == 3);
                        break;
                    case 4:
                        data = data.Where(a => a.CategoryID == 4);
                        break;
                    case 5:
                        data = data.Where(a => a.CategoryID == 5);
                        break;
                    case 6:
                        data = data.Where(a => a.CategoryID == 6);
                        break;
                    case 7:
                        data = data.Where(a => a.CategoryID == 7);
                        break;
                    case 8:
                        data = data.Where(a => a.CategoryID == 8);
                        break;
                    case 9:
                        data = data.Where(a => a.CategoryID == 9);
                        break;
                    case 10:
                        data = data.Where(a => a.CategoryID == 10);
                        break;
                    case 11:
                        data = data.Where(a => a.CategoryID == 11);
                        break;
                }
            }
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            if (!string.IsNullOrEmpty(searchString))
            {
                data = data.Where(s => s.GoodTitle.Contains(searchString)
                                       || s.GoodDescribe.Contains(searchString));
            }

            data = data.OrderBy(d => d.GoodTitle);//按商品名升序排列
            int Size = 20;//一页显示商品的个数
            int pageNumber = (page ?? 1);//表达式(page ?? 1) 表示如果 page 有值，则返回该值，如果 page 为 NULL，则返回 1。
            return View(data.ToPagedList(pageNumber, Size));
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