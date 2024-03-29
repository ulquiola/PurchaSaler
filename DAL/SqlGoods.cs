﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;
using IDAL;

namespace DAL
{
    class SqlGoods:IGoods
    {
        PurchaSalerEntities db = new PurchaSalerEntities();
        public IEnumerable<GoodsInfo> GetGoodsInfos()
        {
            var infos =  from a in db.Goods
                         join b in db.Shops on a.ShopID equals b.ShopID
                         join c in db.Users on b.UserID equals c.UserID
                         select new GoodsInfo
                         {
                             GoodId=a.GoodID,
                             GoodTitle = a.GoodTitle,
                             GoodPhoto = a.GoodPhoto,
                             GoodDescribe = a.GoodDescribe,
                             CategoryID = (int)a.CategoryID,
                             Price = (decimal)a.Price,
                             Amount = (int)a.Amount,
                             ShopName = b.ShopName,
                             Avatar = c.Avatar,
                             UserName = c.UserName
                         };
            return infos;
        }

        public Good GetGoodById(int GoodId)
        {
            var good = (from g in db.Goods
                        where g.GoodID == GoodId
                        select g).FirstOrDefault();
            return good;
        }
        public void AddGoods(Good goods)
        {
            db.Goods.Add(goods);
            db.SaveChanges();
        }
    }
}
                      