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
        private IGoods igooder = DataAccess.CreatreGoods();

        public IEnumerable<GoodsInfo> GetGoodsInfos()
        {
            return igooder.GetGoodsInfos();
        }
        public void AddGoods(Good goods)
        {
            igooder.AddGoods(goods);
        }
    }
}
