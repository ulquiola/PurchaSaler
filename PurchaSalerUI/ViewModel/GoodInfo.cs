using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace PurchaSalerUI.ViewModel
{
    public class GoodInfo
    {
        public string GoodTitle { get; set; }
        public string GoodPhoto { get; set; }
        public string GoodDescribe { get; set; }
        public int CategoryID { get; set; }
        public decimal Price { get; set; }
        public int Amount { get; set; }
        public string ShopName { get; set; }
        public string Avatar { get; set; }
        public string UserName { get; set; }

    }
}