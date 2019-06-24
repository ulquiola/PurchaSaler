using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models;

namespace IDAL
{
    public interface IUser
    {
        User GetUserInfoByID(int UserID);
        User GetUserInfo(string username);
        List<User> SelectUser(string username);
        int Login(User man);
        void InsertUser(User man);
        void UpdateUserInfo(User user);
    }
}
