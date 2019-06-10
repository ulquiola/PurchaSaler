using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace IDAL
{
    public interface IShopCart
    {
        IEnumerable<ShopCart> GetShopCarts(int UserID);
        void AddCart(ShopCart shopCart);
        int GetshopcartCount(int UserID, int GoodID);
    }
}
