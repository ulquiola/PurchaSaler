using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace IDAL
{
    public interface IShop
    {
        Shop GetShop(int userid);
        void AddShop(Shop s);
    }
}
