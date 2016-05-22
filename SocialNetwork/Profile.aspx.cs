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

using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
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
            upload.Attributes["onchange"] = "UploadFile(this)";

            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
            }

            if (!IsPostBack)
            {
                if (Session["UserInfo"] != null)
                {
                    currentUser = (User)Session["UserInfo"];
                    if (Request.QueryString["id"] != null)
                    {
                        int userId = Convert.ToInt32(Request.QueryString["id"]);
                        refreshTimeline(userId);
                        dvStatus.Visible = false;

                        User userOther = databaseManager.getUserInfo(userId);
                        imgPropic.Src = userOther.profilePic;
                        lblFullUserName.Text = userOther.firstName + " " + userOther.lastName;
                        lblAddress.Text = userOther.address;
                    }
                    else
                    {
                        refreshTimeline(currentUser.id);
                        imgPropic.Src = currentUser.profilePic;
                        lblFullUserName.Text = currentUser.firstName + " " + currentUser.lastName;
                        lblAddress.Text = currentUser.address;
                    }
                }
            }



        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (txtStatus.Text.Trim().Length == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Please enter your status');", true);
                refreshTimeline(currentUser.id);
            }
            else
            {
                if (Session["UserInfo"] != null)
                {
                    //dvImage.Visible = false;
                    currentUser = (User)Session["UserInfo"];

                    Post post = new Post();
                    post.userId = currentUser.id;
                    post.status = txtStatus.Text.Trim();
                    post.statusTime = DateTime.Now;

                    DataTable dtMapInfo = new DataTable();
                    if (Session["MapInfo"] != null)
                    {
                        dtMapInfo = (DataTable)Session["MapInfo"];
                        post.statusPlace = dtMapInfo.Rows[0][1].ToString();
                        post.latilude = Convert.ToDouble(dtMapInfo.Rows[0][2].ToString());
                        post.longitude = Convert.ToDouble(dtMapInfo.Rows[0][3].ToString());
                    }

                    if (lblImageName.Text.Length > 0)
                    {
                        post.attachment = lblImageName.Text;
                    }

                    databaseManager.insertPost(post);
                    refreshTimeline(currentUser.id);

                    txtStatus.Text = String.Empty;
                    lblLocation.Text = String.Empty;
                    lblImageName.Text = String.Empty;
                }

                else
                {
                    Response.Redirect("Error.aspx");
                }
            }



        }

        protected void lnkOpenMap_Click(object sender, EventArgs e)
        {
            //dvImage.Visible = false;
            // Session["Modal"] = "M";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            pnlMap.Visible = true;
            pnlImage.Visible = false;
            upload.Visible = false;
            lblModalTitle.Text = "Select Location";

            googleMap("Bangladesh");
        }

        protected void lnkPhotoUpload_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            pnlMap.Visible = false;
            pnlImage.Visible = true;
            upload.Visible = true;
            lblModalTitle.Text = "Select Image";
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

            if (upload.PostedFile.FileName.Length > 0)
            {
                string fileName = Path.GetFileName(upload.PostedFile.FileName);
                fileName = "post_" + fileName;
                Stream stream = upload.PostedFile.InputStream;

                Bitmap sourceImage = new Bitmap(stream);

                int maxImageWidth = 400;
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
                lblImageName.Text = "Uploads/" + fileName;
                return fileName;
            }
            else
            {
                return "";
            }
        }

        protected void Upload(object sender, EventArgs e)
        {
            imageName.Value = image();
            refreshTimeline(currentUser.id);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
        }

        protected void FindCoordinates(object sender, EventArgs e)
        {
            googleMap(txtLocation.Text.Trim());
        }

        protected void btnModalClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        private void googleMap(string place)
        {
            if (place.Length > 0)
            {
                string url = "http://maps.google.com/maps/api/geocode/xml?address=" + place + "&sensor=false";
                WebRequest request = WebRequest.Create(url);
                using (WebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                    {
                        DataSet dsResult = new DataSet();
                        dsResult.ReadXml(reader);
                        DataTable dtCoordinates = new DataTable();
                        dtCoordinates.Columns.AddRange(new DataColumn[4] { new DataColumn("Id", typeof(int)),
                    new DataColumn("Address", typeof(string)),
                    new DataColumn("Latitude",typeof(string)),
                    new DataColumn("Longitude",typeof(string)) });
                        foreach (DataRow row in dsResult.Tables["result"].Rows)
                        {
                            string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
                            DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];
                            dtCoordinates.Rows.Add(row["result_id"], row["formatted_address"], location["lat"], location["lng"]);
                        }
                        if (dtCoordinates.Rows.Count > 0)
                        {
                            pnlScripts.Visible = true;
                            rptMarkers.DataSource = dtCoordinates;
                            rptMarkers.DataBind();
                            Session["MapInfo"] = dtCoordinates;

                            lblLocation.Text = "  @  " + dtCoordinates.Rows[0][1].ToString();
                        }

                        refreshTimeline(currentUser.id);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                    }
                }
            }
            else
            {
                refreshTimeline(currentUser.id);
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Please type Location/Place name !');", true);
            }
        }
    }
}