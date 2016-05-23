using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class SiteMaster : MasterPage
    {
        public User currentUser;
        DatabaseManager databaseManager = new DatabaseManager();
        public List<User> users = new List<User>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
            }
            listUsers();
            
        }
        private void listUsers()
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
                users = databaseManager.getAllUserInfo();

                var userToRemove = users.Single(r => r.id == currentUser.id);
                users.Remove(userToRemove);
            }
            
        }
    }
}