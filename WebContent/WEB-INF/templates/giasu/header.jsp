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


<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/templates/public/css/font-awesome.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/templates/chatbox/css/messsages.css" rel="stylesheet">


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
	        <a class="navbar-brand" href="${pageContext.request.contextPath}/giasu">Gia Sư online</a>
	    </div>
	    <!--/.navbar-header-->
	    <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">
	        <ul class="nav navbar-nav">
		       <li class="dropdown">
		         <a href="${pageContext.request.contextPath}/giasu/tai-khoan-gia-su"><i class="fa fa-user"></i><span>Tài Khoản</span></a>    
		        </li>
		       
		        
		        <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#dangkymon"><i class="fa fa-globe"></i><span>Đăng ký</span></a>
		           
		        </li>
		        <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#lienhe"><i class="fa fa-calendar"></i><span>Liên Hệ</span></a> 
		        </li>
		        
		        <li class="dropdown">
		            <a href="#" data-toggle="modal" data-target="#dangnhap" class="dropdown-toggle" data-toggle="modal" data-target="#lienhe" onclick="return geteditDaDoc()"><i class="fa fa-tasks" ></i><span >Thông Báo <c:if test="${sothongbao > 0}"><b class="sothongbao"><span style="border: 1px solid #cc0000; border-radius: 13px; width: 23px; display: inline;background:#cc0000 " >${sothongbao}</span></b></c:if></span></a> 
		        </li>
		      
		         <li class="dropdown">
		            <a href="${pageContext.request.contextPath}/giasu/chatbox" data-toggle="modal" ><i class="fa fa-comments-o"></i><span >Messager</span></a> 
		        </li>
		        <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="modal" data-target="#naptien"><i class="fa fa-usd" aria-hidden="true"></i><span>Nạp xu</span></a> 
		        </li>
		        <li class="dropdown">
		            <a href="${pageContext.request.contextPath}/giasu/giasu-logout" ><i class="fa fa-power-off"></i><span>Đăng xuất</span></a>
		            
		        </li> 
		    </ul>
		    <script type="text/javascript">
function geteditDaDoc(){  
					$.ajax({
					url: '${pageContext.request.contextPath}/giasu/edit-da-doc',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$(".sothongbao").html(data);
					},
					error : function() {
						alert('@@');
					}
				});
				return false;   

  };
		</script>
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
            <li><a href="${pageContext.request.contextPath}/giasu">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/giasu/bai-viet">Tin tức - Bài Viết</a></li>
           
        </ul>
     </div><!-- /.navbar-collapse -->
   </div>
</nav>