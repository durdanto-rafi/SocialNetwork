using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using Image = System.Drawing.Image;

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
            upload.Attributes["onchange"] = "UploadFile(this)";
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


        }

        protected void btnBrowse_Click(object sender, EventArgs e)
        {

        }

        private void refreshTimeline(int userId)
        {
            timelines = databaseManager.getTimeLine(userId);

            for (int i = 0; i < timelines.Count; i++)
            {
                if (i % 2 == 0)
                {
                    timelineLeft.Add(timelines[i]);
                }
                else
                {
                    timelineRight.Add(timelines[i]);
                }
            }
        }

        protected void btncrop_Click(object sender, EventArgs e)
        {
            try
            {
                string fname = imageName.Value;
                string fpath = Path.Combine(Server.MapPath("~/Uploads"), fname);
                Image oimg = Image.FromFile(fpath);
                Rectangle cropcords = new Rectangle(
                Convert.ToInt32(hdnx.Value),
                Convert.ToInt32(hdny.Value),
                Convert.ToInt32(hdnw.Value),
                Convert.ToInt32(hdnh.Value));
                string cfname, cfpath;
                Bitmap bitMap = new Bitmap(cropcords.Width, cropcords.Height, oimg.PixelFormat);
                Graphics grph = Graphics.FromImage(bitMap);
                grph.DrawImage(oimg, new Rectangle(0, 0, bitMap.Width, bitMap.Height), cropcords, GraphicsUnit.Pixel);
                cfname = "crop_" + fname;
                cfpath = Path.Combine(Server.MapPath("~/cropimages"), cfname);
                bitMap.Save(cfpath);
                imgcropped.Visible = true;
                imgcropped.Src = "~/cropimages/" + cfname;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private String image()
        {
            string input = Request.Url.AbsoluteUri;
            string output = input.Substring(input.IndexOf('=') + 1);
            string fileName = Path.GetFileName(upload.PostedFile.FileName);

            Stream stream = upload.PostedFile.InputStream;

            Bitmap sourceImage = new Bitmap(stream);

            int maxImageWidth = 800;
            if (sourceImage.Width > maxImageWidth)
            {
                int newImageHeight = (int)(sourceImage.Height * ((float)maxImageWidth / (float)sourceImage.Width));
                Bitmap resizedImage = new Bitmap(maxImageWidth, newImageHeight);
                Graphics gr = Graphics.FromImage(resizedImage);
                gr.InterpolationMode = InterpolationMode.HighQualityBicubic;
                gr.DrawImage(sourceImage, 0, 0, maxImageWidth, newImageHeight);
                // Save the resized image:

                Bitmap map = new Bitmap(resizedImage);
                map.Save(Server.MapPath("~/Uploads/" + "/") + fileName);
            }
            else
            {
                sourceImage.Save(Server.MapPath("~/Uploads/" + "/") + fileName);
            }

            imgcrop.Src = "~/Uploads/" + fileName;

            return fileName;
        }

        protected void Upload(object sender, EventArgs e)
        {
            // upload.SaveAs(Server.MapPath("~/Uploads/" + Path.GetFileName(upload.FileName)));
            imageName.Value = image();
        }
    }
}