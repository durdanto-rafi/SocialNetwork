//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SocialNetwork.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Post
    {
        public int id { get; set; }
        public Nullable<int> userId { get; set; }
        public string status { get; set; }
        public Nullable<System.DateTime> statusTime { get; set; }
        public string statusPlace { get; set; }
        public Nullable<double> latilude { get; set; }
        public Nullable<double> longitude { get; set; }
    }
}
