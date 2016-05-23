using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SocialNetwork.Database
{
    public class MiniChat
    {
        public int Id { get; set; }
        public string messageText { get; set; }
        public Nullable<System.DateTime> messageTime { get; set; }
        public string name { get; set; }
        public string proPicture { get; set; }



    }
}