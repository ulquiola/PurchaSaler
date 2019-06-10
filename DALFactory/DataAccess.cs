using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using System.Configuration;
using System.Reflection;
using Models;
using DAL;

namespace DALFactory
{
    public class DataAccess
    {
        private static string AssemblyName = ConfigurationManager.AppSettings["Path"].ToString();
        private static string db = ConfigurationManager.AppSettings["DB"].ToString();
        public static IUser CreateUser()
        {
            string className = "DAL.SqlUser";
            return (IUser)Assembly.Load(AssemblyName).CreateInstance(className);
        }
        public static IShop CreateShop()
        {
            string className = "DAL.SqlShop";
            return (IShop)Assembly.Load(AssemblyName).CreateInstance(className);
        }

        public static IGoods CreateGoods()
        {
            string className = "DAL.SqlGoods";
            return (IGoods)Assembly.Load(AssemblyName).CreateInstance(className);
        }

        public static IShopCart CreateShopCart()
        {
            string className = "DAL.SqlShopCart";
            return (IShopCart)Assembly.Load(AssemblyName).CreateInstance(className);
        }
    }
}
