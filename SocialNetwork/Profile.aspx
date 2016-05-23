<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Profile.aspx.cs" Inherits="SocialNetwork.Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<%@ Import Namespace="SocialNetwork.Database" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            <%--if (fileUpload.value != '') {
                document.getElementById("<%=btnUpload.ClientID %>").click();
            }--%>
        }

    
        //debugger;
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


            $(document).on('click', '.timelineData .input-comment-button', function (e) {
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

       var UpdatePanel1 = '<%=UpdatePanel1.ClientID%>';
        function ShowItems()
        {
            if (UpdatePanel1 != null) 
            {
                __doPostBack(UpdatePanel1, '');
                alert("AA");
            }
        }   


        $(document).on('change', '#MainContent_upload', function(){
            readURL(this, $('#MainContent_imgcrop'));
        });

        function readURL(input, $imagePreviewHolder) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $imagePreviewHolder.show();
                    $imagePreviewHolder.attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
    <!-- Timeline container -->
    <div class="container" style="margin-top: 66px;">
        <div class="row row-broken">
            <div class="col-md-10 cover">
                <img src="img/Cover/nature.jpg" id="imgCover" class="cover-img" alt="image">
                <div class="cover-inside cover-blackout text-c text-light">
                    <img class="cover-avatar size-md img-round" id="imgPropic" runat="server" src="" alt="profile">
                    <div class="field name font-weight-700">
                        <%--  <span class="s-text"></span>--%>
                        <asp:Label ID="lblFullUserName" runat="server" Class="s-text"></asp:Label>
                    </div>
                    <br>
                    <div class="field place">
                        <%--<span class="s-text"><%= currentUser.address %></span>--%>
                        <asp:Label ID="lblAddress" runat="server" Class="s-text"></asp:Label>
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
                                            <div class="box-body">
                                                <asp:Label ID="lblLocation" runat="server" Font-Size="Small" Text="" Class="text-muted"></asp:Label>
                                                <asp:Label ID="lblImageName" runat="server" Font-Size="Small" Text="" Class="text-muted"></asp:Label>
                                            </div>
                                            <br />
                                            <div class="panel-footer">
                                                <asp:Button ID="btnPost" runat="server" class="btn btn-info pull-right" Text="Post" ClientIDMode="AutoID" OnClick="btnPost_Click" />
                                                <ul class="nav nav-pills">
                                                    <li>
                                                        <asp:LinkButton ID="lnkOpenMap" runat="server" OnClick="lnkOpenMap_Click"><i class="fa fa-map-marker" ></i></asp:LinkButton></li>
                                                    <li>
                                                        <asp:LinkButton ID="lnkPhotoUpload" runat="server" OnClick="lnkPhotoUpload_Click"><i class="fa fa-camera"></i></asp:LinkButton></li>

                                                    <%--<li>
                                                        <asp:LinkButton runat="server"><i class="fa fa-film" ></i></asp:LinkButton></li>
                                                    <li>
                                                        <asp:LinkButton runat="server"><i class="fa fa-microphone"></i></asp:LinkButton></li>--%>
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
                                    <div class="col-md-12 timelineData">
                                        <div class="box box-widget">
                                            <div class="box-header with-border">
                                                <div class="user-block">
                                                    <img class="img-circle" src="<%= timeline.profilePic %>" alt="User Image">
                                                    <span class="username"><a href="#"><%=timeline.name.ToString() %></a></span>
                                                    <span class="description">Shared publicly -<%=timeline.statusTime.ToString() %>  @ <%=timeline.statusPlace %></span>
                                                </div>
                                                <%-- <div class="box-tools">
                                                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Mark as read">
                                                        <i class="fa fa-circle-o"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>--%>
                                            </div>
                                            <div class="box-body" style="display: block;">
                                                 <% if (timeline.attachment != null)
                                                {%>
                                                <a href="ViewPhoto.aspx?id=<%= timeline.postId %>">
                                                    <img class="img-responsive pad" src="<%= timeline.attachment %>" alt=""></a>
                                                <%}
                                                else { %>
                                                <img class="img-responsive pad" src="<%= timeline.attachment %>" alt="">
                                                <%} %>
                                                <p><%= timeline.status.ToString() %> </p>
                                                <%--<button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i>Share</button>--%>
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
                    </div>
                    <!-- end left -->
                    <!-- right -->
                    <div class="col-md-6">
                        <div class="row">
                            <!-- post -->
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <ContentTemplate>
                                    <% foreach (Timeline timeline in timelineRight)
                                        {%>
                                    <div class="col-md-12 timelineData">
                                        <div class="box box-widget">
                                            <div class="box-header with-border">
                                                <div class="user-block">

                                                    <img class="img-circle" src="<%= timeline.profilePic %>" alt="User Image">
                                                    <span class="username"><a href="#"><%=timeline.name.ToString() %></a></span>
                                                    <span class="description">Shared publicly -<%=timeline.statusTime.ToString() %>  @ <%=timeline.statusPlace %></span>
                                                </div>
                                                <%-- <div class="box-tools">
                                                    <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="" data-original-title="Mark as read">
                                                        <i class="fa fa-circle-o"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                </div>--%>
                                            </div>
                                            <div class="box-body" style="display: block;">
                                                <% if (timeline.attachment != null)
                                                {%>
                                                <a href="ViewPhoto.aspx?id=<%= timeline.postId %>">
                                                    <img class="img-responsive pad" src="<%= timeline.attachment %>" alt=""></a>
                                                <%}
                                                else { %>
                                                <img class="img-responsive pad" src="<%= timeline.attachment %>" alt="">
                                                <%} %>
                                                <p><%= timeline.status.ToString() %> </p>
                                                <%--  <button type="button" class="btn btn-default btn-xs"><i class="fa fa-share"></i>Share</button>--%>
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
                    </div>
                    <!-- end right -->
                </div>
            </div>
        </div>
    </div>


    <!-- end timeline content-->

    <!--BEGIN MODAL-->
    <div class="modal fade" id="myModal" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text="Select Photo"></asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <asp:Panel ID="pnlImage" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" class="btn btn-primary btn-lg btn-block" />
                                    </div>

                                    <div class="col-md-9">
                                        <img id="imgcrop" runat="server" class="img-thumbnail" src="<%= (timeline.attachment==null)timeline.attachment?:'img/prism-1.png' %>" alt="">
                                    </div>


                                    <div class="box-body" style="display: block;">
                                    </div>
                                    <%--<div class="animated fadeInUp ">
                                        <div class="col-sm-10">
                                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
                                            <div class="span7 text-center">
                                                <img src="" id="imgcrop" runat="server" class="img-responsive" alt="sample image" />
                                            </div>

                                        </div>
                                    </div>--%>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlMap" runat="server" Visible="false">
                                <div class="row">
                                    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
                                    <div class="row">
                                        <div class="col-lg-offset-1 col-lg-8">
                                            <asp:TextBox ID="txtLocation" Class="form-control" Placeholder="Search for you location, it'll be set automatically" runat="server" Text=""></asp:TextBox>
                                        </div>
                                        <div class="col-lg-2">
                                            <asp:Button ID="btnSearch" Class="btn btn-info" runat="server" Text="Search" OnClick="FindCoordinates" />
                                        </div>
                                    </div>
                                    <br />
                                    <asp:Panel ID="pnlScripts" runat="server">
                                        <div id="dvMap" style="width: 100%; height: 450px">
                                        </div>
                                        <script type="text/javascript">
                                            var markers = [
                                            <asp:Repeater ID="rptMarkers" runat="server">
                                            <ItemTemplate>
                                                        {
                                                            "title": '<%# Eval("Address") %>',
                                                            "lat": '<%# Eval("Latitude") %>',
                                                            "lng": '<%# Eval("Longitude") %>',
                                                            "description": '<%# Eval("Address") %>'
                                                        }
                                                </ItemTemplate>
                                                <SeparatorTemplate>
                                                    ,
                                                </SeparatorTemplate>
                                            </asp:Repeater>
                                            ];
                                        </script>
                                        <script type="text/javascript">
                                            window.onload = function () {
                                                var mapOptions = {
                                                    center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                                                    zoom: 13,
                                                    mapTypeId: google.maps.MapTypeId.ROADMAP
                                                };
                                                var infoWindow = new google.maps.InfoWindow();
                                                var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                                                for (i = 0; i < markers.length; i++) {
                                                    var data = markers[i]
                                                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                                                    var marker = new google.maps.Marker({
                                                        position: myLatlng,
                                                        map: map,
                                                        title: data.title
                                                    });
                                                    (function (marker, data) {
                                                        google.maps.event.addListener(marker, "click", function (e) {
                                                            infoWindow.setContent(data.description);
                                                            infoWindow.open(map, marker);
                                                        });
                                                    })(marker, data);
                                                }
                                            }
                                        </script>
                                    </asp:Panel>
                                </div>
                            </asp:Panel>
                        </div>

                        <%--<div class="modal-footer">
                            <div class="col-lg-12">
                                <asp:FileUpload Text="Browse" class="btn btn-default btn-file" ID="btnBrowse" runat="server" ValidationGroup="validate" UseSubmitBehavior="False" OnClick="btnBrowse_Click" />
                                <asp:Button Text="Upload" class="btn btn-success" ID="btnUpload2" runat="server" ValidationGroup="validate" UseSubmitBehavior="False" />
                                <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Close</button>

                            </div>
                        </div>--%>
                    </div>
                    <asp:FileUpload ID="upload" runat="server" class="btn btn-lg btn-success" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger EventName="Click" ControlID="lnkOpenMap" />
                    <asp:PostBackTrigger ControlID="btnSearch" />
                    <asp:PostBackTrigger ControlID="btnUpload" />
                </Triggers>
            </asp:UpdatePanel>

            <%--<img src="" id="imgcrop" runat="server" class="img-responsive" alt="sample image" />--%>
            <input type="hidden" id="hdnx" runat="server" />
            <input type="hidden" id="hdny" runat="server" />
            <input type="hidden" id="hdnw" runat="server" />
            <input type="hidden" id="hdnh" runat="server" />
            <asp:Button ID="btncrop" runat="server" OnClick="btncrop_Click" Visible="false" Text="Crop Images" />
            <img id="imgcropped" runat="server" visible="false" />

            <%-- <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />--%>
            <input type="hidden" id="imageName" runat="server" />
        </div>
    </div>
    <!--END MODAL-->
</asp:Content>

