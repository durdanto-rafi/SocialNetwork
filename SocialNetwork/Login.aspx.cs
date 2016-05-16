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
            if (!IsPostBack)
            {
                Session.Abandon();
                Session.Clear();
            }
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
                user = databaseManager.getUserInfoByUsername(user.name);
                if(user != null)
                {
                    Session["UserInfo"] = user;
                    LoginDetail loginDetails = new LoginDetail();
                    loginDetails.loginTime = DateTime.Now;
                    loginDetails.userId = user.id;
                    databaseManager.insertLoginDetails(loginDetails);

                    Response.Redirect("Profile.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Sorry something went wrong, please try again...');", true);
                }
                
            }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}