using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class ViewPhoto : System.Web.UI.Page
    {
        DatabaseManager databaseManager = new DatabaseManager();
        public ViewAttachment viewAttachment;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int postId = Convert.ToInt32(Request.QueryString["id"]);
                viewAttachment = databaseManager.getPost(postId);
            }
        }
    }
}