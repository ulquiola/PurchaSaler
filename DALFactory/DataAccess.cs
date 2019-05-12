﻿using System;
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

    }
}
