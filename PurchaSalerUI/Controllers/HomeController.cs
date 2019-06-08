using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Models;
using PagedList;
using BLL;

namespace PurchaSalerUI.Controllers
{
    /// <summary>
    /// 第一次显示页面时，或者如果用户没有单击分页链接，所有参数都将为 NULL。
    /// 如果单击分页链接后，page变量将包含要显示的页码。
    /// </summary>
    public class HomeController : Controller
    {
        PurchaSalerEntities db = new PurchaSalerEntities();
        GoodsManager goodsManager = new GoodsManager();
        public ActionResult Index(string sortOrder,string currentFilter,string searchString,int? page)
        {
            ViewBag.CategoryParm = sortOrder;
            var infos = goodsManager.GetGoodsInfos();
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
                infos = infos.Where(g => g.GoodTitle.Contains(searchString)
                                       || g.GoodDescribe.Contains(searchString));
            }
            ViewBag.CurrentSort = sortOrder;
            switch (sortOrder)
            {
                case "生活百货":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 1);
                    break;
                case "手机数码":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 2);
                    break;
                case "书籍":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 3);
                    break;
                case "男装":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 4);
                    break;
                case "女装":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 5);
                    break;
                case "服饰配件":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 6);
                    break;
                case "电器":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 7);
                    break;
                case "美妆":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 8);
                    break;
                case "游戏装备":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 9);
                    break;
                case "游戏交易":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 10);
                    break;
                case "水果零食":
                    infos = infos.OrderBy(g => g.GoodTitle).Where(g => g.CategoryID == 11);
                    break;
                default:  
                    infos = infos.OrderBy(g => g.GoodTitle);
                    break;
            }
            int Size = 20;//一页显示商品的个数
            int pageNumber = (page ?? 1);//表达式(page ?? 1) 表示如果 page 有值，则返回该值，如果 page 为 NULL，则返回 1。
            return View(infos.ToPagedList(pageNumber, Size));
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