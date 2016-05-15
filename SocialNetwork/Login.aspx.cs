using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class Login : System.Web.UI.Page
    {
        DatabaseManager databaseManager = new DatabaseManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.name = txtUser.Text.Trim();
            user.password = txtPassword.Text.Trim();

            if (user.name.Length < 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Username is empty');", true);
            }
            else if (user.password.Length < 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Password is empty');", true);
            }
            else if (databaseManager.checkLogin(user))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Username and Password mismatched, Please try again');", true);
            }
            else
            {
                Response.Redirect("Profile.aspx");
            }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}