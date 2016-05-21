using CodeProject;
using SocialNetwork.Database;
using SocialNetwork.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SocialNetwork
{
    /// <summary>
    /// Summary description for MailHandler
    /// </summary>
    public class MailHandler : IHttpHandler
    {
        DatabaseManager databaseManager = new DatabaseManager();
        public void ProcessRequest(HttpContext context)
        {
            string jsonString = String.Empty;
            HttpContext.Current.Request.InputStream.Position = 0;
            using (System.IO.StreamReader inputStream = new System.IO.StreamReader(HttpContext.Current.Request.InputStream))
            {
                jsonString = inputStream.ReadToEnd();
                System.Web.Script.Serialization.JavaScriptSerializer jSerialize = new System.Web.Script.Serialization.JavaScriptSerializer();
                var value = jSerialize.Deserialize<HandlerValuePass>(jsonString);

                if (value != null)
                {
                    if(value.func == "L")
                    {
                        UserActivity userActivity = new UserActivity();
                        userActivity.type = value.func;
                        userActivity.postId = Convert.ToInt32(value.val2);
                        userActivity.userId = Convert.ToInt32(value.val3);
                        userActivity.time = DateTime.Now;

                        databaseManager.insertUserActivity(userActivity);
                    }
                    else if(value.func == "C")
                    {

                        UserActivity userActivity = new UserActivity();
                        userActivity.type = value.func;
                        userActivity.details = value.val1;
                        userActivity.postId = Convert.ToInt32(value.val2);
                        userActivity.userId = Convert.ToInt32(value.val3);
                        userActivity.time = DateTime.Now;

                        databaseManager.insertUserActivity(userActivity);

                    }
                    
                    //You can write here the code to send Email, see ,the Class System.Net.Mail.MailMessage on MSDN
                    //Once the Mail is sent succefully, you can send back a response to the Client informing him that everything is okay !
                    context.Response.Write(jSerialize.Serialize(
                         new
                         {
                             Response = "Message Has been sent succesfully"
                         }));
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}