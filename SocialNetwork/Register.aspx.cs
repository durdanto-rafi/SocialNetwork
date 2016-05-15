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
        Database.DatabaseManager databaseManager = new Database.DatabaseManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.email = txtEmail.Text.Trim();
            user.name = txtUser.Text.Trim();
            user.password = txtPassword.Text.Trim();

            if (user.email.Length < 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Email can not be empty');", true);
            }
            else if (user.name.Length < 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Username can not be empty');", true);
            }

            else if (databaseManager.checkEmail(user))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Email duplicated');", true);
            }
            else if (databaseManager.checkUserName(user))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Username is already taken');", true);
            }
            else if (user.password.Length < 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Password can not be empty');", true);
            }
            else if (txtPassword.Text.Trim() != txtConfirmPass.Text.Trim())
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Password mismatched');", true);
            }
            else
            {
                databaseManager.insertRegistration(user);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);

                txtUser.Text = String.Empty;
                txtEmail.Text = String.Empty;
                
            }
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}