using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SocialNetwork.Database
{
    public class Timeline
    {
        public int postId { get; set; }
        public string name { get; set; }
        public string status { get; set; }
        public Nullable<System.DateTime> statusTime { get; set; }
        public string statusPlace { get; set; }
    }
}