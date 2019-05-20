using System;
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
        public void AddGoods(Good goods)
        {
            db.Goods.Add(goods);
            db.SaveChanges();
        }
    }
}
