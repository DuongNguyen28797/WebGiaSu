<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp"%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/templates/admin/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/templates/admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/templates/admin/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/templates/admin/assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  	
	  	<c:if test="${param['error'] eq 'loginErr' }">
         <h3 style="color:#ffd777; margin-left: 35%; margin-top: 7%;">Sai UserName hoặc PassWord !</h3>
            </c:if>
	  	
		      <form class="form-login" action="${pageContext.request.contextPath}/login" method="post">
		        <h2 class="form-login-heading">Đăng nhập</h2>
		        <div class="login-wrap">
		            <input type="text" name="username" class="form-control" placeholder="User ID" autofocus>
		            <br>
		            <input type="password" name="password" class="form-control" placeholder="Password">
		            <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>
		
		                </span>
		            </label>
		            <div class="form-group">
				        <input type="checkbox" id="c1" name="cc" />
						<label for="c1"><span></span>Remember me</label>
				</div>
		            <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
		            <hr>
		            
		            
		            <div class="registration">
		               
		            </div>
		
		        </div>
		
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <h4 class="modal-title">Bạn đã quên mật khẩu ?</h4>
		                      </div>
		                      <div class="modal-body">
		                          <p>Nhập Email của bạn đã đăng kí, chúng tôi sẽ gửi mật khẩu đến Email của bạn.</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button class="btn btn-theme" type="button">Submit</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/templates/admin/assets/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/templates/admin/assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/templates/admin/assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("${pageContext.request.contextPath}/templates/admin/assets/img/login-bg.jpg", {speed: 500});
    </script>


  </body>
</html>
    