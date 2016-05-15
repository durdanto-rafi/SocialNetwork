<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SocialNetwork.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Craze -</title>

    <%--<link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />--%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">
    <link rel="apple-touch-icon" href="images/icons/favicon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">


    <link href="bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link href="assets/css/timeline.css" rel="stylesheet" />
    <%--<link href="font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" />--%>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />

    <script src="assets/js/custom.js"></script>
    <script src="assets/js/jquery.1.11.1.min.js"></script>
    <script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function myClosure() {
            $(".frm").toggleClass("flipInX");
        }
    </script>

</head>
<body class="animated fadeIn">
    <div class="row row-welcome">
        <div class="login-page">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <img src="img/prism.png" class="user-avatar" />
                    <h1>People-Let</h1>
                    <form role="form" class="frm animated flipInX" runat="server">
                       <div class="form-content">
                            <div class="form-group">
                                <%--<input type="text" class="form-control input-underline input-lg" placeholder="Email" />--%>
                                <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" class="form-control input-underline input-lg" placeholder="Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <%--<input type="text" class="form-control input-underline input-lg" placeholder="Username" />--%>
                                 <asp:TextBox ID="txtUser" runat="server" class="form-control input-underline input-lg" placeholder="Username"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <%--<input type="password" class="form-control input-underline input-lg" placeholder="Password" />--%>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control input-underline input-lg" placeholder="Password"></asp:TextBox>
                            </div>
                        </div>
                        <%-- <a href="Profile.aspx" class="btn btn-info btn-lg">Log in</a>
                        <a href="#" class="btn btn-info btn-lg btn-frm">Register</a>--%>

                        <asp:Button ID="btnLog" runat="server" class="btn btn-info btn-lg" Text="Login" OnClick="btnLog_Click"/>
                        <asp:Button ID="btnReg" runat="server" class="btn btn-info btn-lg btn-frm" Text="Register" OnClick="btnReg_Click" />
                    </form>
                   
                </div>
            </div>
            <div class="row welcome-full animated fadeInLeft users-row">
                <div class="row-body hidden-xs hidden-sm">
                    <div class="welcome-users-inner">
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/guy-3.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-1.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/guy-2.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-2.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/guy-5.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-3.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/guy-8.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-4.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-4.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-7.jpg" class="img-rounded" />
                            </a>
                        </div>
                        <div class="welcome-user">
                            <a href="profile.html">
                                <img src="img/Friends/woman-7.jpg" class="img-rounded" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="container">
                    <p>
                        <div class="footer-links">
                            <a href="#">Terms of Use</a> | 
                        	<a href="#">Privacy Policy</a> | 
                        	<a href="#">Developers</a> | 
                        	<a href="#">Contact</a> | 
                        	<a href="#">About</a>
                        </div>
                        Copyright &copy; Company - All rights reserved
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

