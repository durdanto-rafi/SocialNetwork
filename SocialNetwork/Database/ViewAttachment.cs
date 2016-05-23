using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SocialNetwork.Database
{
    public class ViewAttachment
    {

        public string attachmentPath { get; set; }
        public string userFullName { get; set; }
        public string status { get; set; }
        public Nullable<System.DateTime> statusTime { get; set; }
        public int likeCount { get; set; }
        public int commentCount { get; set; }
    }
}