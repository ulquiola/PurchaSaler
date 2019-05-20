using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;

namespace DAL
{
     class SqlShop:IShop
    {
        PurchaSalerEntities db = new PurchaSalerEntities();
        
        public Shop GetShop(int userid )
        {
            var shop = from s in db.Shops
                       where s.UserID == userid
                       select s;
            return shop.FirstOrDefault();
        }

        public void AddShop(Shop s)
        {
            db.Shops.Add(s);
            db.SaveChanges();
        }
    }
}
