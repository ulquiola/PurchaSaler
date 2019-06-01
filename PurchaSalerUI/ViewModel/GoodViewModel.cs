using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace PurchaSalerUI.ViewModel
{
    public class GoodViewModel
    {
        public string GoodPhoto { get; set; }
        public string GoodDescribe { get; set; }
        public float Price { get; set; }
        public string ShopName { get; set; }
        public string Avatar { get; set; }
        public string UserName { get; set; }

    }
}