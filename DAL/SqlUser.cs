using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL;
using Models;


namespace DAL
{
    class SqlUser : IUser
    {
        PurchaSalerEntities db = new PurchaSalerEntities();

        public User GetUserInfo(string username)
        {
            var userinfo = from u in db.Users
                       where u.UserName == username
                       select u;
            return userinfo.FirstOrDefault();
        }
        public List<User> SelectUser(string username)
        {
            var users = (
                       from u in db.Users
                       where u.UserName == username
                       select u
                       ).ToList();
            return users;
        }

        public int Login(User man)
        {
            var users = from u in db.Users
                        where u.UserName == man.UserName && u.Password == man.Password
                        select u;
            int result = users.Count();
            return result;
        }

        
    }
}
