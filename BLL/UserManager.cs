using DALFactory;
using IDAL;
using System.Collections.Generic;
using Models;

namespace BLL
{
    public class UserManager
    {
        private IUser iuser = DataAccess.CreateUser();

        public User GetUserInfo(string username)
        {
            return iuser.GetUserInfo(username);
        }

        public List<User> SelectUser(string username)
        {
            return iuser.SelectUser(username);
        }
        
        public int Login(User man)
        {
            return iuser.Login(man);
        }

        public void InsertUser(User man)
        {
            iuser.InsertUser(man);
        }
    }
}
