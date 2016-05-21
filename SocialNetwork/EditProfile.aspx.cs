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

namespace SocialNetwork
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Attributes.Add("style", "visibility :hidden");
        }

        private void image()
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
                Bitmap bm = new Bitmap(resizedImage);
                resizedImage.Save(Server.MapPath("~/Uploads/" + "/") + fileName);
            }
            else
            {
                sourceImage.Save(Server.MapPath("~/Uploads/" + "/") + fileName);
            }
        }

        protected void btncrop_Click(object sender, EventArgs e)
        {

            image();
        }

        protected string CodeBehind()
        {
            return "RAFI" + DateTime.Now.ToString();
        }
        protected void ClickedME(object sender, EventArgs e)
        {
            Label1.Text = "You clicked this button on " + DateTime.Now.ToString();
        }
    }
}