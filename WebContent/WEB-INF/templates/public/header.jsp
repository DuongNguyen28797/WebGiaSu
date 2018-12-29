<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>GiaSu online</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/templates/public/images/gia-su-toan-ly-hoa-lop-8-9-10-11-12-tphcm.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Learn Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${pageContext.request.contextPath}/templates/public/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/templates/public/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/templates/public/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/templates/public/css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/css/jquery.countdown.css" />


<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/templates/public/css/font-awesome.css" rel="stylesheet"> 

<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="${pageContext.request.contextPath}/">Gia Sư online</a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
		       <li class="dropdown">
		         <a href="#"><i class="fa fa-user"></i><span>Đăng nhập</span></a>
		             <ul class="dropdown-menu">
			            <li><a><button data-toggle="modal" data-target="#dangnhap" name="submit" type="submit" style="width: 100%;display: inline; font-family: arial;">Phụ huynh</button></a></li>      
			            <li><a><button  data-toggle="modal" data-target="#login" name="submit" type="submit" style="width: 100%;display: inline; font-family: arial;">Gia sư</button></a></li>
			         
		             </ul>
		        </li>
		       
		        
		        <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-globe"></i><span>Đăng ký</span></a>
		            <ul class="dropdown-menu">
			            <li><a href="${pageContext.request.contextPath}/dang-ky-phu-huynh"><button style="width: 100%;display: inline; font-family: arial;">Phụ huynh</button></a></li>
			            <li><a href="${pageContext.request.contextPath}/dang-ky-gia-su"><button style="width: 100%;display: inline; font-family: arial;">Gia sư</button></a></li>
			        </ul>
		        </li>
		       
		    </ul>
	    </div>
	    <div class="clearfix"> </div>
	  </div>
	    <!--/.navbar-collapse-->
</nav>
<nav class="navbar nav_bottom" role="navigation">
 <div class="container">
 <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header nav_2">
      <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"></a>
   </div> 
   <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        <ul class="nav navbar-nav nav_1">
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
           
    		
			<li><a href="${pageContext.request.contextPath}/bai-viet">Tin tức - Bài Viết</a></li>
           
        </ul>
     </div><!-- /.navbar-collapse -->
   </div>
</nav>