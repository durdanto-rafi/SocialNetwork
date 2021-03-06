﻿using System;
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
        public string attachment { get; set; }
        public int likesCount { get; set; }
        public int commentsCount { get; set; }
        public List<Comment> comments { get; set; }
        public string profilePic { get; set; }

        public string address { get; set; }

        public string fullName { get; set; }
        public int userId { get; set; }
    }
}