using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;

namespace DAL
{
    class SqlShopCart:IShopCart
    {
        PurchaSalerEntities db = new PurchaSalerEntities();
        public IEnumerable<ShopCart> GetShopCarts(int UserID)
        {
            var ShopCart = from s in db.ShopCarts
                           where s.UserID == UserID
                           select s;
            return ShopCart;
        }
        public void AddCart(ShopCart shopCart)
        {
            db.ShopCarts.Add(shopCart);
            db.SaveChanges();
        }
        public int GetshopcartCount(int UserID, int GoodID)
        {
            var cart = (
               from c in db.ShopCarts
               where c.UserID == UserID && c.GoodID == GoodID
               select c
               ).Count();
            return cart;
        }
        public ShopCart SelectOneCart(int GoodID)
        {
            var cart = from c in db.ShopCarts
                       where c.GoodID == GoodID
                       select c;
            return cart.FirstOrDefault();
        }
        public void RemoveOneCart(ShopCart cart)
        {
            db.ShopCarts.Remove(cart);
            db.SaveChanges();
        }
    }
}
