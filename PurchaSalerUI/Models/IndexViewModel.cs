using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Models;

namespace PurchaSalerUI.Models
{
    public class IndexViewModel
    {
        public IEnumerable<User> users { get; set; }
        public IEnumerable<Good> goods { get; set; }
        public IEnumerable<Shop> shops { get; set; }

    }
}