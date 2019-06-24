using IDAL;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class SqlOrder : IOrder
    {
        PurchaSalerEntities db = new PurchaSalerEntities();

        public void AddOrder()
        {

        }
    }
}
