using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Models;
using PurchaSalerUI.ViewModel;
using PagedList;

namespace PurchaSalerUI.Controllers
{
    /// <summary>
    /// 第一次显示页面时，或者如果用户没有单击分页链接，所有参数都将为 NULL。
    /// 如果单击分页链接后，page变量将包含要显示的页码。
    /// </summary>
    public class HomeController : Controller
    {

        PurchaSalerEntities db = new PurchaSalerEntities();

        public ActionResult Index(string currentFilter,string searchString,int?page)
        {
            var data = ( from a in db.Goods
                         join b in db.Shops on a.ShopID equals b.ShopID
                         join c in db.Users on b.UserID equals c.UserID
                         select new GoodViewModel()
                         {
                            GoodTitle=a.GoodTitle,
                            GoodPhoto=a.GoodPhoto,
                            GoodDescribe=a.GoodDescribe,
                            Price=(float)a.Price,
                            ShopName=b.ShopName,
                            Avatar=c.Avatar,
                            UserName=c.UserName
                         });
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
            
            int Size = 20;//一页显示商品的个数
            //ToPagedList 方法需要一个页码。 两个问号表示null 合并运算符。
            //NULL 合并运算符为可为 NULL 的类型定义默认值；
            //表达式(page ?? 1) 表示如果 page 有值，则返回该值，如果 page 为 NULL，则返回 1。
            int pageNumber = (page ?? 1);
            return View(data.OrderBy(d=>d.GoodTitle).ToPagedList(pageNumber, Size));
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