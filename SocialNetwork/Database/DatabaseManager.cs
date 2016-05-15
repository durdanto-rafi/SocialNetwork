using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SocialNetwork.Database
{
    public class DatabaseManager
    {
        SocialNetworkEntities db = new SocialNetworkEntities();

        public void insertRegistration(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
        }

        public bool checkEmail(User user)
        {
            var data = db.Users.Where(x => x.email == user.email).ToList();

            if (data.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool checkUserName(User user)
        {
            var data = db.Users.Where(x => x.name == user.name).ToList();

            if (data.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool checkLogin(User user)
        {
            var data = db.Users.Where(x => x.name == user.name && x.password == user.password).ToList();

            if (data.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void insertLoginDetails(LoginDetail loginDetails)
        {
            db.LoginDetails.Add(loginDetails);
            db.SaveChanges();
        }
    }
}