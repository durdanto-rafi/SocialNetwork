<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPhoto.aspx.cs" Inherits="SocialNetwork.ViewPhoto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Timeline container -->
    <div class="content-item grey" id="gallery-item" style="margin-top: 40px;">
        <div class="container">
            <div class="row">
                <div class="col-md-10 animated fadeInLeft">
                    <hr>
                    <div class="col-sm-8">
                        <img src="img/Photos/4.jpg" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-4">
                        <h2>Katya Angintiew</h2>
                        <div class="box">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        </div>
                        <div class="box">
                            <ul class="list-unstyled">
                                <li><i class="fa fa-calendar"></i>26/02/2014</li>
                                <li><i class="fa fa-eye"></i>125 Views</li>
                                <li><i class="fa fa-comment"></i>4 Comments</li>
                            </ul>
                        </div>
                        <a href="#" class="btn btn-info show-image">Like</a>
                        <a href="#comments" class="btn btn-info scroll">Share</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end timeline content-->
</asp:Content>
