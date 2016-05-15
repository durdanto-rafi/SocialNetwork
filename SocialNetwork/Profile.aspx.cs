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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            Post post = new Post();
            post.userId = 1;
            post.status = txtStatus.Text.Trim();
            post.statusTime = DateTime.Now;
            post.statusPlace = "Dhaka";

            databaseManager.insertPost(post);
        }
    }
}