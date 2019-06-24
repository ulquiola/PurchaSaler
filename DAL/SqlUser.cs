using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        public User GetUserInfoByID(int UserID)
        {
            var userinfo = from u in db.Users
                           where u.UserID == UserID
                           select u;
            return userinfo.FirstOrDefault();
        }
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

        public void InsertUser(User man)
        {
            man.Avatar = "/Content/img/avatar/default_avatar.png";
            db.Users.Add(man);
            db.SaveChanges();
        }
        public void UpdateUserInfo(User user)
        {
            var man = db.Users.Where(u => u.UserID == user.UserID).FirstOrDefault();
            man.Avatar = user.Avatar;
            man.UserName = user.UserName;
            man.Tel = user.Tel;
            man.Email = user.Email;
            db.SaveChanges();
        }

    }
}
