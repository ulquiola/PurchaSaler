using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace IDAL
{
    public interface IGoods
    {
        IEnumerable<GoodsInfo> GetGoodsInfos();
        Good GetGoodById(int GoodId); 
        void AddGoods(Good goods);
    }
}
