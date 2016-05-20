using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class ListUsers : System.Web.UI.Page
    {
        DatabaseManager databaseManager = new DatabaseManager();
        public User currentUser;
        public List<User> users;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
                users = databaseManager.getAllUserInfo();
            }
        }
    }
}