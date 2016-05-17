using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class Profile : System.Web.UI.Page
    {
        DatabaseManager databaseManager = new DatabaseManager();
        User currentUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
            }

            Post post = new Post();
            post.userId = currentUser.id;
            post.status = txtStatus.Text.Trim();
            post.statusTime = DateTime.Now;
            post.statusPlace = "Dhaka";

            databaseManager.insertPost(post);
        }

        protected void lnkOpenMap_Click(object sender, EventArgs e)
        {

        }

        protected void lnkPhotoUpload_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }
    }
}