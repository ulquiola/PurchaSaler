using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PurchaSalerUI.ViewModel
{
    public class View_ShopCart
    {
        public int ShopCartID { get; set; }
        public int UserID { get; set; }
        public int GoodID { get; set; }
        public string GoodPhoto { get; set; }
        public string GoodTitle { get; set; }
        public Nullable<int> Amount { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<decimal> Total { get; set; }
    }
}