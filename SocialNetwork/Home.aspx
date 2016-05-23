<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Home.aspx.cs" Inherits="SocialNetwork.Home" %>

<%@ Import Namespace="SocialNetwork.Database" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Timeline content -->
    <div class="container" style="margin-top: 40px">
        <div class="row">
            <div class="col-md-10 no-paddin-xs">
                <hr>
                <div class="row">
                    <!-- left content-->
                    <div class="profile-nav- col-md-4">
                        <!-- Friends activity -->
                        <div class="widget">
                            <div class="widget-header">
                                <h3 class="widget-caption">Friends activity</h3>
                            </div>
                            <div class="widget-body bordered-top bordered-blue">
                                <div class="card">
                                    <div class="content">
                                        <ul class="list-unstyled team-members">
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img class="notifications" src="img/Friends/guy-2.jpg" alt="img" lass="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-9">
                                                        <b><a href="#">Carlos marthur</a></b> reviewed a 
											<b><a href="#">publication</a></b>. 
											<span class="timeago">5 days ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/woman-2.jpg" alt="img" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-9">
                                                        <b><a href="#">Hillary Markston</a></b> shared a 
											<b><a href="#">publication</a></b>. 
											<span class="timeago">5 min ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/woman-3.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-9">
                                                        <b><a href="#">Leidy marshel</a></b> shared a 
											<b><a href="#">publication</a></b>. 
											<span class="timeago">5 min ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/woman-4.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-9">
                                                        <b><a href="#">Presilla bo</a></b> shared a 
											<b><a href="#">publication</a></b>. 
											<span class="timeago">5 min ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/woman-4.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-9">
                                                        <b><a href="#">Martha markguy</a></b> shared a 
											<b><a href="#">publication</a></b>. 
											<span class="timeago">5 min ago</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Friends activity -->

                        <!-- People You May Know -->
                        <div class="widget">
                            <div class="widget-header">
                                <h3 class="widget-caption">People You May Know</h3>
                            </div>
                            <div class="widget-body bordered-top bordered-blue">
                                <div class="card">
                                    <div class="content">
                                        <ul class="list-unstyled team-members">
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/guy-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        Carlos marthur
                                                    </div>

                                                    <div class="col-xs-3 text-right">
                                                        <btn class="btn btn-sm btn-info btn-icon"><i class="fa fa-user-plus"></i></btn>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/woman-1.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        Maria gustami
                                                    </div>

                                                    <div class="col-xs-3 text-right">
                                                        <btn class="btn btn-sm btn-info btn-icon"><i class="fa fa-user-plus"></i></btn>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/Friends/woman-2.jpg" alt="Circle Image" class="img-circle img-no-padding img-responsive">
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        Angellina mcblown
                                                    </div>

                                                    <div class="col-xs-3 text-right">
                                                        <btn class="btn btn-sm btn-info  btn-icon"><i class="fa fa-user-plus"></i></btn>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End people yout may know -->
                    </div>
                    <!-- end left content-->
                    <!-- right  content-->
                    <div class="profile-info col-md-8 animated fadeInUp">
                        <div class="row" >
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="col-md-12" runat="server" visible="false">
                                        <div class="panel profile-info">
                                            <div>
                                                <asp:TextBox ID="txtStatus" runat="server" class="form-control input-lg p-text-area" TextMode="MultiLine" placeholder="Whats in your mind today?"></asp:TextBox>
                                            </div>
                                            <div class="panel-footer">
                                                <asp:Button ID="btnPost" runat="server" class="btn btn-info pull-right" Text="Post" OnClick="btnPost_Click" />

                                                <ul class="nav nav-pills">
                                                    <li>
                                                        <asp:LinkButton ID="lnkOpenMap" runat="server"><i class="fa fa-map-marker" ></i></asp:LinkButton></li>
                                                    <li>
                                                        <asp:LinkButton ID="lnkPhotoUpload" runat="server"><i class="fa fa-camera"></i></asp:LinkButton></li>
                                                    <li><a href="#"><i class="fa fa-film"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-microphone"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <!-- post -->
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>
                                    <% foreach (Timeline timeline in timelines)
                                        {%>
                                    <div class="col-md-12">
                                        <div class="box box-widget">
                                            <div class="box-header with-border">
                                                <div class="user-block">
                                                    <img class="img-circle" src="<%=timeline.profilePic %>" alt="User Image">
                                                    <span class="username"><a href="#"><%=timeline.name %></a></span>
                                                    <span class="description">Shared publicly - <%=timeline.statusTime.ToString() %> @ <%=timeline.statusPlace %></span>
                                                </div>
                                                <div class="box-tools">
                                                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Mark as read">
                                                        <i class="fa fa-circle-o"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>
                                            </div>
                                            <div class="box-body" style="display: block;">
                                                <img class="img-responsive pad" src="<%= timeline.attachment %>" alt="">
                                                <p><%=timeline.status.ToString() %></p>


                                                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i>Share</button>
                                                <button data-post="<%= timeline.postId.ToString() %>" type="button" class="btn btn-default btn-xs btn-like"><i class="fa fa-thumbs-o-up"></i>Like</button>
                                            
                                                <span class="pull-right text-muted" id="commentsCount-<%= timeline.postId.ToString()  %>"><%= timeline.commentsCount.ToString() %> comments</span>
                                                <span class="pull-right">&nbsp - &nbsp;</span>
                                                <span class="pull-right text-muted" id="likesCount-<%= timeline.postId.ToString()  %>"><%= timeline.likesCount.ToString() %> likes</span>
                                          
                                            
                                            </div>
                                            
                                            
                                            <div class="box-footer box-comments" id="commentsContainer-<%= timeline.postId.ToString()  %>">
                                                <% foreach (Comment comment in timeline.comments)
                                                    {%>
                                                <div class="box-comment">
                                                    <img class="img-circle img-sm" src=" <%= comment.userImage %>" alt="User Image">
                                                    <div class="comment-text">
                                                        <span class="username"><%= comment.name.ToString() %>
                                                            <span class="text-muted pull-right"><%= comment.time.ToString() %></span>
                                                        </span>
                                                        <%= comment.details %>
                                                    </div>
                                                </div>
                                                <%} %>
                                            </div>
                                            <div class="box-footer">
                                                <div>
                                                    <img class="img-responsive img-circle img-sm" src="<%= currentUser.profilePic %>" alt="Alt Text">
                                                    <div class="img-push">
                                                        <input type="text" class="form-control input-sm input-comment" placeholder="Enter your comment">
                                                        <button data-post="<%= timeline.postId.ToString() %>" class="btn btn-sm input-comment-button">Send</button>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <%} %>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger EventName="Click" ControlID="btnPost" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <!-- end post-->
                        </div>
                        <div class="panel panel-white post-load-more panel-shadow text-center">
                            <button class="btn btn-info">
                                <i class="fa fa-refresh"></i>Load More...
                            </button>
                        </div>
                    </div>
                    <!--end right  content-->
                </div>
            </div>
        </div>
    </div>
    <!-- end timeline content-->

    <script>
        $(document).on('ready', function () {
            $(document).on('click', '.btn-like', function (e) {
                e.preventDefault();
                var postId = $(this).attr('data-post');
                
                var postdata = JSON.stringify(
                   {
                       "func":'L',
                       "val1":'',
                       "val2": postId,
                       "val3":  <%= currentUser.id %>,
                       "val4": ''
                   });

                loadJsonData(postdata , $(this) , postId , '' , 'L');
            });


            $(document).on('click', '.input-comment-button', function (e) {
                e.preventDefault();
                var postId = $(this).attr('data-post');
                var comment = $(this).prev('input').val();
                
                if(comment.length<1)
                {
                    errorAlert('Comment section is empty !');
                }
                else
                {
                    var postdata = JSON.stringify(
                   {
                       "func": 'C',
                       "val1": comment,
                       "val2": postId,
                       "val3": <%= currentUser.id %>,
                       "val4": ''
                   });

                   loadJsonData(postdata , $(this) , postId, comment , 'C');

               }

                

            });
        });


       function loadJsonData(postdata , actionElement , postId ,inputValue , type) {
           
           $.ajax({
               type: "POST",
               url: "Handlers/AjaxHandler.ashx",
               cache: false,
               data: postdata,
               dataType: "json",
               success: getSuccess,
               error: getFail
           });
           
           $postArray = postdata;

           function getSuccess(data, textStatus, jqXHR) {
               console.log(data.Response[0]);
               console.log(data.Response[1]);

               var commentCounter = $('span#commentsCount-' + postId );
               var likesCounter = $('span#likesCount-' + postId );

               //alert(data.Response);
               if(type == 'C'){
                   console.log(type);
                   console.log(inputValue);
                   var profilePic = "<%= currentUser.profilePic %>";
                   var userName = "<%= currentUser.name %>";

                   var newComment = "<div class='box-comment'><img alt='User Image' src='" + profilePic + "' class='img-circle img-sm'><div class='comment-text'><span class='username'>" + userName + "<span class='text-muted pull-right'>Just Now</span></span>" + inputValue +
                                    "</div>";
                   
                   var commentContainer = $('#commentsContainer-' + postId );

                   

                   commentContainer.append(newComment);
                   var input = actionElement.prev(input);
                   input.val('');
                   commentCounter.html(data.Response[0] + ' comments ');
                   likesCounter.html(data.Response[1] + ' likes ');
               }else{
                   console.log(type);
                   commentCounter.html(data.Response[0] + ' comments ');
                   console.log('received '+data.Response[1]);
                   likesCounter.html(data.Response[1] + ' likes ');
               }
           };
           function getFail(jqXHR, textStatus, errorThrown) {
               alert(jqXHR.status);
           };
       };
    </script>
</asp:Content>
