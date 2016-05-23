<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="SocialNetwork.Messages" %>

<%@ Import Namespace="SocialNetwork.Database" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Timeline content -->
    <div class="row">
        <div class="container" style="margin-top: 40px;">
            <div class="row">
                <div class="col-md-10 animated fadeInUp">
                    <hr>
                    <div class="row row-broken">
                        <div class="col-sm-0 col-xs-0">
                            <div class="col-inside-lg decor-default chat" style="overflow: hidden; outline: none;" tabindex="5000">
                                <div class="chat-users">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12 col-xs-12 chat" style="overflow: hidden; outline: none;" tabindex="5001">
                            <div class="col-inside-lg decor-default">
                                <div class="chat-body">
                                    <h6>Mini Chat</h6>
                                    <div class="threads">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                            <ContentTemplate>
                                                <%foreach (MiniChat message in messages)
                                                    {
                                                        if (message.Id == currentUser.id)
                                                        { %>
                                                <div class="answer right">
                                                    <div class="avatar">
                                                        <img src="<%=message.proPicture %>" alt="User name">
                                                        <div class="status offline"></div>
                                                    </div>
                                                    <div class="name"><%=message.name.ToString() %></div>
                                                    <div class="text">
                                                        <%=message.messageText %>
                                                    </div>
                                                    <div class="time"><%=message.messageTime.ToString() %></div>
                                                </div>
                                                <%}
                                                    else { %>
                                                <div class="answer left">
                                                    <div class="avatar">
                                                        <img src="<%= message.proPicture %>" alt="User name">
                                                        <div class="status offline"></div>
                                                    </div>
                                                    <div class="name"><%=message.name.ToString() %></div>
                                                    <div class="text">
                                                        <%=message.messageText %>
                                                    </div>
                                                    <div class="time"><%=message.messageTime.ToString() %></div>
                                                </div>
                                                <%  }
                                                    }%>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger EventName="Click" ControlID="btnMessageSend" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="answer-add">
                                                <%-- <input placeholder="Write a message">--%>
                                                <asp:TextBox ID="txtMessage" runat="server" placeholder="Write a message"></asp:TextBox>
                                                <span class="answer-btn answer-btn-1"></span>
                                                <asp:Button ID="btnMessageSend" runat="server" OnClick="btnMessageSend_Click" class="answer-btn answer-btn-2" />
                                                <%-- <span class="answer-btn answer-btn-2"></span>--%>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hiddenSenderId" runat="server" Value="" />
    </div>
    <!-- End Timeline content -->
    <script type="text/javascript">
        $(function () {
            $('.threads').animate({ scrollTop: $('.threads').prop("scrollHeight") }, 1000);
        });
    </script>
</asp:Content>
