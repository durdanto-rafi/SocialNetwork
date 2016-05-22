using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web.Script.Services;
using System.Web.Services;
using SocialNetwork.Database;

namespace SocialNetwork
{

    public partial class EditProfile : System.Web.UI.Page
    {
        public User currentUser;
        DatabaseManager databaseManager = new DatabaseManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserInfo"] != null)
                {
                    currentUser = (User)Session["UserInfo"];

                    txtFirstName.Text = currentUser.firstName;
                    txtLastName.Text = currentUser.lastName;
                    txtPhone.Text = currentUser.phone;
                    txtAddress.Text = currentUser.address;
                    imgProPic.Src = currentUser.profilePic;
                }
            }
        }

        public static System.Drawing.Image PadImage(System.Drawing.Image originalImage)
        {
            int largestDimension = Math.Max(originalImage.Height, originalImage.Width);
            Size squareSize = new Size(largestDimension, largestDimension);
            Bitmap squareImage = new Bitmap(squareSize.Width, squareSize.Height);
            using (Graphics graphics = Graphics.FromImage(squareImage))
            {
                graphics.FillRectangle(Brushes.White, 0, 0, squareSize.Width, squareSize.Height);
                graphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

                graphics.DrawImage(originalImage, (squareSize.Width / 2) - (originalImage.Width / 2), (squareSize.Height / 2) - (originalImage.Height / 2), originalImage.Width, originalImage.Height);
            }
            return squareImage;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];

                currentUser.firstName = txtFirstName.Text.Trim();
                currentUser.lastName = txtLastName.Text.Trim();
                currentUser.phone = txtPhone.Text.Trim();
                currentUser.address = txtAddress.Text.Trim();

                databaseManager.updateUser(currentUser);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
                currentUser.profilePic = "Uploads/" + image();
            }

        }



        private String image()
        {
            string input = Request.Url.AbsoluteUri;
            string output = input.Substring(input.IndexOf('=') + 1);

            if (fileUpload.PostedFile.FileName.Length > 0)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                fileName = "proPic_" + fileName;
                Stream stream = fileUpload.PostedFile.InputStream;

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

                imgProPic.Src = "~/Uploads/" + fileName;
                return fileName;
            }
            else
            {
                return "";
            }
        }
    }
}