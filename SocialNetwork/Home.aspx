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
                        <div class="row">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="col-md-12">
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
                                                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i>Like</button>
                                                <span class="pull-right text-muted"><%= timeline.likesCount.ToString() %> likes -  <%= timeline.commentsCount.ToString() %> comments</span>
                                            </div>
                                            <div class="box-footer box-comments">
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
                                                <img class="img-responsive img-circle img-sm" src="<%=currentUser.profilePic %>" alt="Alt Text">
                                                <div class="img-push">
                                                    <%--<input type="text" class="form-control input-sm" placeholder="Press enter to post comment">--%>
                                                    <div class="row">
                                                        <div class="col-lg-8">
                                                            <asp:TextBox ID="txtComment" runat="server" class="form-control input-sm" placeholder="Press enter to post comment"></asp:TextBox>
                                                        </div>
                                                        <div class="col-lg-4">
                                                            <asp:Button runat="server" ID="btnComment" CssClass="btn btn-primary" />
                                                        </div>
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
</asp:Content>
