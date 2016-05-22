﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListUsers.aspx.cs" Inherits="SocialNetwork.ListUsers" %>

<%@ Import Namespace="SocialNetwork.Database" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Timeline content -->
    <div class="container" style="margin-top: 40px;">
        <div class="col-md-10  animated fadeInUp">
            <hr>
            <div class="widget">
                <div class="table-responsive">
                    <table class="table user-list">
                        <thead>
                            <tr>
                                <th><span>User</span></th>
                                <th><span>Created</span></th>
                                <th class="text-center"><span>Status</span></th>
                                <th><span>Email</span></th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach (User user in users)
                                {%>
                            <tr>
                                <td>
                                    <img src="<%=user.profilePic %>" alt="">
                                    <a href="Profile.aspx?id=<%=user.id.ToString() %>" class="user-link"><%=user.name %></a>
                                    <span class="user-subhead"></span>
                                </td>
                                <td><%=user.joinDate.ToString() %>
                                </td>
                                <td class="text-center">
                                    <span class="label label-default">Inactive</span>
                                </td>
                                <td>
                                    <a href="#"><%=user.email.ToString() %></a>
                                </td>
                                <td style="width: 20%;">
                                    <a href="#" class="table-link">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                    <a href="#" class="table-link">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                    <a href="#" class="table-link danger">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <ul class="pagination pull-right">
                    <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- end timeline content-->
</asp:Content>
