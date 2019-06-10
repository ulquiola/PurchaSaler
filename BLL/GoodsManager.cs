using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DALFactory;
using IDAL;
using Models;

namespace BLL
{
    public class GoodsManager
    {
        private IGoods igooder = DataAccess.CreateGoods();

        public IEnumerable<GoodsInfo> GetGoodsInfos()
        {
            return igooder.GetGoodsInfos();
        }
        public Good GetGoodById(int GoodId)
        {
            return igooder.GetGoodById(GoodId);
        }
        public void AddGoods(Good goods)
        {
            igooder.AddGoods(goods);
        }
    }
}
