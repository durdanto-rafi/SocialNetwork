using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SocialNetwork.Database
{
    public class DatabaseManager
    {
        SocialNetworkEntities db = new SocialNetworkEntities();

        public void insertRegistration(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
        }

        public bool checkEmail(User user)
        {
            var data = db.Users.Where(x => x.email == user.email).ToList();

            if (data.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool checkUserName(User user)
        {
            var data = db.Users.Where(x => x.name == user.name).ToList();

            if (data.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool checkLogin(User user)
        {
            var data = db.Users.Where(x => x.name == user.name && x.password == user.password).ToList();

            if (data.Count > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void insertLoginDetails(LoginDetail loginDetails)
        {
            db.LoginDetails.Add(loginDetails);
            db.SaveChanges();
        }

        public void insertPost(Post post)
        {
            db.Posts.Add(post);
            db.SaveChanges();
        }

        public User getUserInfoByUsername(string username)
        {
            List<User> users = db.Users.Where(x => x.name == username).ToList();

            if (users.Count < 1)
            {
                return null;
            }
            else
            {
                return users[0];
            }
        }

        public List<Timeline> getTimeLine(int userId)
        {
            var data = db.Posts.Join(db.Users, x => x.userId, y => y.id, (x, y) => new { x, y }).Where(x => x.x.userId == userId)
                .Select(x => new { x.x.id, x.y.name, x.x.statusTime, x.x.statusPlace, x.x.status, x.x.attachment, x.y.profilePic, x.y.address, x.y.firstName, x.y.lastName })
                .OrderByDescending(x => x.statusTime).ToList(); ;

            List<Timeline> timelines = new List<Timeline>();
            foreach (var item in data)
            {
                Timeline timeline = new Timeline();
                timeline.postId = item.id;
                timeline.name = item.name;
                timeline.status = item.status;
                timeline.statusTime = item.statusTime;
                timeline.statusPlace = item.statusPlace;
                timeline.attachment = item.attachment;
                timeline.likesCount = db.UserActivities.Where(x => x.postId == item.id && x.type == "L").Count();
                timeline.commentsCount = db.UserActivities.Where(x => x.postId == item.id && x.type == "C").Count();
                timeline.profilePic = item.profilePic;
                timeline.address = item.address;
                timeline.fullName = item.firstName + " " + item.lastName;


                var comments = db.UserActivities.Join(db.Users, x => x.userId, y => y.id, (x, y) => new { x, y }).Where(x => x.x.postId == item.id && x.x.type == "C")
               .Select(x => new { x.y.name, x.x.details, x.x.time, x.y.profilePic }).OrderBy(x => x.time).ToList();

                List<Comment> com = new List<Comment>();
                for (int i = 0; i < comments.Count; i++)
                {
                    Comment comment = new Comment();
                    comment.name = comments[i].name;
                    comment.details = comments[i].details;
                    comment.time = comments[i].time;
                    comment.userImage = comments[i].profilePic;
                    com.Add(comment);
                }
                timeline.comments = com;
                timelines.Add(timeline);
            }

            if (timelines != null)
            {
                return timelines;
            }
            else
            {
                return null;
            }

        }

        public List<User> getAllUserInfo()
        {
            List<User> users = db.Users.ToList();

            return users;
        }

        public List<Timeline> getHome(int userId)
        {
            //var data = db.Posts.Join(db.Users, x => x.userId, y => y.id, (x, y) => new { x, y })
            //    .Select(x => new { x.x.id, x.y.name, x.x.statusTime, x.x.statusPlace, x.x.status }).OrderByDescending(x => x.statusTime).ToList();

            //List<Timeline> timelines = new List<Timeline>();
            //foreach (var item in data)
            //{
            //    Timeline timeline = new Timeline();
            //    timeline.postId = item.id;
            //    timeline.name = item.name;
            //    timeline.status = item.status;
            //    timeline.statusTime = item.statusTime;
            //    timeline.statusPlace = item.statusPlace;
            //    timelines.Add(timeline);
            //}

            //if (timelines != null)
            //{
            //    return timelines;
            //}
            //else
            //{
            //    return null;
            //}



            var data = db.Posts.Join(db.Users, x => x.userId, y => y.id, (x, y) => new { x, y })
               .Select(x => new { x.x.id, x.y.name, x.x.statusTime, x.x.statusPlace, x.x.status, x.x.attachment, x.y.profilePic, x.y.address, x.y.firstName, x.y.lastName })
               .OrderByDescending(x => x.statusTime).ToList(); ;

            List<Timeline> timelines = new List<Timeline>();
            foreach (var item in data)
            {
                Timeline timeline = new Timeline();
                timeline.postId = item.id;
                timeline.name = item.name;
                timeline.status = item.status;
                timeline.statusTime = item.statusTime;
                timeline.statusPlace = item.statusPlace;
                timeline.attachment = item.attachment;
                timeline.likesCount = db.UserActivities.Where(x => x.postId == item.id && x.type == "L").Count();
                timeline.commentsCount = db.UserActivities.Where(x => x.postId == item.id && x.type == "C").Count();
                timeline.profilePic = item.profilePic;
                timeline.address = item.address;
                timeline.fullName = item.firstName + " " + item.lastName;


                var comments = db.UserActivities.Join(db.Users, x => x.userId, y => y.id, (x, y) => new { x, y }).Where(x => x.x.postId == item.id && x.x.type == "C")
               .Select(x => new { x.y.name, x.x.details, x.x.time, x.y.profilePic }).OrderBy(x => x.time).ToList();

                List<Comment> com = new List<Comment>();
                for (int i = 0; i < comments.Count; i++)
                {
                    Comment comment = new Comment();
                    comment.name = comments[i].name;
                    comment.details = comments[i].details;
                    comment.time = comments[i].time;
                    comment.userImage = comments[i].profilePic;
                    com.Add(comment);
                }
                timeline.comments = com;
                timelines.Add(timeline);
            }

            if (timelines != null)
            {
                return timelines;
            }
            else
            {
                return null;
            }



        }

        public void insertUserActivity(UserActivity userActivity)
        {
            db.UserActivities.Add(userActivity);
            db.SaveChanges();
        }

        public void updateUser(User user)
        {

            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
        }

        public User getUserInfo(int userId)
        {
            var user = db.Users.Where(x => x.id == userId).ToList();
            return user[0];
        }


        public int getLikeCount(int postId)
        {
            return db.UserActivities.Where(x => x.postId == postId && x.type == "L").Count();
        }

        public int getCommentCount(int postId)
        {
            return db.UserActivities.Where(x => x.postId == postId && x.type == "C").Count();
        }

        public void insertMessage(Message message)
        {
            db.Messages.Add(message);
            db.SaveChanges();
        }

        public List<MiniChat> getMessage(int senderId, int recieverId)
        {
            //return db.Messages.Where(x => x.to == senderId || x.to == recieverId).OrderBy(x => x.messageTime).ToList();


            var data = db.Messages.Join(db.Users, x => x.from, y => y.id, (x, y) => new { x, y })
                .Where(x => (x.x.from == senderId && x.x.to == recieverId) || (x.x.to == senderId && x.x.from== recieverId))
                .Select(x => new { x.y.id, x.y.name, x.y.profilePic, x.x.messageText, x.x.messageTime })
                .OrderBy(x => x.messageTime).ToList();

            List<MiniChat> miniChats = new List<MiniChat>();
            for (int i = 0; i < data.Count; i++)
            {
                MiniChat miniChat = new MiniChat();
                miniChat.Id = data[i].id;
                miniChat.name = data[i].name;
                miniChat.proPicture = data[i].profilePic;
                miniChat.messageText = data[i].messageText;
                miniChat.messageTime = data[i].messageTime;
                miniChats.Add(miniChat);
            }
            return miniChats;


        }
    }
}