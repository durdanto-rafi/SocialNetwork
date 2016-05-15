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
    }
}