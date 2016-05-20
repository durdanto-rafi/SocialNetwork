<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Profile.aspx.cs" Inherits="SocialNetwork.Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>

<%@ Import Namespace="SocialNetwork.Database" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Timeline container -->
    <div class="container" style="margin-top: 66px;">
        <div class="row row-broken">
            <div class="col-md-10 cover">
                <img src="img/Cover/nature.jpg" class="cover-img" alt="image">
                <div class="cover-inside cover-blackout text-c text-light">
                    <img class="cover-avatar size-md img-round" src="img/Friends/woman-4.jpg" alt="profile">
                    <div class="field name font-weight-700"><span class="s-text">Katya Angintiew</span></div>
                    <br>
                    <div class="field place">
                        <span class="s-text">Riviera State 32/106</span>
                    </div>
                    <div class="help-block-1 text-c hidden-xs">
                        <div class="user-icon f-l">
                            <span class="s-text"><b>190</b> Posts</span>
                        </div>
                        <div class="user-icon f-c">
                            <span class="s-text"><b>50</b> Following</span>
                        </div>
                        <div class="user-icon f-r">
                            <span class="s-text"><b>250</b> Followers</span>
                        </div>
                    </div>
                    <div class="help-block-1 hidden-xs">
                        <button type="button" class="btn btn-info f-l">Following</button>
                        <button type="button" class="btn btn-info f-c">Followers</button>
                        <button type="button" class="btn btn-info f-r">Messages</button>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-10 animated fadeInUp">
                <div class="row">
                    <!-- left -->
                    <div class="col-md-6">
                        <div class="row">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div runat="server" id="dvStatus" class="col-md-12">
                                        <div class="panel profile-info">
                                            <div>
                                                <asp:TextBox ID="txtStatus" runat="server" class="form-control input-lg p-text-area " TextMode="MultiLine" placeholder="Whats in your mind today?"></asp:TextBox>
                                            </div>
                                            <div class="panel-footer">
                                                <asp:Button ID="btnPost" runat="server" class="btn btn-info pull-right" Text="Post" ClientIDMode="AutoID" OnClick="btnPost_Click" />

                                                <ul class="nav nav-pills">
                                                    <li>
                                                        <asp:LinkButton ID="lnkOpenMap" runat="server" OnClick="lnkOpenMap_Click"><i class="fa fa-map-marker" ></i></asp:LinkButton></li>
                                                    <li>
                                                        <asp:LinkButton ID="lnkPhotoUpload" runat="server" OnClick="lnkPhotoUpload_Click"><i class="fa fa-camera"></i></asp:LinkButton></li>
                                                    <li><a href="#"><i class="fa fa-film"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-microphone"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <!-- post -->
                            <!-- end post-->

                            <!-- post -->
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <% foreach (Timeline timeline in timelineLeft)
                                        {%>
                                    <div class="col-md-12">
                                        <div class="box box-widget">
                                            <div class="box-header with-border">
                                                <div class="user-block">
                                                    <img class="img-circle" src="img/Friends/woman-4.jpg" alt="User Image">
                                                    <span class="username"><a href="#"><%=timeline.name.ToString() %></a></span>
                                                    <span class="description">Shared publicly -<%=timeline.statusTime.ToString() %></span>
                                                </div>
                                                <div class="box-tools">
                                                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Mark as read">
                                                        <i class="fa fa-circle-o"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>
                                            </div>
                                            <div class="box-body">
                                                <p>
                                                    <%= timeline.status.ToString() %>
                                                </p>


                                                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i>Share</button>
                                                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i>Like</button>
                                                <span class="pull-right text-muted">45 likes - 2 comments</span>
                                            </div>
                                            <div class="box-footer box-comments">
                                                <div class="box-comment">
                                                    <img class="img-circle img-sm" src="img/Friends/woman-2.jpg" alt="User Image">
                                                    <div class="comment-text">
                                                        <span class="username">Maria Gonzales
                                                    <span class="text-muted pull-right">8:03 PM Today</span>
                                                        </span>
                                                        It is a long established fact that a reader will be distracted
                                                by the readable content of a page when looking at its layout.
                                                    </div>
                                                </div>
                                                <div class="box-comment">
                                                    <img class="img-circle img-sm" src="img/Friends/woman-3.jpg" alt="User Image">
                                                    <div class="comment-text">
                                                        <span class="username">Nora Havisham
                                                    <span class="text-muted pull-right">8:03 PM Today</span>
                                                        </span>
                                                        The point of using Lorem Ipsum is that it has a more-or-less
                                                normal distribution of letters, as opposed to using
                                                'Content here, content here', making it look like readable English.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <div>
                                                    <img class="img-responsive img-circle img-sm" src="img/Friends/woman-4.jpg" alt="Alt Text">
                                                    <div class="img-push">
                                                        <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
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
                    </div>
                    <!-- end left -->
                    <!-- right -->
                    <div class="col-md-6">
                        <div class="row">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <% foreach (Timeline timeline in timelineRight)
                                        {%>
                                    <div class="col-md-12">
                                        <div class="box box-widget">
                                            <div class="box-header with-border">
                                                <div class="user-block">
                                                    <img class="img-circle" src="img/Friends/woman-4.jpg" alt="User Image">
                                                    <span class="username"><a href="#"><%=timeline.name.ToString() %></a></span>
                                                    <span class="description">Shared publicly -<%=timeline.statusTime.ToString() %></span>
                                                </div>
                                                <div class="box-tools">
                                                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Mark as read">
                                                        <i class="fa fa-circle-o"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>
                                            </div>
                                            <div class="box-body">
                                                <p>
                                                    <%= timeline.status.ToString() %>
                                                </p>


                                                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i>Share</button>
                                                <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i>Like</button>
                                                <span class="pull-right text-muted">45 likes - 2 comments</span>
                                            </div>
                                            <div class="box-footer box-comments">
                                                <div class="box-comment">
                                                    <img class="img-circle img-sm" src="img/Friends/woman-2.jpg" alt="User Image">
                                                    <div class="comment-text">
                                                        <span class="username">Maria Gonzales
                                                    <span class="text-muted pull-right">8:03 PM Today</span>
                                                        </span>
                                                        It is a long established fact that a reader will be distracted
                                                by the readable content of a page when looking at its layout.
                                                    </div>
                                                </div>
                                                <div class="box-comment">
                                                    <img class="img-circle img-sm" src="img/Friends/woman-3.jpg" alt="User Image">
                                                    <div class="comment-text">
                                                        <span class="username">Nora Havisham
                                                    <span class="text-muted pull-right">8:03 PM Today</span>
                                                        </span>
                                                        The point of using Lorem Ipsum is that it has a more-or-less
                                                normal distribution of letters, as opposed to using
                                                'Content here, content here', making it look like readable English.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <div>
                                                    <img class="img-responsive img-circle img-sm" src="img/Friends/woman-4.jpg" alt="Alt Text">
                                                    <div class="img-push">
                                                        <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
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
                        </div>
                    </div>
                    <!-- end right -->
                </div>
            </div>
        </div>
    </div>
    <!-- end timeline content-->

    <!--BEGIN MODAL-->
    <div class="modal fade" id="myModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text="Select Photo"></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="animated fadeInUp ">
                                    <div class="col-sm-1">
                                    </div>
                                    <div class="col-sm-10">
                                        <%--<img src="img/Photos/4.jpg" class="img-responsive" alt="">--%>
                                        <asp:Image ID="imgModal" runat="server" src="img/Photos/4.jpg" class="img-responsive" alt="" />
                                    </div>
                                    <div class="col-sm-1">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="col-lg-12">
                                <asp:FileUpload Text="Browse" class="btn btn-default btn-file" ID="btnBrowse" runat="server" ValidationGroup="validate" UseSubmitBehavior="False" OnClick="btnBrowse_Click" />
                                <asp:Button Text="Upload" class="btn btn-success" ID="btnUpload" runat="server" ValidationGroup="validate" UseSubmitBehavior="False" OnClick="btnUpload_Click" />
                                <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Close</button>

                            </div>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <%--<asp:AsyncPostBackTrigger EventName="Click" ControlID="btnAddRow" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <!--END MODAL-->
</asp:Content>

