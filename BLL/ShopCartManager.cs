using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using DALFactory;
using Models;

namespace BLL
{
    public class ShopCartManager
    {
        private IShopCart iShopCart = DataAccess.CreateShopCart();

        public IEnumerable<ShopCart> GetShopCarts(int UserID)
        {
            return iShopCart.GetShopCarts(UserID);
        }
        public void AddCart(ShopCart shopCart)
        {
            iShopCart.AddCart(shopCart);
        }
        public int GetshopcartCount(int UserID, int GoodID)
        {
            return iShopCart.GetshopcartCount(UserID, GoodID);
        }
    }
}
