<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/templates/taglib.jsp" %>
 <form method="post" action="javascript:void(0);">  
        <div class="modal fade" id="naptien" tabindex="-1" role="dialog" aria-labelledby="PhuHuynhDangNhap" style="font-family: arial;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header tieu-de-dang-nhap">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                        <h4 class="modal-title " id="PhuHuynhDangNhap" style="font-family: arial">Nạp web xu</h4>
                    </div>
                     <div style="margin-left: 5%; font-family: arial;line-height: 163%; margin-top: 2%">
              <h4 style="color: #f1b458;"><b>Những điều bạn cần biết:</b></h4>
               <p>- Bạn có thực hiện đầy đủ các tính năng khi Webxu của bạn >= 10.000 xu.</p>
               <p>- Qui đổi: 1.000 VNĐ = 1.000 Xu.</p>
               <p>- Khi Gia Sư đồng ý lời đề nghị của bạn thì Bạn và Gia Sư sẽ bị trừ 10.000xu.</p>
            </div> 
                    <div class="modal-body form-dang-nhap" style="width: 70%; margin-left: 15%">
                    
	    	      <div class="tieptuc">    
	    	     <div style="display: inline;">            
		            <div class="form-group">
			    <input autocomplete="off"  class="password required form-control" id="sotien" name="sotien" value="" placeholder="Nhập số tiền ..." required="required">
		            </div>
		         </div> 
		         <input style="display: none;" id="id_user" name="id_user" value="${PhuHuynhInfo.id_user}"  readonly>
		     
		    <div class="form-group">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" onclick="return getNapTien()" value="Tiếp tục" style="width: 25%; margin-left: 32%; margin-top: 3%">
		    </div>
		    </div> 
                    </div>
                </div>
            </div>
        </div>
        </form>
  <script type="text/javascript">
function getNapTien(){  
					var sotien= $("input#sotien").val();
					var id_user = $("input#id_user").val();
					$.ajax({
					url: '${pageContext.request.contextPath}/phuhuynh/nap-tien',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						sotien: sotien,
						id_user: id_user,
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$(".tieptuc").html(data);
					},
					error : function() {
						alert("@@");
					}
				});
				return false;   

  };
</script>      
        <!-- Modal -->
        <div class="modal fade" id="dangnhap" tabindex="-1" role="dialog" aria-labelledby="PhuHuynhDangNhap"  >
            <div class="modal-dialog" role="document" style="width: 60%">
                <div class="modal-content">
                    <div class="modal-header tieu-de-dang-nhap">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                        <h4 class="modal-title " id="PhuHuynhDangNhap" style="font-family: arial">Thông Báo</h4>
                    </div>
                     <div>
                     
			 <c:forEach items="${listThongBao}" var="objThongBao">
                   <c:set var="webxuhientai" value="${split.money(objThongBao.webxuhientai)}"></c:set>
                   <c:set var="webxunapvao" value="${split.money(objThongBao.webxunapvao)}"></c:set>
                  
                       <c:if test="${objThongBao.loaithongbao==1}">
                            <div class="alert alert-dismissible admission-alert" role="alert" style="background-color: white; height: 5%; margin-bottom: -4%">
		      		        <h4 class="title normal" style="display: inline;color: #f1b458; font-family: arial">Tài Khoản</h4>
							<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true"><i class="fa fa-times-circle" style="color: black;"></i></span><span class="sr-only">Close</span></button><br>
							<img alt="" src="${pageContext.request.contextPath}/templates/public/images/5663f221-d9d9d09aa7.jpg" style="width: 8%; height: 10%; margin-top:2%; display: inline;" >
							 <span style="color: black;font-family: arial">Tài khoản của bạn vừa được nạp <span style="color: #FF6A6A">${webxunapvao}</span>xu. Web xu hiện tại là: <span style="color: #FF6A6A">${webxuhientai}</span>xu.</span>
							 <p style="color: #BFC5C7;margin-left: 9%; margin-top: -2%">lúc ${objThongBao.time}</p>
							   <p style="color: black;font-family: arial; margin-left: 8%"><b style="color: #1E90FF">Lưu ý:</b> Tài khoản của bạn phải bằng hoặc lớn hơn <span style="color: #FF6A6A;">10.000</span>xu mới có thể thực hiện đầy đủ chức năng của Gia Sư</p>
							   <p style="color: #BFC5C7;margin-left: 6%">------------------------------------------------------------------------------------------------------------------------------------</p>
					</div>
                       </c:if>
                       
                        <c:if test="${objThongBao.loaithongbao==4}">
                         <div class="alert alert-dismissible admission-alert" role="alert" style="background-color: white; margin-bottom: -4%">
			             <h4 class="title normal" style="display: inline;color: #f1b458; font-family: arial">Kết Nối</h4>
						 <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true"><i class="fa fa-times-circle" style="color: black;"></i></span><span class="sr-only">Close</span></button><br>
						 <img alt="" src="${pageContext.request.contextPath}/templates/public/images/12be13beee21399fd898bdabff3d52bd_user-free-icon-73-00kb-user-account-clipart_256-256.jpeg" style="width: 8%; height: 8%; display: inline;" >
						 <span style="color: black;font-family: arial">Gia Sư <span style="color: #0000FF"><b>${objThongBao.name_giasu}</b></span> đã đồng ý lời đề nghị của bạn.</br><p style="margin-left: 10%; margin-top: -2%; margin-bottom: 2%"> Và web xu của bạn bị trừ <span style="color: #FF6A6A;">10.000</span> xu.</p></span>
						 <p style="color: #BFC5C7;margin-left: 9%; margin-top: -2%">lúc ${objThongBao.time}</p>
						 <p style="color: #BFC5C7;margin-left: 6%">------------------------------------------------------------------------------------------------------------------------------------</p>
					</div>			
                    </c:if>
                 
                 
                  <c:if test="${objThongBao.loaithongbao==5}">
                         <div class="alert alert-dismissible admission-alert" role="alert" style="background-color: white; margin-bottom: -4%">
			             <h4 class="title normal" style="display: inline;color: #f1b458; font-family: arial">Kết Nối</h4>
						 <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true"><i class="fa fa-times-circle" style="color: black;"></i></span><span class="sr-only">Close</span></button><br>
						 <img alt="" src="${pageContext.request.contextPath}/templates/public/images/12be13beee21399fd898bdabff3d52bd_user-free-icon-73-00kb-user-account-clipart_256-256.jpeg" style="width: 8%; height: 8%; display: inline;" >
						 <span style="color: black;font-family: arial">Gia Sư <span style="color: #0000FF"><b>${objThongBao.name_giasu}</b></span> đã từ chối lời đề nghị của bạn.</br><p style="margin-left: 10%; margin-top: -2%; margin-bottom: 2%"> Lí do: ${objThongBao.lido}</p></span>
						 <p style="color: #BFC5C7;margin-left: 9%; margin-top: -2%">lúc ${objThongBao.time}</p>
						 <p style="color: #BFC5C7;margin-left: 6%">------------------------------------------------------------------------------------------------------------------------------------</p>
					</div>			
                    </c:if>
                    
              </c:forEach>       
              	
		 <div class="alert alert-dismissible admission-alert" role="alert" style="background-color: #EEEEEE">
			<a href="${pageContext.request.contextPath}/phuhuynh/thong-bao" style="font-family: arial;margin-left: 42%">Xem tất cả</a>
								
                     </div>
                </div>
            </div>
        </div>
        </div>
     <!-- Modal -->
        <form id="contactForm1" method="post" action="javascript:void(0);">  
        <div class="modal fade" id="lienhe" tabindex="-1" role="dialog" aria-labelledby="PhuHuynhDangNhap" >
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header tieu-de-dang-nhap">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                        <h4 class="modal-title " id="PhuHuynhDangNhap" style="font-family: arial">Gửi Liên Hệ</h4>
                    </div>
                    <div class="modal-body form-dang-nhap" style="width: 70%; margin-left: 15%">
                    <div class="dagui">
                    
                    </div>
	    	                 <p class="lead" style="margin-left: 30%">Send to Admin !</p>
	    	      <div>    
	    	           
	    	     <div style="display: inline;">            
		             <div class="form-group">
			             <input autocomplete="off"  class="password required form-control" id="fullname" name="fullname"  value="${PhuHuynhInfo.fullname}" readonly>
		            </div>
		            <div class="form-group">
			    <input autocomplete="off"  class="password required form-control" id="email" name="email" value="${PhuHuynhInfo.email}" readonly>
		            </div>
		            <div class="form-group">
			    <input autocomplete="off"  class="password required form-control" id="phone" name="phone" value="${PhuHuynhInfo.phone}" readonly>
		            </div>
		         </div> 
		        <input style="display: none;" id="picture" name="picture" value="${pageContext.request.contextPath}/files/${PhuHuynhInfo.picture}"  readonly>
		         <input style="display: none;" id="id_nguoigoi" name="id_nguoigoi" value="${PhuHuynhInfo.id_user}"  readonly>
		            <textarea  class="password required form-control" id="noidung"  name="noidung" placeholder="Nhập nội dung muốn gửi" rows="4" style="border: solid;-moz-border-radius: 10px;-webkit-border-radius: 10px;font-family: arial;"></textarea>
		     </div> 
		    <div class="form-group">
		    	<input type="submit" class="btn btn-primary btn-lg1 btn-block" onclick="return getLienHe()" value="Send">
		    </div>
		    
                    </div>
                </div>
            </div>
        </div>
        </form>
     <script type="text/javascript">
function getLienHe(){  
					var fullname= $("input#fullname").val();
					var email = $("input#email").val();
					var id_nguoigoi = $("input#id_nguoigoi").val();
					var picture= $("input#picture").val();
					var phone= $("input#phone").val();
					var noidung = $("textarea#noidung").val();
					
					$.ajax({
					url: '${pageContext.request.contextPath}/admin/dangky/lien-he',
					type : 'POST',
					cache : false, //True khi muon luu lai cac requet .
					data : {
						fullname: fullname,
		                phone: phone,
		                email: email,
		                id_nguoigoi: id_nguoigoi,
		                picture: picture,
		                noidung: noidung,
		                
					//Dữ liệu gửi đi
					},
					success : function(data) {
						$('#contactForm1').trigger("reset");
						$(".dagui").html(data);
					},
					error : function() {
						$('#contactForm1').trigger("reset");
						
					}
				});
				return false;   

  };
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