﻿using SocialNetwork.Database;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
            }
        }
    }
}