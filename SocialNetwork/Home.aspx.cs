using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class Home : System.Web.UI.Page
    {
        DatabaseManager databaseManager = new DatabaseManager();
        public User currentUser;
        public List<Timeline> timelines;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                if (!IsPostBack)
                {
                    currentUser = (User)Session["UserInfo"];
                    timelines = databaseManager.getHome(currentUser.id);
                }
            }

            else
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
                Post post = new Post();
                post.userId = currentUser.id;
                post.status = txtStatus.Text.Trim();
                post.statusTime = DateTime.Now;
                post.statusPlace = "Dhaka";

                databaseManager.insertPost(post);
                timelines = databaseManager.getHome(currentUser.id);
            }
        }
    }
}