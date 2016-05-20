using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class Profile : System.Web.UI.Page
    {
        DatabaseManager databaseManager = new DatabaseManager();
        public User currentUser;
        public List<Timeline> timelines;
        public List<Timeline> timelineLeft = new List<Timeline>();
        public List<Timeline> timelineRight = new List<Timeline>();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Session["UserInfo"] != null)
                {
                    currentUser = (User)Session["UserInfo"];
                    if (Request.QueryString["id"] != null)
                    {
                        int userId = Convert.ToInt32(Request.QueryString["id"]);
                        //timelines = databaseManager.getTimeLine(userId);
                        refreshTimeline(userId);
                        dvStatus.Visible = false;
                    }
                    else
                    {
                        //timelines = databaseManager.getTimeLine(currentUser.id);
                        refreshTimeline(currentUser.id);
                    }
                }
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
            //timelines = databaseManager.getTimeLine(currentUser.id);
            refreshTimeline(currentUser.id);
        }

        protected void lnkOpenMap_Click(object sender, EventArgs e)
        {

        }

        protected void lnkPhotoUpload_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Upload Original Image Here 
            string uploadFileName = "";
            string uploadFilePath = "";
            if (btnBrowse.HasFile)
            {
                string ext = Path.GetExtension(btnBrowse.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".gif" || ext == ".png")
                {
                    uploadFileName = Guid.NewGuid().ToString() + ext; uploadFilePath = Path.Combine(Server.MapPath("~/UploadImages"), uploadFileName);
                    try
                    {
                        btnBrowse.SaveAs(uploadFilePath);
                        imgModal.ImageUrl = "~/UploadImages/" + uploadFileName;
                    }
                    catch (Exception ex)
                    { }
                }
                else
                { }
            }
            else
            { }

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);

        }

        protected void btnBrowse_Click(object sender, EventArgs e)
        {

        }

        private void refreshTimeline(int userId)
        {
            timelines = databaseManager.getTimeLine(userId);

            for(int i=0;i< timelines.Count;i++)
            {
                if(i%2==0)
                {
                    timelineLeft.Add(timelines[i]);
                }
                else
                {
                    timelineRight.Add(timelines[i]);
                }
            }
        }
    }
}