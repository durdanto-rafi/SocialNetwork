using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class Register : System.Web.UI.Page
    {
        SocialNetworkEntities db = new SocialNetworkEntities();
        Database.DatabaseManager databaseManager = new Database.DatabaseManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            int count = db.Users.ToList().Count();

            User user = new User();
            user.name = txtUser.Text;
            user.password = txtPassword.Text;

            databaseManager.insertRegistration(user);
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}