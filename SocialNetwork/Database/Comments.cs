using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SocialNetwork.Database
{
    public class Comment
    {

        public string name { get; set; }
        public string details { get; set; }
        public Nullable<System.DateTime> time { get; set; }
        public string userImage { get; set; }
    }
}