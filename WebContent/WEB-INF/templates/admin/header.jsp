
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>GiaSu online</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/templates/public/images/gia-su-toan-ly-hoa-lop-8-9-10-11-12-tphcm.png">
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/templates/admin/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/templates/admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/admin/assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/admin/assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/admin/assets/lineicons/style.css">    
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/templates/admin/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/templates/admin/assets/css/style-responsive.css" rel="stylesheet">
   
    <script src="//cdn.ckeditor.com/4.6.0/full/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script> 

    <script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/js/jquery-3.1.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/templates/public/js/jquery.validate.js"></script>
    
    <link href="${pageContext.request.contextPath}/templates/admin/assets/js/gritter/css/style.css" rel='stylesheet' type='text/css' />
              
   <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
   <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
  <link href="${pageContext.request.contextPath}/templates/chatbox/css/messsages.css" rel="stylesheet">
   
   
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="${pageContext.request.contextPath}/admin" class="logo"><b>Gia Sư online</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->
                    <li class="dropdown">
                    </li>
                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="${pageContext.request.contextPath}/admin/dangky/lien-he"">
                           <a href="${pageContext.request.contextPath}/admin/dangky/lien-he""><i class="fa fa-envelope-o"></i></a> 
                        </a>
                       
                    </li>
                    <!-- inbox dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="${pageContext.request.contextPath}/logout">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->