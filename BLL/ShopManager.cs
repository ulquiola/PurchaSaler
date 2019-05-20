using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using DAL;
using DALFactory;
using Models;

namespace BLL
{
    public class ShopManager
    {
        private IShop ishoper = DataAccess.CreateShop();

        public Shop GetShop(int userid)
        {
            return ishoper.GetShop(userid);
        }

        public void AddShop(Shop s)
        {
            ishoper.AddShop(s);
        }
    }
}
