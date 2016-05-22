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
        public List<Message> messages = new List<Message>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                currentUser = (User)Session["UserInfo"];

                if (!IsPostBack)
                {
                    listUsers();
                    if(Request.QueryString["id"] != null)
                    {
                        hiddenSenderId.Value = Request.QueryString["id"];
                        messages = databaseManager.getMessage(Convert.ToInt32(hiddenSenderId.Value), currentUser.id);
                    }
                    
                }
            }



        }

        protected void btnMessageSend_Click(object sender, EventArgs e)
        {
            if (Session["UserInfo"] != null)
            {
                if (txtMessage.Text.Trim().Length > 0)
                {
                    currentUser = (User)Session["UserInfo"];
                    Message message = new Message();
                    message.messageText = txtMessage.Text.Trim();
                    message.from = currentUser.id;
                    message.to = Convert.ToInt32(hiddenSenderId.Value);
                    message.messageTime = DateTime.Now;

                    databaseManager.insertMessage(message);
                }
                else {

                }

            }

        }

        private void listUsers()
        {
            users = databaseManager.getAllUserInfo();
        }
    }
}