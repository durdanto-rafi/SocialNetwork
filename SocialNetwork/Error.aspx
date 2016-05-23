<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="SocialNetwork.Error" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/favicon.png">
    <title>SonFlat</title>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/friends.css" rel="stylesheet" />
    <link href="assets/css/messages.css" rel="stylesheet" />
    <link href="assets/css/view_photo.css" rel="stylesheet" />
    <link href="bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link href="assets/css/timeline.css" rel="stylesheet" />
    <link href="assets/css/photos.css" rel="stylesheet" />
    <%--<link href="font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" />--%>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/jquery.Jcrop.css" rel="stylesheet" />
    <link href="assets/css/errors.css" rel="stylesheet" />
    
    <script src="assets/js/jquery.1.11.1.min.js"></script>
    <script src="assets/js/custom.js"></script>

    <script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="error-header"> </div>
<div class="container ">
    <section class="error-container text-center">
        <h1>500</h1>
        <div class="error-divider">
            <h2>ooops!!</h2>
            <p class="description">SESSION TIME OUT</p>
        </div>
        <a href="Login.aspx" class="return-btn"><i class="fa fa-home"></i>Login</a>
    </section>
</div>
</body>
</html>

