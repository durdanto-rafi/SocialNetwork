using SocialNetwork.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SocialNetwork
{
    public partial class Messages : System.Web.UI.Page
    {
        public User currentUser;
        DatabaseManager databaseManager = new DatabaseManager();
        public List<User> users = new List<User>();
        public List<MiniChat> messages = new List<MiniChat>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];
                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        hiddenSenderId.Value = Request.QueryString["id"];
                        messages = databaseManager.getMessage(Convert.ToInt32(hiddenSenderId.Value), currentUser.id);
                    }
                }

            }
            else
            {
                Response.Redirect("Error.aspx");
            }



        }

        protected void btnMessageSend_Click(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                if (txtMessage.Text.Trim().Length == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Please type you message !');", true);
                }
                else if ((hiddenSenderId.Value.Length == 0))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('Please select someone first from the rigt side chat list !');", true);
                }
                else if (currentUser.id == Convert.ToInt32(hiddenSenderId.Value))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "errorAlert('You cant sent message to yourself !');", true);
                }

                else {

                    currentUser = (User)Session["UserInfo"];
                    Message message = new Message();
                    message.messageText = txtMessage.Text.Trim();
                    message.from = currentUser.id;
                    message.to = Convert.ToInt32(hiddenSenderId.Value);
                    message.messageTime = DateTime.Now;

                    databaseManager.insertMessage(message);
                    txtMessage.Text = String.Empty;
                    messages = databaseManager.getMessage(Convert.ToInt32(hiddenSenderId.Value), currentUser.id);

                }

            }

        }

        private void listUsers()
        {
            users = databaseManager.getAllUserInfo();
        }
    }
}