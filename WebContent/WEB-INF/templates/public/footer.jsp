<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


  <!-- Modal -->
        <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header tieu-de-dang-nhap">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title " id="myModalLabel" style="font-family: arial">Đăng nhập gia sư</h4>
                    </div>
                    <div class="modal-body form-dang-nhap">
                        <form class="login" action="${pageContext.request.contextPath}/dang-nhap-gia-su" method="post">
	    	                 <p class="lead">Welcome Back!</p>
		             <div class="form-group">
			             <input type="text" name="username" class="required form-control" placeholder="Username" autofocus>
		            </div>
		            <div class="form-group">
			    <input type="password" class="password required form-control" placeholder="Password" name="password">
		            </div>
		    <div class="form-group">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Log In">
		    </div>
	        
		 </form>
		
                    </div>
                </div>
            </div>
        </div>
        
     <!-- Modal -->
    
        <!-- Phụ huynh đăng nhập -->
        <!-- Modal -->
        <div class="modal fade" id="dangnhap" tabindex="-1" role="dialog" aria-labelledby="PhuHuynhDangNhap" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header tieu-de-dang-nhap">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                        <h4 class="modal-title " id="PhuHuynhDangNhap" style="font-family: arial">Đăng nhập phụ huynh</h4>
                    </div>
                    <div class="modal-body form-dang-nhap">
                             <form class="login" action="${pageContext.request.contextPath}/dang-nhap-phu-huynh" method="post">
	    	                 <p class="lead">Welcome Back!</p>
		             <div class="form-group">
			             <input autocomplete="off" type="text" name="username" class="required form-control" placeholder="Username">
		            </div>
		            <div class="form-group">
			    <input autocomplete="off" type="password" class="password required form-control" placeholder="Password" name="password">
		            </div>
		    <div class="form-group">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="Log In">
		    </div>
	        
		 </form>
		
                    </div>
                </div>
            </div>
        </div>
        





<script type="text/javascript">
$(document).ready(function() {
    $( ".andi" ).click(
      function() {
        $("#pop-up").addClass( "hidden" );
      }
    );
  }); 

</script>
   <div class="footer">
    	<div class="container" style="font-family: arial;">
    		<div class="col-md-3 grid_4" style="width: 53%">
    		   <h3>About Us</h3>	
    		   <p>"Website Gia sư Online là website dùng để kết nối giữa gia sư và phụ huynh. Phụ huynh và gia sư có thể đăng ký tài khoản. Phụ huynh có thể tìm kiếm gia sư và gửi lời mời đề nghị đến gia sư nếu muốn. Gia sư có thể đồng ý hoặc không đồng ý đối với lời đề nghị của phụ huynh. Khi cả hai người đều hợp tác với nhau, cả hai đều bị trừ một số tài khoản là 10.000 xu. Phụ huynh có thể bình luận, gửi tin nhắn, like hoặc bầu chọn cho gia sư. Phụ huynh hoặc gia sư đều có thể hủy hợp tác bất kỳ lúc nào "</p>
    		      <ul class="social-nav icons_2 clearfix">
                    <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" class="facebook"> <i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a></li>
                 </ul>
    		</div>
    		<div class="col-md-3 grid_4">
    		   
    		</div>
    		<div class="col-md-3 grid_4">
    		  
    		</div>
    		<div class="col-md-3 grid_4">
    		   
            </div>
    		<div class="clearfix"> </div>
    		<div class="copy">
		       <p></p>
	        </div>
    	</div>
    </div>
<script src="${pageContext.request.contextPath}/templates/public/js/jquery.countdown.js"></script>
<script src="${pageContext.request.contextPath}/templates/public/js/script.js"></script>
</body>
</html>	